# esxi-homelab-simulation

Automated Linux KVM VM provisioning with a Bash script that mirrors 
ESXi VM creation workflows. Includes network bridge configuration 
and a side-by-side hypervisor architecture comparison between KVM and ESXi.

Companion to [esxi-npi-lab](https://github.com/kchimbodza/esxi-npi-lab), where the same steps are done by hand on a real (nested) ESXi 8.0 host.

## Architecture

<p align="center"><img src="docs/architecture.svg" width="100%" alt="The same four VM lifecycle steps on two hypervisors. ESXi: New VM wizard, vSwitch0 with the VM Network port group, a disk on a VMFS datastore, power on and check in the Host Client. KVM in this repo: provision-vm.sh calls virt-install for lab-vm-01 (1 vCPU, 1024 MB), connects it to the virbr0 Linux bridge, creates a 10 GB disk in libvirt's default pool, and boots it headless with a serial console, checked with virsh list --all."></p>

**Why this architecture**

| Choice | Why |
|---|---|
| KVM with `virt-install` | Open source and part of Linux, and it follows the same lifecycle as ESXi: create, network, storage, boot (`esxi-vs-kvm.md`). |
| One Bash script | Every setting is a variable at the top, and one command creates the VM, like the ESXi New VM wizard. |
| `virbr0` bridge | libvirt's default bridge; it plays the part of the ESXi "VM Network" port group. |
| `--graphics none` + serial console | The VM runs headless and is managed from the terminal (`virsh`), like `esxcli` on ESXi. |

## Files
- `provision-vm.sh` — automates KVM VM creation mirroring ESXi workflow
- `esxi-vs-kvm.md` — feature comparison between ESXi and KVM
- `docs/architecture.svg` — the diagram above

## Usage
```bash
bash provision-vm.sh
```

Verify VM is running:
```bash
virsh list --all
```

## Results

| Check | Result |
|---|---|
| `bash -n provision-vm.sh` (syntax check) | ✅ Passes (run 13 Nov 2026, GNU bash 5.3.20, Arch Linux) |
| ShellCheck | Not run: not installed on the machine used for this check |
| Running the script | No run output, logs or screenshots are in the repo yet |
| CI | None set up |

## What worked and what didn't

| | What | Detail |
|---|---|---|
| ✅ | Clear mapping to ESXi | Each `virt-install` flag lines up with an ESXi wizard step (see the diagram and `esxi-vs-kvm.md`). |
| ✅ | Easy to change | Name, RAM, vCPUs, disk size, bridge and OS variant are all variables at the top. |
| ⚠️ | No install source | The script passes no `--cdrom`, `--location` or `--import`, which `virt-install` normally needs to install an OS. One has to be added to actually install Ubuntu 22.04. |
| ⚠️ | No error check | There is no `set -e` or exit-status check, so "provisioned successfully" prints even if `virt-install` fails. |
| ⚠️ | NAT, not LAN | `virbr0` is libvirt's default NAT network, so the VM is not on the home LAN. The ESXi lab used bridged mode to get a real LAN address. |
| ⚠️ | One VM, fixed settings | Settings are edited in the file; there are no command-line options for making several VMs. |

## Skills Demonstrated
- Linux KVM VM provisioning
- Network bridge configuration
- Hypervisor architecture (ESXi and KVM)
- Lab infrastructure setup and automation
