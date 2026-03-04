#!/bin/bash

# Lab VM Provisioning Script
# Mirrors ESXi VM creation workflow using Linux KVM (virt-install)

VM_NAME="lab-vm-01"
RAM=1024
VCPUS=1
DISK_SIZE=10
BRIDGE="virbr0"
OS_VARIANT="ubuntu22.04"

echo "============================================"
echo " Provisioning VM: $VM_NAME"
echo " RAM: ${RAM}MB | vCPUs: $VCPUS | Disk: ${DISK_SIZE}GB"
echo " Network Bridge: $BRIDGE"
echo "============================================"

virt-install \
  --name "$VM_NAME" \
  --ram "$RAM" \
  --vcpus "$VCPUS" \
  --disk size="$DISK_SIZE" \
  --network bridge="$BRIDGE" \
  --os-variant "$OS_VARIANT" \
  --graphics none \
  --console pty,target_type=serial \
  --noautoconsole

echo ""
echo "VM '$VM_NAME' provisioned successfully."
echo "Run: virsh list --all to verify."
