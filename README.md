# terraform-module-epsagon

Terraform module to apply observability to serverless applications.

## [AWS](https://github.com/ronnathaniel/terraform-module-epsagon/tree/main/aws)



### [Lambda](https://github.com/ronnathaniel/terraform-module-epsagon/tree/main/aws/lambda)

Lambda Functions can overlay layers onto the function package, allowing for inclusion of additional code. 

The Epsagon Terraform function manager will inject the Epsagon tracing agent into the function as an overlay, 
configure appropriate environment variables to enable automatic tracing, and let the tracing agent
do its thing!