#!/bin/bash

# Select kernel version: Main or LTS
echo "Please select the Xanmod kernel version to install:"
echo "1) Main"
echo "2) LTS"
read -rp "Enter your choice (1 or 2): " kernel_choice

if [[ "$kernel_choice" == "1" ]]; then
    version_type="main"
elif [[ "$kernel_choice" == "2" ]]; then
    version_type="lts"
else
    echo "Invalid choice, exiting."
    exit 1
fi

# Check CPU level
cpu_level=$(awk -f <(wget -O - https://dl.xanmod.org/check_x86-64_psabi.sh))

if [[ $cpu_level =~ "x86-64-v"([0-9]) ]]; then
    v_level="v${BASH_REMATCH[1]}"
else
    echo "Unable to determine CPU level, exiting."
    exit 1
fi

# Define GitHub repo and fetch the latest releases using GitHub API
github_repo_api="https://api.github.com/repos/neomikanagi/Xanmod-Lite/releases"
latest_releases=$(curl -s $github_repo_api | jq -r '.[].tag_name' | head -n 8)

# Debug output to show latest releases
echo "Latest releases: $latest_releases"

# Find matching kernel version based on CPU level and user choice (Main or LTS)
matching_releases=$(echo "$latest_releases" | grep "$v_level" | grep "xanmod-${version_type}-")

# Debug output for matching releases
echo "Matching releases for $version_type: $matching_releases"

# Select the most appropriate release
if [[ "$version_type" == "main" ]]; then
    matching_release=$(echo "$matching_releases" | tail -n 1)
else
    matching_release=$(echo "$matching_releases" | head -n 1)
fi

if [[ -z "$matching_release" ]]; then
    echo "No matching kernel version found, exiting."
    exit 1
fi

# Function to download files with a check
download_file() {
    local file_name=$1
    local url=$2
    if [[ -z "$url" ]]; then
        echo "Download link for $file_name not found, exiting."
        exit 1
    fi
    wget "$url" -P /tmp/xanmod_kernel || {
        echo "Download of $file_name failed, exiting."
        exit 1
    }
}

# Build download URLs using GitHub API and download related files
release_id=$(curl -s $github_repo_api | jq -r ".[] | select(.tag_name == \"$matching_release\") | .id")
release_assets_url="https://api.github.com/repos/neomikanagi/Xanmod-Lite/releases/$release_id"
assets=$(curl -s $release_assets_url | jq -r '.assets[].browser_download_url')

# Download necessary files
mkdir -p /tmp/xanmod_kernel
for file in "linux-headers" "linux-image" "linux-libc-dev"; do
    file_url=$(echo "$assets" | grep -i "$file")
    download_file "$file" "$file_url"
done

# Install the downloaded kernel files
echo "Installing kernel files..."
dpkg -i /tmp/xanmod_kernel/*.deb || {
    echo "Kernel file installation failed, exiting."
    exit 1
}

# Extract the new kernel version from the downloaded files
new_kernel_version=$(ls /tmp/xanmod_kernel/linux-image* | sed -e 's/.*linux-image-//' -e 's/_.*//')

if [[ -z "$new_kernel_version" ]]; then
    echo "Unable to extract kernel version from downloaded files, exiting."
    exit 1
fi

# Update GRUB and set the new kernel as the default
echo "Updating GRUB..."
update-grub || {
    echo "GRUB update failed, exiting."
    exit 1
}

# Find the GRUB menu entry for the new kernel
grub_entry_name=$(grep -E "menuentry '.*$new_kernel_version" /boot/grub/grub.cfg | sed -e "s/menuentry '\(.*\)' .*/\1/" | head -n 1)

if [[ -z "$grub_entry_name" ]]; then
    echo "Could not find GRUB entry for the new kernel, exiting."
    exit 1
fi

# Set GRUB_DEFAULT to the newly installed kernel
grub-set-default "$grub_entry_name"

# Ensure GRUB changes take effect
sed -i "s/GRUB_DEFAULT=.*/GRUB_DEFAULT=saved/" /etc/default/grub
update-grub

# Verify if the kernel was successfully installed
new_kernel=$(ls /boot/vmlinuz-* | grep "$new_kernel_version")

if [[ -z "$new_kernel" ]]; then
    echo "New kernel not found, please check if the installation was successful."
    echo "Currently installed kernels:"
    ls /boot/vmlinuz-*
    exit 1
else
    echo "New kernel found: $new_kernel"
fi

# Reboot prompt
echo "Kernel installation successful! You can now reboot the system and check if the new kernel is working."
echo "Please run the following command to reboot: sudo reboot"