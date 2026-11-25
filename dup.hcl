resource "network" "dupnet" {
  subnet = "10.0.9.0/24"
}

resource "container" "c1" {
  image {
    name = "ubuntu:24.04"
  }
  network {
    id = resource.network.dupnet.meta.id
  }
}

resource "task" "dup" {
  description = "dup FIRST definition"
  config {
    target = resource.container.c1
  }
}

resource "task" "dup" {
  description = "dup SECOND definition"
  config {
    target = resource.container.c1
  }

resource "task" "dup" {
  description = "dup third definition"
  config {
    target = resource.container.c1
  }
}
}
