resource "datadog_monitor" "CPU_USAGE" {
  name               = "CPU_USAGE"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( 100 - avg:system.cpu.idle{ ${var.enviroment_tag} } by {host}  ) == ${var.critical["CPU"]} "

  thresholds {
    ok       = 0
    warning  = "${var.warning["CPU"]}"
    critical = "${var.critical["CPU"]}"
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["CPU_USAGE", "${var.enviroment_tag}"]
}

resource "datadog_monitor" "MEMORY" {
  name               = "MEMORY"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs(avg:system.mem.free{ ${var.enviroment_tag} } by {host} * 100 / avg:system.mem.total{ ${var.enviroment_tag} } by {host}) <= ${var.critical["MEMORY"]}"

  thresholds {
    ok       = 0
    warning  = "${var.warning["MEMORY"]}"
    critical = "${var.critical["MEMORY"]}"
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

resource "datadog_monitor" "DISK" {
  name               = "DISK"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.disk.free{ ${var.enviroment_tag} } by {host} * 100 / avg:system.disk.total{ ${var.enviroment_tag} } by {host} ) <= ${var.critical["DISK"]}"

  thresholds {
    ok       = 0
    warning  = "${var.warning["DISK"]}"
    critical = "${var.critical["DISK"]}"
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["DISK", "${var.enviroment_tag}"]
}

resource "datadog_monitor" "NTP_OFFSET" {
  name               = "NTP OFFSET"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:ntp.offset{ ${var.enviroment_tag} } by {host} ) > ${var.critical["NTP"]}"

  thresholds {
    ok       = 0
    warning  = "${var.warning["NTP"]}"
    critical = "${var.critical["NTP"]}"
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["NTP OFFSET", "${var.enviroment_tag}"]
}


resource "datadog_monitor" "SWAP_MEMORY" {
  name               = "SWAP MEMORY"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.swap.free{ ${var.enviroment_tag} } by {host} * 100 / avg:system.swap.total{ ${var.enviroment_tag} } by {host} ) <= ${var.critical["SWAP"]}"

  thresholds {
    ok       = 0
    warning  = "${var.warning["SWAP"]}"
    critical = "${var.critical["SWAP"]}"
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["SWAP MEMORY", "${var.enviroment_tag}"]
}



resource "datadog_monitor" "LOAD_AVERAGE_5MINUTES" {
  name               = "LOAD_AVERAGE_5MINUTES"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.load.norm.5{ ${var.enviroment_tag} } by {host} ) > ${var.critical["LOAD"]}"

  thresholds {
    ok       = 0
    warning  = "${var.warning["LOAD"]}"
    critical = "${var.critical["LOAD"]}"
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["LOAD_AVERAGE_5MINUTES", "${var.enviroment_tag}"]
}
