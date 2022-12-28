provider "aws" {
	region = "ap-northeast-2"
}

variable "user_names" {
	description = "Create IAM users with these names"
		type = list(string)
		default = ["aws11-neo", "aws11-trinity", "aws11-morpheus"]
}

resource "aws_iam_user" "example" {
	count = length(var.user_names)
	name = var.user_names[count.index]
}

output "neo_arn" {
	value = aws_iam_user.example[*].arn
}

