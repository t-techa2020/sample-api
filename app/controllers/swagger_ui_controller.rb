class SwaggerUiController < ActionController::Base
  def v1
    @swagger_json_path = swagger_ui_v1_json_path
    render :index, layout: false
  end

  def v1_json
    render json: openapi_json('v1')
  end

  def openapi_json(version)
    openapi_yaml = File.read(Rails.root.join('doc', version, 'openapi.yml'))
    JSON.pretty_generate YAML.safe_load openapi_yaml
  end
end