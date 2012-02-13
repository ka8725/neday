if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => Settings.s3.access_key_id,
      :aws_secret_access_key  => Settings.s3.secret_access_key,
      :region                 => 'eu-west-1'
    }
    config.fog_directory  = 'neday'
  end
end

