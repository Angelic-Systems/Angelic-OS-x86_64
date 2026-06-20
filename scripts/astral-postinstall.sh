#!/bin/sh
set -e 

echo "=== Astral-OS post-install started ==="

# Create default user
if ! id astral >/dev/null 2>&1; then
	useradd -m -G wheel,audio,video,input -s /bin/bash astral
	echo "astral:astral" | chpasswd
fi

# Fix ownership configs (in case they were copied via skel)
chown -R astral:astral /home/astral 2>/dev/null || true

# Enable services
ln -s /etc/sv/dbus /var/service/ 2>/dev/null || true

echo "=== Astral-OS post-install finished ==="
