output "base" {
  description = "Base/Common Azure resource abbreviations"
  value       = local.base
}

output "compute" {
  description = "Compute resource abbreviations"
  value       = local.compute
}

output "network" {
  description = "Networking resource abbreviations"
  value       = local.network
}

output "database" {
  description = "Database resource abbreviations"
  value       = local.database
}

output "integration" {
  description = "Integration resource abbreviations"
  value       = local.integration
}

output "web" {
  description = "Web resource abbreviations"
  value       = local.web
}

output "monitoring" {
  description = "Monitoring resource abbreviations"
  value       = local.monitoring
}

output "all" {
  description = "All Azure resource abbreviations combined"
  value = merge(
    local.base,
    local.compute,
    local.network,
    local.database,
    local.integration,
    local.web,
    local.monitoring
  )
}
