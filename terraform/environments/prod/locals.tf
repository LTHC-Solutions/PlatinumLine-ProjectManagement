locals {
  environment = "prod"

  # RDS Aurora PostgreSQL cluster configuration
  # Upgraded from db.t3.large to db.r6g.large to eliminate burstable CPU credit
  # exhaustion risk and double available memory (8 GB -> 16 GB).
  # See: https://github.com/LTHC-Solutions/PlatinumLine-ProjectManagement/issues/412
  rds_instance_class = "db.r6g.large"

  # RDS maintenance window — minor version patches are applied automatically during this window.
  rds_maintenance_window = "fri:10:00-fri:11:00"

  # Enable automatic minor version upgrades for security patches (HIPAA compliance).
  # AWS will apply minor engine patches during rds_maintenance_window above.
  # Only minor patches are applied — not major version upgrades (e.g., 15 → 16).
  # See: https://github.com/LTHC-Solutions/PlatinumLine-ProjectManagement/issues/415
  rds_auto_minor_version_upgrade = true
}
