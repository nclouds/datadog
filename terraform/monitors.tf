resource "datadog_monitor" "CPU_iowait" {
  name               = "${var.enviroment_tag} CPU iowait"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.cpu.iowait{ ${var.enviroment_tag} } by {host}  ) == 100"

  thresholds {
    ok       = 0
    warning  = 70
    critical = 90
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["CPU_IOWAIT", "${var.enviroment_tag}"]
}

resource "datadog_monitor" "CPU_stolen" {
  name               = "${var.enviroment_tag} CPU stolen"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.cpu.stolen{ ${var.enviroment_tag} } by {host}   ) > 90"
  thresholds {
    ok       = 0
    warning  = 70
    critical = 90
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["CPU_stolen", "${var.enviroment_tag}"]
}

resource "datadog_monitor" "CPU_user" {
  name               = "${var.enviroment_tag} CPU user"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.cpu.user{ ${var.enviroment_tag} } by {host}    ) > 90"

  thresholds {
    ok       = 0
    warning  = 70
    critical = 90
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["CPU_user", "${var.enviroment_tag}"]
}

resource "datadog_monitor" "CPU_system" {
  name               = "${var.enviroment_tag} CPU system"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.cpu.system{ ${var.enviroment_tag} } by {host}    ) > 90"

  thresholds {
    ok       = 0
    warning  = 70
    critical = 90
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["CPU_system", "${var.enviroment_tag}"]
}




resource "datadog_monitor" "MEMORY" {
  name               = "${var.enviroment_tag} MEMORY"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs(avg:system.mem.used{ ${var.enviroment_tag} } by {host} * 100 / avg:system.mem.total{ ${var.enviroment_tag} } by {host}) <= 5"

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
  name               = "${var.enviroment_tag} DISK"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.disk.used{ ${var.enviroment_tag} } by {host} / avg:system.disk.total{ ${var.enviroment_tag} } by {host} ) > 0.9"

  thresholds {
    ok       = 0
    warning  = 0.75
    critical = 0.90
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
  name               = "${var.enviroment_tag} NTP OFFSET"
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
  name               = "${var.enviroment_tag} SWAP MEMORY"
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
  name               = "${var.enviroment_tag} LOAD_AVERAGE_5MINUTES"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.load.5{ ${var.enviroment_tag} } by {host} ) > 0.9"

  thresholds {
    ok       = 0
    warning  = 0.7
    critical = 0.9
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

resource "datadog_monitor" "LOAD_AVERAGE_15MINUTES" {
  name               = "${var.enviroment_tag} LOAD_AVERAGE_15MINUTES"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.load.15{ ${var.enviroment_tag} } by {host} ) > 0.9"

  thresholds {
    ok       = 0
    warning  = 0.7
    critical = 0.9
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["LOAD_AVERAGE_15MINUTES", "${var.enviroment_tag}"]
}

resource "datadog_monitor" "LOAD_AVERAGE_1MINUTES" {
  name               = "${var.enviroment_tag} LOAD_AVERAGE_1MINUTES"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: ${var.users}"

  query = "avg(last_1m):abs( avg:system.load.1{ ${var.enviroment_tag} } by {host} ) > 0.9"

  thresholds {
    ok       = 0
    warning  = 0.7
    critical = 0.9
  }

  notify_no_data    = false
  renotify_interval = 60

  notify_audit = false
  timeout_h    = 60
  include_tags = true

  silenced {
    "*" = 0
  }

  tags = ["LOAD_AVERAGE_1MINUTES", "${var.enviroment_tag}"]
}
