CarrierWave.configure do |config|
  config.fog_credentials = {
    :provider               => 'AWS',
    :aws_access_key_id      => 'AKIAISG2NZJDCFCR7QFQ',
    :aws_secret_access_key  => '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',
    :region                 => 'eu-west-1'
  }
  config.fog_directory  = 'neday'
end
