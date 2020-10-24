# terraform-module-epsagon

Terraform modules to apply observability to serverless applications.

Powered by Epsagon.




### [AWS Lambda](https://github.com/ronnathaniel/terraform-module-epsagon/tree/main/modules/aws_trace_layer)

Lambda Functions can overlay layers onto the function package, allowing for inclusion of additional code. 

The Epsagon Terraform function manager will inject the Epsagon tracing agent into the function as an overlay, 
configure appropriate environment variables to enable automatic tracing, and let the tracing agent
do its thing!


### Structure

    .
    ├── LICENSE
    ├── README.md
    ├── examples/
    │    └── aws/
    │        ├── integration/
    │        └── lambda/
    └── modules/
        └── aws_trace_layer/

