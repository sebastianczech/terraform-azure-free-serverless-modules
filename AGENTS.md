# AGENTS.md

This file provides guidance to AI coding agents when working with code in this repository.

## Project Overview

This repository contains Terraform modules for provisioning free-tier serverless resources in Azure. The focus is on creating production-ready, security-hardened Azure resources that fit within Azure's free tier limits.

## Module Architecture

### Core Design Pattern

All modules follow a consistent pattern:
1. **Abbreviations Module** (`modules/abbreviations/`): Centralized resource naming conventions. Contains locals for Azure resource abbreviations (e.g., "rg" for resource group, "func" for function app). Referenced by all other modules to ensure consistent naming.
2. **Data Sources**: Each module uses `data.azurerm_resource_group` to retrieve the parent resource group instead of creating it.
3. **Security-First**: Resources are configured with private networking, disabled public access, and minimum TLS 1.2 by default.

### Available Modules

- `modules/storage_account/`: Standard LRS storage with blob retention, private endpoints
- `modules/cosmos_db/`: Serverless Cosmos DB with 1000 RU/s limit (free tier)
- `modules/function_app/`: Linux Function Apps with App Service Plans
- `modules/api_management/`: API gateway services
- `modules/container_app/`: Serverless container hosting
- `modules/monitor/`: Application Insights and monitoring
- `modules/static_web_app/`: Static website hosting

### Module Dependency Pattern

Modules declare dependencies explicitly. Example from `examples/basic/main.tf`:
```terraform
module "storage_account" {
  source = "../../modules/storage_account"
  resource_group_name = azurerm_resource_group.this.name
  depends_on = [azurerm_resource_group.this]
}

module "function_app" {
  source = "../../modules/function_app"
  storage_account_name = module.storage_account.storage_account_name
  depends_on = [module.storage_account]
}
```

## Development Workflow

### Terraform Commands

```bash
# Initialize modules (required before any operation)
cd examples/basic  # or any module directory
terraform init

# Format all Terraform files
terraform fmt -recursive

# Validate configuration
terraform validate

# Plan changes
terraform plan

# Apply infrastructure
terraform apply

# Check costs before deploying
infracost breakdown --path=.
```

### Pre-commit Hooks

This repository uses pre-commit hooks for automated validation. Hooks run automatically on commit:

```bash
# Install hooks
pre-commit install

# Run manually on all files
pre-commit run --all-files
```

**Key Hooks:**
- `terraform_fmt`: Auto-formats Terraform files
- `terraform_docs`: Auto-generates module documentation (updates README.md files)
- `terraform_validate`: Validates Terraform syntax
- `terraform_tflint`: Lints Terraform code with specific rules enabled
- `infracost_breakdown`: Shows cost estimates
- `checkov`: Security scanning (runs with specific checks skipped - see `.pre-commit-config.yaml`)
- `gitleaks`: Scans for secrets

### Release Process

This repository uses semantic-release for automated versioning:
- **Commit Convention**: Conventional Commits format required
- **Version Triggers**:
  - `feat:` → minor version bump
  - `fix:`, `perf:`, `revert:`, `docs:`, `refactor:`, `chore:`, `ci:` → patch version bump
  - `BREAKING CHANGE:` → major version bump
- **Automated**: Release workflow runs on push to main branch
- **Changelog**: Automatically updated in `CHANGELOG.md`

Example commit messages:
```bash
feat: add static web app module
fix: correct cosmos db capacity limit
docs: update README with usage examples
```

## File Structure Conventions

Each module follows standard Terraform structure:
- `main.tf`: Resource definitions
- `variables.tf`: Input variables
- `outputs.tf`: Output values
- `versions.tf`: Terraform and provider version constraints
- `README.md`: Auto-generated documentation (DO NOT manually edit sections between PRE-COMMIT-TERRAFORM DOCS HOOK markers)

## Security Considerations

### Default Security Settings

All modules apply these security defaults:
- `public_network_access_enabled = false`
- `min_tls_version = "TLS1_2"`
- `allow_nested_items_to_be_public = false` (storage)
- `local_authentication_disabled = true` (where applicable)

### Checkov Exclusions

Several Checkov security checks are intentionally skipped (see `.pre-commit-config.yaml:60-89`):
- CKV_AZURE_132: Key Vault firewall (not applicable for serverless)
- CKV_AZURE_225: Cosmos DB IP filtering (conflicts with private endpoints)
- CKV2_AZURE_33: Function App HTTPS-only (already enforced)
- CKV_AZURE_107: API Management VNet (not in free tier)

When adding security configurations, ensure they're compatible with Azure free tier limits.

## Naming Conventions

Resource names use the pattern: `{prefix_name}-{abbreviation}` or `{prefix_name}{abbreviation}` (no separator for storage accounts due to character restrictions).

The abbreviations module outputs are structured as:
```terraform
locals.base.*         # Common resources (rg, kv, st, log)
locals.compute.*      # Compute resources (func, app, asp, aca)
locals.database.*     # Database resources (cosmos, sql, psql)
locals.integration.*  # Integration resources (apim, sb, evh)
locals.web.*          # Web resources (swa, cdn, fd)
locals.monitoring.*   # Monitoring resources (appi, mag)
```

## Testing and Validation

When modifying modules:
1. Update the `examples/basic/` example to demonstrate changes
2. Run `terraform init` in the example directory
3. Run `terraform validate` to check syntax
4. Run `infracost breakdown --path=.` to verify cost impact
5. Let pre-commit hooks run (especially `terraform_docs` to update README)
6. Ensure all resources remain in free tier limits

## Common Free Tier Limits

- **Cosmos DB**: 1000 RU/s total throughput (`capacity.total_throughput_limit = 1000`)
- **Storage Account**: Standard LRS only, 7-day minimum blob retention
- **Function Apps**: Consumption plan (Y1) or Flex Consumption
- **App Service Plan**: Free tier (F1) or consumption-based
