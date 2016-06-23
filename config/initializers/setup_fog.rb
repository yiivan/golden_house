CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     ENV['aws_access_key_id'],
    aws_secret_access_key: ENV['aws_secret_access_key'],
    region:                'us-west-2'   # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'goldenhouse'
  config.fog_public     = false
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
end
