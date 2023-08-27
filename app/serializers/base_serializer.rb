# panko serializer を継承したベースクラス。V1 serializer はこのクラスを継承する。
# https://github.com/panko-serializer/panko_serializer
# https://panko.dev/docs/
class BaseSerializer < Panko::Serializer
  def self.serialize(resources, options = {})
    # 呼び出し側で context を指定していないと、serializer 内で context が nil になる。
    # context[:foo].present? といったように条件の存在確認をするときに、
    # 毎回 context が nil かどうかの判定をしなくて済むよう空のHashで初期化しておく。
    options[:context] ||= {}

    # シリアライズの対象が単体のオブジェクトか配列かで使うAPIが異なるが、
    # 使う側はその違いを意識しなくて良いようにここで差分を吸収する。
    serialized = if resources.is_a? Enumerable
                   Panko::ArraySerializer.new(resources, { each_serializer: self }.merge(options))
                 else
                   self.new(options).serialize(resources)
                 end

    # JSON をネストするには Panko::Response を使う必要がある。
    # https://panko.dev/docs/response-bag
    if options[:root_key].present? && options[:meta].present?
      return Panko::Response.new({ options[:root_key] => serialized, **options[:meta] })
    end

    serialized
  end
end