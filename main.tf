resource "digitalocean_droplet" "web" {
    image = "ubuntu-14-04-x64"
    name = "webserver"
    region = "nyc1"
    size = "512mb"
}


