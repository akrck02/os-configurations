dbus-uuidgen --ensure=/etc/machine-id
nixos-rebuild switch --flake .#x86_64-dev-modern14

