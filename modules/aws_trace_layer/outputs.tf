
output "layer_python_arn" {
  value = aws_lambda_layer_version.epsagon_agent_python.arn
}

output "layer_node_arn" {
  value = aws_lambda_layer_version.epsagon_agent_node.arn
}
