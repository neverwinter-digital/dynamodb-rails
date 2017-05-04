require 'aws-sdk'

Aws.config.update({
  region: ENV['region'],
  credentials: Aws::Credentials.new(ENV['aws_ak'], ENV['aws_sk'])
})