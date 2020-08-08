Raven.configure do |config|
  config.dsn = "https://#{Rails.application.credentials.sentry[:username]}:#{Rails.application.credentials.sentry[:password]}@sentry.io/#{Rails.application.credentials.sentry[:project_id]}"
  config.environments = %w[production]
  config.ssl_verification = false
end
