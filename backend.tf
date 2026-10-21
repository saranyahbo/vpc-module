terraform {
    backend "s3" {
        bucket = "learn-eks-cluster-tfstate-bucket"
        key    = "vpc/terraform.tfstate"
        region = "us-east-1"
    }
}