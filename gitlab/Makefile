CONTAINER	 = gitlab
IMAGE		 = docker.io/gitlab/gitlab-ce:latest

GITLAB_HOME	 =/srv/gitlab

VOLUMES=$(GITLAB_HOME)/config $(GITLAB_HOM)/logs $(GITLAB_HOME)/data

OPTS	 = --detach
OPTS	+= --hostname gitlab.example.com
OPTS	+= --env GITLAB_OMNIBUS_CONFIG="external_url 'https://localhost:8929'; \
			gitlab_rails['gitlab_shell_ssh_port'] = 2289;"
OPTS	+= --publish 8443:8443 --publish 8929:8929 --publish 2289:22
OPTS	+= --name $(CONTAINER)
#OPTS	+= --restart always
OPTS	+= --volume $(GITLAB_HOME)/config:/etc/gitlab:Z \
			--volume $(GITLAB_HOME)/logs:/var/log/gitlab:Z \
			--volume $(GITLAB_HOME)/data:/var/opt/gitlab:Z
OPTS	+= --shm-size 256m 



define CREATE_DIRECTORY
	@if [ ! -d $(1) ]; then \
		mkdir -p $(1); \
	fi
endef

build:
	$(call CREATE_DIRECTORY,$(GITLAB_HOME)/config)
	$(call CREATE_DIRECTORY,$(GITLAB_HOME)/logs)
	$(call CREATE_DIRECTORY,$(GITLAB_HOME)/data)
 
run: build
	podman run $(OPTS) $(IMAGE)

log:
	podman logs -f $(CONTAINER)

configuration:
	podman exec -it $(CONTAINER) editor /etc/gitlab/gitlab.rb
	podman exec -it $(CONTAINER) gitlab-ctl reconfigure

restart:
	podman restart $(CONTAINER)

password:
	sudo docker exec -it $(CONTAINER) grep 'Password:' /etc/gitlab/initial_root_password

backup:
	stop $(CONTAINER)
	podman rm $(CONTAINER)
	podman pull $(IMAGE)
