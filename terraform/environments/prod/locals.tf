locals {
  environment = "prod"

  # RDS Aurora PostgreSQL cluster configuration
  # Upgraded from db.t3.large to db.r6g.large to eliminate burstable CPU credit
  # exhaustion risk and double available memory (8 GB -> 16 GB).
  # See: https://github.com/LTHC-Solutions/PlatinumLine-ProjectManagement/issues/412
  rds_instance_class = "db.r6g.large"
}
