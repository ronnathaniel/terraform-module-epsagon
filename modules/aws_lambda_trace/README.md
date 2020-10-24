

# Lambda Functions

Adding automatic tracing to a Lambda function can be done in a few short steps:

### Usage

1) Import Epsagon tracing agent
    
       module "epsagon_agent" {
           source = "github.com/ronnathaniel/terraform-modules-epsagon/modules/aws_lambda_trace"
       }
2) Inject agent through a layer

       resource "aws_lambda_function" "example" {
       
           // make sure runtime matches layer
           runtime = "python3.8"
           layers  = [
               module.epsagon_agent.layer_python_arn
           ]
       
       }
       
3) Enable auto-tracing with environment variables

       resource "aws_lambda_function" "example" {
       
           environment {
               variables = {
                   EPSAGON_TOKEN       = "<EPSAGON-TOKEN>"
                   EPSAGON_APP_NAME    = "<APP-NAME>"
                   AUTOWRAPT_BOOTSTRAP = "epsagon"
               }
           }
       
           // make sure runtime matches layer
           runtime = "python3.8"
           layers  = [
               module.agent.layer_python_arn
           ]
      
       }
  
## Tracing Layers

Currently, auto-tracing is only supported in Python and Node applications.

Layers are added to functions through their ARNs. Exported ARNs include:

`layer_python_arn` 

- supported runtimes: python3.6, python3.7, python3.8

`layer_node_arn` 

- supported runtimes: nodejs12

## Examples

An example can be found in [examples](https://github.com/ronnathaniel/terraform-modules-epsagon/tree/main/examples/aws/lambda).

