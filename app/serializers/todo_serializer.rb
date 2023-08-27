class TodoSerializer < BaseSerializer
  attributes(
    :id,
    :user_id,
    :title,
    :completed
  )

  def id
    object.id.to_s
  end
end
