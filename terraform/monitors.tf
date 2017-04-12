resource "datadog_monitor" "CPU_USAGE" {
  name               = "CPU_USAGE"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( 100 - avg:system.cpu.idle{ ${var.enviroment_tag} } by {host}  ) == 100"

  thresholds {
    ok       = 0
    warning  = 99
    critical = 100
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

  query = "avg(last_1m):abs(avg:system.mem.free{ ${var.enviroment_tag} } by {host} * 100 / avg:system.mem.total{ ${var.enviroment_tag} } by {host}) <= 5"

  thresholds {
    ok       = 0
    warning  = 8
    critical = 5
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

  query = "avg(last_1m):abs( avg:system.disk.free{ ${var.enviroment_tag} } by {host} * 100 / avg:system.disk.total{ ${var.enviroment_tag} } by {host} ) <= 10"

  thresholds {
    ok       = 0
    warning  = 15
    critical = 10
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

  query = "avg(last_1m):abs( avg:ntp.offset{ ${var.enviroment_tag} } by {host} ) > 5"

  thresholds {
    ok       = 0
    warning  = 3
    critical = 5
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

  query = "avg(last_1m):abs( avg:system.swap.free{ ${var.enviroment_tag} } by {host} * 100 / avg:system.swap.total{ ${var.enviroment_tag} } by {host} ) <= 5"

  thresholds {
    ok       = 0
    warning  = 8
    critical = 5
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

  query = "avg(last_1m):abs( avg:system.load.norm.5{ ${var.enviroment_tag} } by {host} ) > 4"

  thresholds {
    ok       = 0
    warning  = 3
    critical = 4
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
