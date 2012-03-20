if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => ENV['AWS_KEY'],
      :aws_secret_access_key => ENV['AWS_SECRET'],
      :region                => ENV['AWS_REGION']
    }
    config.fog_directory = ENV['AWS_BUCKET']
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'
  end
end
