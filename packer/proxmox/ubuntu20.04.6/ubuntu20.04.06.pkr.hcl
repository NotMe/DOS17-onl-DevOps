variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

source "proxmox-iso" "ubuntu-server-focal" {
 
    proxmox_url = "${var.proxmox_api_url}"
    username = "${var.proxmox_api_token_id}"
    token = "${var.proxmox_api_token_secret}"
    insecure_skip_tls_verify = true
    
    node = "proxmox"
    vm_id = "200"
    vm_name = "ubuntu-server-focal"
    template_description = "Ubuntu Server Focal Image"

    iso_file = "local:iso/ubuntu-20.04.6-live-server-amd64.iso"
    iso_storage_pool = "local"
    unmount_iso = true

    qemu_agent = true

    scsi_controller = "virtio-scsi-pci"

    disks {
        disk_size = "10G"
        storage_pool = "local-lvm"
        type = "virtio"
    }

    cores = "2"
    
    memory = "2048" 

    network_adapters {
        model = "virtio"
        bridge = "vmbr0"
        firewall = "false"
    } 

    cloud_init = true
    cloud_init_storage_pool = "local-lvm"

    boot_command = [
        "<esc><wait><esc><wait>",
        "<f6><wait><esc><wait>",
        "<bs><bs><bs><bs><bs>",
        "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ",
        "--- <enter>"
    ]
    boot = "c"
    boot_wait = "5s"

    http_directory = "http" 

    ssh_username = "packer"
    ssh_password = "123qweASDZXC"

    ssh_timeout = "10m"
}

build {
    name = "ubuntu-server-focal"
    sources = ["source.proxmox-iso.ubuntu-server-focal"]

    provisioner "shell" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo rm /etc/ssh/ssh_host_*",
            "sudo truncate -s 0 /etc/machine-id",
            "sudo apt -y autoremove --purge",
            "sudo apt -y clean",
            "sudo apt -y autoclean",
            "sudo cloud-init clean",
            "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
            "sudo sync"
        ]
    }

    provisioner "file" {
        source = "files/99-pve.cfg"
        destination = "/tmp/99-pve.cfg"
    }
}