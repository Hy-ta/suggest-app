# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

if Rails.env.production?
    CarrierWave.configure do |config|
        config.fog_provider = 'fog/aws'
        config.fog_credentials = {
            provider: 'AWS',
            region: 'ap-northeast-1',
            aws_access_key_id: ENV['aws_access_key_id'],
            aws_secret_access_key: ENV['aws_secret_access_key']
        }

        config.fog_directory = ENV['AWS_S3_BUCKET']
        config.fog_attributes = { cache_control: "public, max-age=#{365.days.to_i}" }
    end

    CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/
end