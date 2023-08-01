```
.\packer.exe init ..\config.pkr.hcl
```
```
.\packer.exe validate -var-file='..\credentials.pkr.hcl' .\ubuntu20.04.06.pkr.hcl
The configuration is valid.
```
```
.\packer.exe build -var-file='..\credentials.pkr.hcl' .\ubuntu20.04.06.pkr.hcl
ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: output will be in this color.
```
```
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Creating VM
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Starting VM
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Starting HTTP server on port 8632
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Waiting 5s for boot
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Typing the boot command
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Waiting for SSH to become available...
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Connected to SSH!
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Provisioning with shell script: C:\Users\ADMIN~1.OFF\AppData\Local\Temp\packer-shell1242771295
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Waiting for cloud-init...
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Waiting for cloud-init...
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Waiting for cloud-init...
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal:
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal:
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Reading package lists...
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Building dependency tree...
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Reading state information...
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: 0 upgraded, 0 newly installed, 0 to remove and 39 not upgraded.
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal:
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal:
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal:
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: WARNING: apt does not have a stable CLI interface. Use with caution in scripts.
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal:
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Reading package lists...
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Building dependency tree...
    ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Reading state information...
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Uploading files/99-pve.cfg => /tmp/99-pve.cfg
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Stopping VM
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Converting VM to template
==> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: Adding a cloud-init cdrom in storage pool local-lvm
Build 'ubuntu-server-focal.proxmox-iso.ubuntu-server-focal' finished after 8 minutes 26 seconds.

==> Wait completed after 8 minutes 26 seconds

==> Builds finished. The artifacts of successful builds are:
--> ubuntu-server-focal.proxmox-iso.ubuntu-server-focal: A template was created: 200
```
