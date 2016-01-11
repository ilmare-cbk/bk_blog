CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJG4ZNEQPYDGZ3IHQ',       # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2'                   # optional, defaults to 'us-east-1'
  }
  config.fog_directory  = 'boblog'                          # required
end