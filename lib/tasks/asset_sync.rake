# frozen_string_literal: true

desc 'Sync assets'
task :sync_assets do
  bucket = Rails.application.credentials.aws[:s3_bucket_name]
  region = Rails.application.credentials.aws[:s3_region]
  sh "aws s3 sync public/assets s3://#{bucket}/assets --exclude '.sprockets-manifest-*' --region #{region}"
  sh "aws s3 sync public/packs s3://#{bucket}/packs --exclude '*.map' --exclude 'manifest.json*' --region #{region}"
end
