require "refile/s3"
require 'refile/simple_form'

aws = {
    access_key_id: ENV['S3_key_id'],
    secret_access_key: ENV['S3_access_key'],
    region: "eu-central-1",
    bucket: "esorochka",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)

Refile.cdn_host = "cdn.sorochkaopt.com"
