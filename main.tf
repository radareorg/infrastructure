provider "nomad" {
	address = "https://127.0.0.1:4646"
	region = ""
}

# TODO: setup local docker registry service, use this as a variable
# TODO: setup SSL certificates for all domains
# TODO: setup DNS for all domains
data "template_file" "job" {
	template = "${file("${path.module}/blog.hcl.tmpl")}"
	vars {
		version = "${var.version}"
	}
}

resource "nomad_job" "blog" {
	jobspec = "${data.template_file.job.rendered}"
}

# TODO: Add modules for separate service
