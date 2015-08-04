
 ### 노승호  AWS 개인개정에 일단 업로드 

CarrierWave.configure do |config|
  #config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJHTKTSXWZ3HQO2UA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-1'                  # optional, defaults to 'us-east-1'
  }
 
  config.fog_directory  = 'skku'                          # required
 
 end
 
