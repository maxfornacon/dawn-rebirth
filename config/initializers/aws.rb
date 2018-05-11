Aws.config.update(
  region: 'us-east-1',
  endpoint: "http://176.9.106.52:9000",
  force_path_style: true,
  credentials: Aws::Credentials.new(
    "ENV['MINIO_KEY1']",
    "ENV['MINIO_KEY2']"
  )
)
