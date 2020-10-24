

module "agent" {
  source = "github.com/ronnathaniel/terraform-modules-epsagon/modules/aws_trace_layer"

  //  providers = {
  //    aws = aws.main
  //  }
}


resource "aws_iam_role" "lambda" {
  name = "lambda_iam"
  assume_role_policy = file("${path.module}/lambda_assume_policy.json")
}

resource "aws_iam_policy" "lambda_log" {
  policy = file("${path.module}/lambda_log_policy.json")
}

resource "aws_iam_role_policy_attachment" "lambda_log" {
  policy_arn = aws_iam_policy.lambda_log.arn
  role = aws_iam_role.lambda.name
}


resource "aws_lambda_function" "tf_test" {
  function_name = "tf_test_ron_double"
  handler       = "main.handler"
  role          = aws_iam_role.lambda.arn
  runtime       = "python3.8"

  filename         = "build/function_package.zip"
  source_code_hash = filebase64sha256("build/function_package.zip")

  layers = [
    module.agent.layer_python_arn
  ]

//  depends_on = [
//    aws_iam_role_policy_attachment.lambda_logs,
//  ]

  environment {
    variables = {
      EPSAGON_TOKEN       = "87a6f6b4-b796-455d-9d5e-bba5119c7d87"
      EPSAGON_APP_NAME    = "terraform-store"
      AUTOWRAPT_BOOTSTRAP = "epsagon"
      EPSAGON_DEBUG       = true
    }
  }
}