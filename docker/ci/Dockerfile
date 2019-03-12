FROM jenkins/jenkins:latest

RUN /usr/local/bin/install-plugins.sh \
	git matrix-auth workflow-aggregator \
	docker-workflow blueocean credentials-binding

ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Skip the initial setup wizard
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=true

