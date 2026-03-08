terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = "key.json"
  cloud_id                 = "b1g5eftnc8m9b2ocu7t2"
  folder_id                = "b1gpppcnuoj5ob2smjg7"
  zone                     = "ru-central1-b"
}
