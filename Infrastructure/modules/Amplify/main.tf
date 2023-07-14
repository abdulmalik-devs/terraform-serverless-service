resource "aws_amplify_app" "webapp" {
  name       = "${var.amplify_name}"
  repository = "https://github.com/abdulmalik-devs/my_app.git"

    # GitHub personal access token
  access_token = "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"

  # The default build_spec added by the Amplify Console for html code.
  build_spec = <<-EOT
    version: 0.1
    frontend:
      phases:
        build:
          commands:
            - echo "Skipping build phase"
      artifacts:
        baseDirectory: /
        files:
          - '**/*'
  EOT

  # The default rewrites and redirects added by the Amplify Console.
  custom_rule {
    source = "/<*>"
    status = "404"
    target = "/index.html"
  }

  environment_variables = {
    ENV = "test"
  }
}

