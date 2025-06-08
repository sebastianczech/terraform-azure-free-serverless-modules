# Terraform modules for provisioning free serverless resource in Azure cloud

## Available Features

Currently below Azure services & resources are supported:
- Cosmos DB
- API Management
- Container Apps
- Functions
- Monitor
- Static Web Apps

## Prerequisites

1. Install tools:
   - [Terraform](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli)
   - [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)

## Examples

### Basic

#### Architecture

```mermaid
C4Context
    title Azure Serverless Architecture Overview

    Enterprise_Boundary(azure, "Azure Cloud") {
        System_Boundary(rg, "Resource Group") {
            Container(apim, "API Management", "Gateway", "Manages and secures APIs")
            Container(functions, "Azure Functions", "Serverless", "Event-driven code execution")
            Container(swa, "Static Web Apps", "Hosting", "Web hosting and API integration")
            Container(cosmos, "Cosmos DB", "Database", "NoSQL database service")
            Container(ca, "Container Apps", "Containers", "Serverless container apps")
            Container(monitor, "Azure Monitor", "Monitoring", "Application insights and logging")
        }
    }

    Rel(apim, functions, "Routes requests")
    Rel(functions, cosmos, "Store/retrieve data")
    Rel(swa, functions, "Call APIs")
    Rel(ca, cosmos, "Store/retrieve data")
    Rel_U(monitor, apim, "Monitor")
    Rel_U(monitor, functions, "Monitor")
    Rel_U(monitor, swa, "Monitor")
    Rel_U(monitor, cosmos, "Monitor")
    Rel_U(monitor, ca, "Monitor")
```

This diagram presents the high-level architecture of supported Azure services that can be deployed using these Terraform modules. All components are deployed within a single resource group and can be monitored using Azure Monitor.

#### Usage

1. Initialize Terraform:

```bash
cd examples/basic
terraform init
```

2. Prepare file with variables values:

```bash
cp example.tfvars terraform.tfvars
vi terraform.tfvars
```

3. Check costs before deploying:

```bash
infracost breakdown --path=.
```

4. Apply code for infrastructure:

```bash
terraform apply
```

## Links

* [Azure serverless](https://azure.microsoft.com/en-us/solutions/serverless)
* [Explore free Azure services](https://azure.microsoft.com/en-us/pricing/free-services)
