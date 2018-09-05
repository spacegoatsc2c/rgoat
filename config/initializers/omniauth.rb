Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :bnet,
            Rails.application.credentials.bnet[:api_key],
            Rails.application.credentials.bnet[:secret_key],
            scope: "wow.profile"
end
