prometheus.exporter.untyped "my_app" {
  scrape {
    target = env("METRICS_URL")  # Например, app:3000
  }

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
