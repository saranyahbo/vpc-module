terraform {
    backend "s3" {
        bucket = "learn-eks-cluster-tfstate1"
        key    = "vpc/terraform.tfstate"
        region = "us-east-1"
    }
}