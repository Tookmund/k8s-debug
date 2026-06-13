FROM debian:trixie-20260610-slim

USER root

COPY entrypoint.sh /opt/

RUN apt update && \
	apt install --no-install-recommends -y \
		sed tmux openssh-server wireguard-tools iproute2 iputils-ping && \
	apt clean

RUN sed -E -i \
		-e 's/#PasswordAuthentication yes/PasswordAuthentication no/' \
		-e 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' \
		-e 's/ChallengeResponseAuthentication yes/ChallengeResponseAuthentication no/' \
		-e 's/UsePAM yes/UsePAM no/' \
		/etc/ssh/sshd_config

ENTRYPOINT /opt/entrypoint.sh


EXPOSE 22
