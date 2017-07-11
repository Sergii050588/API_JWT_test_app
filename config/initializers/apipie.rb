Apipie.configure do |config|
  config.app_name                = "JwtDeviseApp"
  config.copyright = "&copy; 2017 Sergiy Melnichenko"
  config.api_base_url            = ""
  config.doc_base_url            = "/apipie"
  config.markup = Apipie::Markup::Markdown.new
  config.api_routes = Rails.application.routes
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/{[!concerns/]**/*,*}.rb"
end
