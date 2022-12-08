resource "aws_s3_bucket" "env_website" {
  bucket = "${var.environment}.${var.domain}"
}

resource "aws_s3_bucket_website_configuration" "env_website_config" {
  bucket = aws_s3_bucket.env_website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_acl" "env_website_acl" {
  bucket = aws_s3_bucket.env_website.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "env_website_policy" {  
  bucket = aws_s3_bucket.env_website.id
  policy = <<POLICY
{    
    "Version": "2012-10-17",    
    "Statement": [        
      {            
          "Sid": "PublicReadGetObject",            
          "Effect": "Allow",            
          "Principal": "*",            
          "Action": [                
             "s3:GetObject"            
          ],            
          "Resource": [
             "arn:aws:s3:::${aws_s3_bucket.env_website.id}/*"            
          ]        
      }    
    ]
}
POLICY
}
