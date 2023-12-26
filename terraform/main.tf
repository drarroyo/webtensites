provider "aws" {
  region = "eu-south-2" 
}

resource "webtensites" "wts_lambda" {
  function_name    = "webtensites_bash"
  handler          = "index.handler"
  runtime          = "python3.8"
  filename         = "webten_save_count.zip"
  source_code_hash = filebase64("${path.module}/webten_save_count.zip")

  # Running bash script
  environment {
    variables = {
      SCRIPT_COMMAND = "./save_and_count.sh"
    }
  }
}
