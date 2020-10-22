
resource "aws_lambda_layer_version" "epsagon_agent_python" {
  layer_name = "epsagon_agent_layer_python"
}


resource "aws_lambda_layer_version" "epsagon_agent_node" {
  layer_name = "epsagon_agent_layer_node"
}