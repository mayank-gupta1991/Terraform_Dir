terraform {
    backend "s3" {
        bucket         = "mystatefiles3bucketfornihaldatatoecheck"
        key            = "terraform.tfstate"
        region         = "us-east-1"
        use_lockfile = true
        encrypt = true
    }
}
