Raven.configure do |config|
  config.dsn = "https://#{ENV.fetch("SENTRY_USERNAME")}:#{ENV.fetch("SENTRY_PASSWORD")}@sentry.io/#{ENV.fetch("SENTRY_PROJECT_ID")}"
  config.environments = %w(production)
  config.ssl_verification = false
end
