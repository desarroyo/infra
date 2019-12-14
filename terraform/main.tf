# Create tag
resource "digitalocean_tag" "tecWeb" {
  name = "tecWeb"
}

# Create a web server
resource "digitalocean_droplet" "tecWeb" {
  count     = 2
  image     = "${var.image_id}"
  name      = "tecWeb"
  region    = "NYC3"
  size      = "512mb"
  ssh_keys  = [26021531]
  user_data = "${file("user-data.web")}"
  tags      = ["${digitalocean_tag.tecWeb.id}"]
}

#Create loadbalancer
resource "digitalocean_loadbalancer" "tecWeb" {
  name   = "loadbalancer-desarroyo"
  region = "nyc3"

  forwarding_rule {
    entry_port     = 80
    entry_protocol = "http"

    target_port     = 3000
    target_protocol = "http"
  }

  healthcheck {
    port     = 3000
    protocol = "http"
    path     = "/add/660/6"
  }

  droplet_tag = "${digitalocean_tag.tecWeb.id}"
}
