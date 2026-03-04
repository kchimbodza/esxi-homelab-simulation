# ESXi vs KVM — Hypervisor Comparison

| Feature | ESXi | KVM |
|---|---|---|
| Type | Bare-metal (Type 1) | Type 1 via Linux kernel |
| Management UI | vSphere Client | Virt-Manager / Cockpit |
| CLI Tool | esxcli | virsh |
| VM Provisioning | vSphere Wizard / PowerCLI | virt-install |
| Networking | vSwitch / dvSwitch | Linux Bridge / OVS |
| Storage | VMFS datastores | qcow2 / raw disk images |
| Snapshot Support | Yes (vSphere) | Yes (virsh snapshot-create) |
| Cost | Licensed | Open source |
| Common Use | Enterprise data centres | Lab environments / cloud |

## Key Takeaway
Both hypervisors follow the same VM lifecycle — create, configure 
network, assign storage, boot. The tooling differs but the concepts 
are identical, making KVM experience directly transferable to ESXi 
lab environments.
