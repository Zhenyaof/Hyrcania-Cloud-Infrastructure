                        Internet
                            │
                            │
                Azure Application Gateway
                            │
                            │
                Azure Load Balancer (L4)
                            │
        ┌───────────────────┴───────────────────┐
        │                                       │
        │         Azure Virtual Network         │
        │                                       │
        │  ┌──────────────┐   ┌──────────────┐  │
        │  │ Web Subnet   │   │ Mgmt Subnet │  │
        │  └──────────────┘   └──────────────┘  │
        │                                       │
        │  ┌──────────────┐   ┌──────────────┐  │
        │  │ App Subnet   │   │ DB Subnet   │  │
        │  └──────────────┘   └──────────────┘  │
        │                                       │
        └───────────────────┬───────────────────┘
                            │
                            │
                    Ubuntu Virtual Machine
                            │
                    Docker Compose Stack
                            │
          ┌─────────────────┴────────────────┐
          │                                  │
     Flask Application                 PostgreSQL 16
          │                                  │
          └──────────────┬───────────────────┘
                         │
                  Azure Storage Account

Security:
• Network Security Groups
• Azure Firewall
• Azure Bastion

Operations:
• Azure Monitor
• Log Analytics
• Recovery Services Vault
