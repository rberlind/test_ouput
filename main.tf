variable "user_name" {
  default = "vinnietestuser"
 }

resource "aws_iam_user" "u" {
  name          = "${var.user_name}"
  path          = "/"
  force_destroy = true
}

resource "aws_iam_user_login_profile" "u" {
  user    = "${aws_iam_user.u.name}"
  pgp_key = "keybase:vinnieramz"
}

output "password" {
  value = "${aws_iam_user_login_profile.u.encrypted_password}"
}
