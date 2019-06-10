resource "digitalocean_droplet" "web" {
    image = "ubuntu-14-04-x64"
    name = "webserver"
    region = "nyc1"
    size = "512mb"
}

resource "digitalocean_loadbalancer" "public" {
  name = "loadbalancer-1"
  region = "nyc1"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 22
    protocol = "tcp"
  }

  droplet_ids = ["${digitalocean_droplet.web.id}"]
}