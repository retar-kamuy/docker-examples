Error: cannot listen on the TCP port: listen tcp4 :22: bind: address already in use

#  lsof -i -P | grep "LISTEN"
cupsd      874   root    6u  IPv6  23979      0t0  TCP localhost:631 (LISTEN)
cupsd      874   root    7u  IPv4  23980      0t0  TCP localhost:631 (LISTEN)
sshd       876   root    3u  IPv4  24674      0t0  TCP *:22 (LISTEN)
sshd       876   root    4u  IPv6  24683      0t0  TCP *:22 (LISTEN)

/etc/ssh/sshd_config

service sshd reload

volumeへの":Z"つけ忘れに注意ぽ

docker exec -it gitlab update-permissions
  docker restart gitlab

sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password