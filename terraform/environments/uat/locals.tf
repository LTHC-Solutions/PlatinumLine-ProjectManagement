locals {
  environment = "uat"

  # RDS Aurora PostgreSQL cluster configuration
  rds_instance_class = "db.r6g.large"

  # Enable automatic minor version upgrades for security patches (HIPAA compliance).
  # AWS will apply minor engine patches during the configured maintenance window.
  # Only minor patches are applied — not major version upgrades (e.g., 15 → 16).
  # See: https://github.com/LTHC-Solutions/PlatinumLine-ProjectManagement/issues/415
  rds_auto_minor_version_upgrade = true
}
