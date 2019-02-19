provider "nomad" {
	address = "https://127.0.0.1:4646"
	region = ""
}

variable "version" {
	default = "latest"
}

# TODO: setup local docker registry service, use this as a variable
data "template_file" "job" {
	template = "${file("${path.module}/blog.hcl.tmpl")}"
	vars {
		version = "${var.version}"
	}
}

resource "nomad_job" "blog" {
	jobspec = "${data.template_file.job.rendered}"
}
