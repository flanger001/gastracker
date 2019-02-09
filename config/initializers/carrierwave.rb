CarrierWave.configure do |config|
  config.storage = :aws
  config.aws_bucket = ENV["AWS_BUCKET_NAME"]
  config.aws_acl = ENV["AWS_BUCKET_ACL"]

  config.aws_attributes = {
    cache_control: "max-age=#{365.day.to_i}",
  }

  config.aws_credentials = {
    access_key_id: ENV["AWS_ACCESS_KEY_ID"],
    secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    region: ENV["AWS_BUCKET_REGION"],
  }

  config.cache_dir = "#{Rails.root}/tmp/uploads"
end
