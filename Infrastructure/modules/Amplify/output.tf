output "app_url" {
  value = "https://${aws_amplify_app.webapp.default_domain}"
}