#!/bin/bash
echo "Welcome to Get Started With Scalr On AWS"
read -p "What is your Scalr API token? " token
read -p "What is your account name? " account
read -p "What is your organization name? " organization
echo "terraform {
  backend \"remote\" {
    hostname     = \"$account.scalr.io\"
    organization = \"$organization\"
    workspaces {
      name = \"scalr-get-started-aws\"
    }
  }
}

provider \"aws\" {
  region = \"us-east-2\"
}

resource \"aws_instance\" \"scalr\" {
  ami           = \"ami-07efac79022b86107\"
  instance_type = \"t2.micro\"
}" > main.tf

echo "credentials \"$account.scalr.io\" {
  token = \"$token\"
}" >> ~/.terraformrc
