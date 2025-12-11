# Upload testfile_10rows.csv from Downloads to S3

$bucketName = "cobl-001-primary-bucket"
$filePath = "C:\Users\algorims\Downloads\testfile_10rows.csv"
$key = "testfile_10rows.csv"

# Upload file to S3
aws s3 cp $filePath s3://$bucketName/$key --region us-east-1

Write-Host "File uploaded to $bucketName/$key"
