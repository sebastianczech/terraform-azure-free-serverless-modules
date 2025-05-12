locals {
  # Base/Common
  prefix = {
    resource_group   = "rg"
    managed_identity = "id"
    key_vault        = "kv"
    storage_account  = "st"
    log_analytics    = "log"
  }

  # Compute
  compute = {
    virtual_machine           = "vm"
    availability_set          = "avail"
    virtual_machine_scale_set = "vmss"
    function_app              = "func"
    app_service               = "app"
    app_service_plan          = "asp"
    container_apps            = "aca"
    aks                       = "aks"
  }

  # Networking
  network = {
    virtual_network        = "vnet"
    subnet                 = "snet"
    network_security_group = "nsg"
    application_gateway    = "agw"
    load_balancer          = "lb"
    public_ip              = "pip"
    private_endpoint       = "pep"
  }

  # Database
  database = {
    cosmos_db    = "cosmos"
    sql_server   = "sql"
    mysql_server = "mysql"
    postgresql   = "psql"
  }

  # Integration
  integration = {
    api_management = "apim"
    service_bus    = "sb"
    event_hub      = "evh"
    event_grid     = "evg"
  }

  # Web
  web = {
    static_web_app = "swa"
    cdn_endpoint   = "cdn"
    front_door     = "fd"
  }

  # Monitoring
  monitoring = {
    application_insights = "appi"
    monitor_action_group = "mag"
    monitor_alert        = "malt"
  }
}
