build:
  flatpak-builder --force-clean --user --install-deps-from=flathub --repo=repo --install builddir com.flatpost.flatpostapp.yml

run:
  flatpak run com.flatpost.flatpostapp

create-pip-module:
  #!/usr/bin/bash
  mkdir -p pip-out
  podman run --rm --volume ./pip-out:/app:Z -w /app fedora:41 /bin/bash -c \
      "dnf5 install -y python3-requirements-parser wget python3-pip && wget https://raw.githubusercontent.com/flatpak/flatpak-builder-tools/master/pip/flatpak-pip-generator --directory-prefix env/bin && python3 env/bin/flatpak-pip-generator gobject requests"
