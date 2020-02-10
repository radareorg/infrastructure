provider "nomad" {
	address = "https://127.0.0.1:4646"
	region = ""
}

# Setup local docker registry service
data "template_registry" "job" {
	template = "${file("${path.module}/registry.hcl.tmpl")}"
	vars {
		version = "${var.version}"
	}
}

# TODO: setup SSL certificates for all domains
# TODO: setup DNS for all domains
data "template_blog" "job" {
	template = "${file("${path.module}/blog.hcl.tmpl")}"
	vars {
		version = "${var.version}"
	}
}

data "template_cfp" "job" {
	template = "${file("${path.module}/cfp.hcl.tmpl")}"
	vars {
		version = "${var.version}"
	}
}

resource "nomad_job" "registry" {
	jobspec = "${data.template_registry.job.rendered}"
}
resource "nomad_job" "blog" {
	jobspec = "${data.template_blog.job.rendered}"
}
resource "nomad_job" "cfp" {
	jobspec = "${data.template_cfp.job.rendered}"
}

# TODO: Add modules for separate service
