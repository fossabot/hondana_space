Rails.application.config.sorcery.submodules = [:external]

Rails.application.config.sorcery.configure do |config|
  config.external_providers = [:google]
  config.google.key = ENV["GOOGLE_KEY"]
  config.google.secret = ENV["GOOGLE_SECRET"]
  config.google.callback_url = ENV["GOOGLE_CALLBACK_URL"]
  config.google.user_info_mapping = {
    name: "name"
  }
  config.google.scope = "https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile"
  config.user_config do |user|
    user.authentications_class = Authentication
  end
  config.user_class = "User"
end
