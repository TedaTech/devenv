packer {
    required_plugins {
        hcloud = {
            source  = "github.com/hetznercloud/hcloud"
            version = "~> 1"
        }
    }
}

variable "talos_version" {
    type    = string
    default = "v1.8.1"
}

variable "arch" {
    type    = string
    default = "amd64"
}

variable "server_type" {
    type    = string
    default = "cx22"
}

variable "server_location" {
    type    = string
    default = "fsn1"
}

locals {
    image = "https://factory.talos.dev/image/376567988ad370138ad8b2698212367b8edcb69b5fd68c80be1f2ec7d603b4ba/${var.talos_version}/hcloud-${var.arch}.raw.xz"
}

source "hcloud" "talos" {
    rescue       = "linux64"
    image        = "ubuntu-22.04"
    location     = "${var.server_location}"
    server_type  = "${var.server_type}"
    ssh_username = "root"

    snapshot_name   = "talos system disk - ${var.arch} - ${var.talos_version}"
    snapshot_labels = {
        type    = "infra",
        os      = "talos",
        version = "${var.talos_version}",
        arch    = "${var.arch}",
        caph-image-name = "talos-${var.talos_version}"
    }
}

build {
    sources = ["source.hcloud.talos"]

    provisioner "shell" {
        inline = [
            "apt-get install -y wget",
            "wget -O /tmp/talos.raw.xz ${local.image}",
            "xz -d -c /tmp/talos.raw.xz | dd of=/dev/sda && sync",
        ]
    }
}
