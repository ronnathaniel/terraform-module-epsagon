

# Lambda Functions

Adding automatic tracing to a Lambda function can be done in a few short steps.

1) Create Epsagon agent module
    
       module "epsagon_agent" {
           source = "github.com/ronnathaniel/terraform-modules-epsagon/aws/modules/tracing_agent_layer"
       }
2) Add layer to function resource

       resource "aws_lambda_function" "function_name" {
           
       
       }