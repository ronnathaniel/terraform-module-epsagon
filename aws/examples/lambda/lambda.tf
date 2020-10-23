
resource "aws_iam_role" "lambda" {
  name = "lambda_iam"

  assume_role_policy = file("${path.module}/lambda_assume_policy.json")
}

module "agent" {
  source = "../../modules/tracing_agent_layer"

  //  providers = {
  //    aws = aws.main
  //  }
}

//data "archive_file" "lambda-archive" {
//  type = "zip"
//  source_file = "${path.module}/src/main.py"
//  output_path = "${path.module}/function_package.zip"
//}

resource "aws_lambda_function" "tf_test" {
  function_name = "tf_test_ron"
  handler       = "main.handler"
  role          = aws_iam_role.lambda.arn
  runtime       = "python3.8"

  filename         = "function_package.zip"
  source_code_hash = filebase64sha256("build/function_package.zip")

  layers = [
    module.agent.layer_python_arn
  ]

  environment {
    variables = {
      KEY                 = "val"
      EPSAGON_TOKEN       = "87a6f6b4-b796-455d-9d5e-bba5119c7d87"
      EPSAGON_APP_NAME    = "terraform-store"
      AUTOWRAPT_BOOTSTRAP = "epsagon"
    }
  }
}