#!/usr/bin/env bash
# https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/native-install/ubuntu.html

# # Make the directory if it doesn't exist yet.
# # This location is recommended by the distribution maintainers.
# sudo mkdir --parents --mode=0755 /etc/nala/keyrings

# # Download the key, convert the signing-key to a full
# # keyring required by nala and store in the keyring directory
# wget https://repo.radeon.com/rocm/rocm.gpg.key -O - | \
#     gpg --dearmor | sudo tee /etc/nala/keyrings/rocm.gpg > /dev/null

# echo "deb [arch=amd64 signed-by=/etc/nala/keyrings/rocm.gpg] https://repo.radeon.com/amdgpu/6.1.1/ubuntu jammy main" \
#     | sudo tee /etc/nala/sources.list.d/amdgpu.list

# sudo nala update    

# echo "deb [arch=amd64 signed-by=/etc/nala/keyrings/rocm.gpg] https://repo.radeon.com/rocm/nala/6.1.1 jammy main" \
#     | sudo tee --append /etc/nala/sources.list.d/rocm.list

# echo -e 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600' \
#     | sudo tee /etc/nala/preferences.d/rocm-pin-600

# sudo nala update && \
# sudo nala install -y amdgpu-dkms \
#     rocm

# # Post-installation instructions

# sudo tee --append /etc/ld.so.conf.d/rocm.conf <<EOF
# /opt/rocm/lib
# /opt/rocm/lib64
# EOF

# sudo ldconfig

# export PATH=$PATH:/opt/rocm-6.1.1/bin

# dkms status

# /opt/rocm-6.1.1/bin/rocminfo
# /opt/rocm-6.1.1/bin/clinfo

# echo "Reboot your system"


# Installation via AMDGPU installer

# https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/amdgpu-install.html
# https://rocm.docs.amd.com/projects/install-on-linux/en/latest/how-to/prerequisites.html

sudo apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"

echo "Setting permissions for groups"
echo 'ADD_EXTRA_GROUPS=1' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=video' | sudo tee -a /etc/adduser.conf
echo 'EXTRA_GROUPS=render' | sudo tee -a /etc/adduser.conf