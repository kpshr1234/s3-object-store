
provider "aws" {
  region     = "eu-central-1"
  access_key = var.access_key
  secret_key = var.secret_key
  version = "~> 3.0"
}
terraform {
  backend "local" {
  }
}

resource "aws_s3_bucket" "obj_store" {
  bucket = var.object_store_name
  acl    = "private" 
  tags = {
    Name        = "obj_store"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "obj_1" {
	bucket = aws_s3_bucket.obj_store.id
	key = "obj_1"
	source = "./files/obj1.txt"
}

resource "aws_s3_bucket_object" "obj_2" {
	bucket = aws_s3_bucket.obj_store.id
	key = "obj_2"
	source = "./files/obj2.html"
}

resource "aws_s3_bucket_object" "obj_3" {
	bucket = aws_s3_bucket.obj_store.id
	key = "obj_3"
	source = "./files/obj3.txt"
}

resource "aws_s3_bucket_object" "obj_4" {
	bucket = aws_s3_bucket.obj_store.id
	key = "obj_4"
	source = "./files/obj4.png"
}
