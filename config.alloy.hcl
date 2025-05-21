logging {
  level  = "debug"
  format = "json"
}

prometheus.scrape "my_app" {
  targets = [
    {
      __address__     = env("METRICS_URL"),
      __metrics_path__ = "/metrics",
    },
  ]
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
