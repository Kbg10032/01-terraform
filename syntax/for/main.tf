provider "local" {
}

variable "names" {
  description = "Names to render"
  type = list(string)
  default = ["aws11-neo", "aws11-trinity", "aws11-morpheus"]
}

output "for_directive" {
  value = <<EOF
%{~ for name in var.names }
  ${name}
%{~ endfor }
EOF
}

