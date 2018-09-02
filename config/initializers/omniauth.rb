Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :bnet, ENV['BNET_API'], ENV['BNET_SECRET'], scope: "wow.profile"
end
