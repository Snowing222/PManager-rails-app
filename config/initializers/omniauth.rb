Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.allowed_request_methods = [:post, :get]
  provider :google_oauth2, ENV['GOOGLECLIENTID'], ENV['GOOGLECLIENTSECRET']
end



