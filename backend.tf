terraform {
    backend "s3" {
        bucket = "learn-eks-cluster-tfstate"
        key    = "vpc/terraform.tfstate"
        region = "us-east-1"
    }
}