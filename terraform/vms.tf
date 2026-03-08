resource "yandex_compute_disk" "worker-disk" {
  name     = "worker-disk"
  type     = "network-hdd"
  zone     = "ru-central1-b"
  size     = "1000"
  image_id = "fd8ccfejmpaipf677j5c"
}

resource "yandex_compute_instance" "worker" {
  name = "worker"

  resources {
    cores  = 4
    memory = 16
  }

  boot_disk {
    disk_id = yandex_compute_disk.worker-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
  }

  metadata = {
    user-data = "${file("user-data")}"
  }
}

resource "yandex_compute_disk" "victoriametrics-disk" {
  name     = "victoriametrics-disk"
  type     = "network-ssd"
  zone     = "ru-central1-b"
  size     = "1000"
  image_id = "fd8ccfejmpaipf677j5c"
}

resource "yandex_compute_instance" "victoriametrics" {
  name = "victoriametrics"

  resources {
    cores  = 4
    memory = 32
  }

  boot_disk {
    disk_id = yandex_compute_disk.victoriametrics-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
  }

  metadata = {
    user-data = "${file("user-data")}"
  }
}


resource "yandex_compute_disk" "prometheus-disk" {
  name     = "prometheus-disk"
  type     = "network-ssd"
  zone     = "ru-central1-b"
  size     = "1000"
  image_id = "fd8ccfejmpaipf677j5c"
}

resource "yandex_compute_instance" "prometheus" {
  name = "prometheus"

  resources {
    cores  = 4
    memory = 32
  }

  boot_disk {
    disk_id = yandex_compute_disk.prometheus-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
  }

  metadata = {
    user-data = "${file("user-data")}"
  }
}

resource "yandex_compute_disk" "master-monitoring-disk" {
  name     = "master-monitoring-disk"
  type     = "network-ssd"
  zone     = "ru-central1-b"
  size     = "1000"
  image_id = "fd8ccfejmpaipf677j5c"
}

resource "yandex_compute_instance" "master-monitoring" {
  name = "master-monitoring"

  resources {
    cores  = 4
    memory = 32
  }

  boot_disk {
    disk_id = yandex_compute_disk.master-monitoring-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.default.id
    nat       = true
  }

  metadata = {
    user-data = "${file("user-data")}"
  }
}