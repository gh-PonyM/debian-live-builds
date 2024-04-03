# Debian live image builds

## Testing

Install:

    apt install qemu-kvm qemu-utils

Test the produced live image:

    kvm -cdrom .tmp/live-image-amd64.hybrid.iso -m 1024
