resource "yandex_vpc_network" "default" {
  name = "default"
}

resource "yandex_vpc_subnet" "default" {
  name           = "default"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
