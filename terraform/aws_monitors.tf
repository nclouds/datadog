resource "datadog_monitor" "ELB Unhealthy Host" {
  name               = "${var.enviroment_tag} MEMORY"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1h):( avg:aws.elb.healthy_host_count{*} / avg:aws.elb.host_count{*} ) < 0.8"

  thresholds {
    ok       = 0
    warning  = 0.8
    critical = 0.9
  }

  notify_no_data    = true
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }
  tags = ["MEMORY", "${var.enviroment_tag}"]
}
