discovery.static "my_app" {
  targets = [env("METRICS_URL")]
}

prometheus.scrape "my_app" {
  targets    = discovery.static.my_app.targets
  forward_to = [prometheus.remote_write.grafana_cloud.receiver]
}

prometheus.remote_write "grafana_cloud" {
  endpoint {
    url = env("GRAFANA_REMOTE_WRITE_URL")
    basic_auth {
      username = env("GRAFANA_USERNAME")
      password = env("GRAFANA_API_KEY")
    }
  }
}
