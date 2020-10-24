
resource "aws_lambda_layer_version" "epsagon_agent_python" {
  //  provider = aws.main
  layer_name          = "epsagon_agent_layer_python"
  filename            = "${path.module}/build/layer_package_python.zip"
  compatible_runtimes = ["python3.6", "python3.7", "python3.8"]
  description         = "epsagon layer for python"
  source_code_hash    = filebase64sha256("${path.module}/build/layer_package_python.zip")

}


resource "aws_lambda_layer_version" "epsagon_agent_node" {
  //  provider = aws.main
  layer_name          = "epsagon_agent_layer_node"
  filename            = "${path.module}/build/layer_package_node.zip"
  compatible_runtimes = ["nodejs12.x"]
  description         = "epsagon layer for node"
  source_code_hash    = filebase64sha256("${path.module}/build/layer_package_node.zip")
}
