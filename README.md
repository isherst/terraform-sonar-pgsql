# SonarQube with PostgreSQL Deployment Using Terraform

This repository provides a setup for deploying SonarQube integrated with PostgreSQL in a local Minikube environment using Terraform. The included `install.sh` script automates the installation process.

## Prerequisites

The setup was developed and succesfuly tested on:

- **Ubuntu** (22.04.5 LTS (Jammy Jellyfish))
- **Terraform** (v1.9.8)
- **Helm** (v3.16.2)
- **Minikube** (v1.34.0)
- **Docker** (v27.3.1)
- **Bash** (5.1.16(1)-release (x86_64-pc-linux-gnu))

## Installation and Setup

Follow these steps to deploy SonarQube and PostgreSQL:

### 1. Clone the Repository
```bash
git clone https://github.com/isherst/terraform-sonar-pgsql.git
cd terraform-sonar-pgsql
```

### 2. Ensure that installation script can be executed
```bash
chmod +x ./install.sh
```

### 3. Run the instalation script
```bash
./install.sh
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
