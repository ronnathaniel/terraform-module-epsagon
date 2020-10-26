# terraform-module-epsagon

Terraform modules to apply observability to serverless applications.

Powered by Epsagon.


## Modules



### [AWS Lambda](https://github.com/ronnathaniel/terraform-module-epsagon/tree/main/modules/aws_lambda_trace#readme)

The Epsagon Terraform Lambda tracer will inject the Epsagon tracing agent into the function as an overlay, 
configure appropriate environment variables to enable automatic tracing, and let the tracing agent
do its thing!


## Installation

Terraform is required for use of these modules.

To install Terraform, simply run

- with Homebrew
    
      brew tap hashicorp/tap
      brew install hashicorp/tap/terraform

- with Chocolatey

      choco install terraform
      
- with Yum

      sudo yum install -y yum-utils
      sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
      sudo yum -y install terraform






### Structure

    .
    ├── LICENSE
    ├── README.md
    ├── examples/
    │   └── aws/
    │       ├── integration/
    │       └── lambda/
    └── modules/
        └── aws_lambda_trace/

