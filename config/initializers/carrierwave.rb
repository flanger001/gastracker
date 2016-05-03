CarrierWave.configure do |config|
  config.fog_credentials = {
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    provider: 'AWS',
    region: 'us-west-2',
    host: ENV['FOG_HOST']
  }
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  config.fog_directory = ENV['FOG_DIRECTORY']
  config.fog_public = false
end
