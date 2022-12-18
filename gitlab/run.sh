GITLAB_HOME=/srv/gitlab

VOLUMES=(
    "$GITLAB_HOME/config"
    "$GITLAB_HOME/logs"
    "$GITLAB_HOME/data"
)

for vol in ${VOLUMES[@]} ; do
    if [ ! -d $vol ]; then mkdir -p $vol; fi
done

podman run --detach \
    --hostname gitlab.example.com --publish 8443:8443 --publish 8929:8929 --publish 2289:22 \
    --env GITLAB_OMNIBUS_CONFIG="external_url 'http://localhost:8929';\
        gitlab_rails['gitlab_shell_ssh_port'] = 2289;" \
    --name gitlab \
    --restart always \
    --volume $GITLAB_HOME/config:/etc/gitlab:Z \
    --volume $GITLAB_HOME/logs:/var/log/gitlab:Z \
    --volume $GITLAB_HOME/data:/var/opt/gitlab:Z \
    --shm-size 256m \
    docker.io/gitlab/gitlab-ce:latest
