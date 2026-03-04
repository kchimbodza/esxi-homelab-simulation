# esxi-homelab-simulation

Automated Linux KVM VM provisioning with a Bash script that mirrors 
ESXi VM creation workflows. Includes network bridge configuration 
and a side-by-side hypervisor architecture comparison between KVM and ESXi.

## Files
- `provision-vm.sh` — automates KVM VM creation mirroring ESXi workflow
- `esxi-vs-kvm.md` — feature comparison between ESXi and KVM

## Usage
```bash
bash provision-vm.sh
```

Verify VM is running:
```bash
virsh list --all
```

## Skills Demonstrated
- Linux KVM VM provisioning
- Network bridge configuration
- Hypervisor architecture (ESXi and KVM)
- Lab infrastructure setup and automation
