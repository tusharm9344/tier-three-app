# 3-Tier Architecture DevOps Project

A complete 3-tier web application (Nginx + Flask + PostgreSQL) deployed to AWS EC2 using Terraform, Docker, and a fully automated GitHub Actions CI/CD pipeline.

---

## Architecture OverviewInternet
                        |
                        v
              +-------------------+
              |   Tier 1: Nginx   |   Port 80 (public)
              |   Frontend        |
              +-------------------+
                        |
                        v
              +-------------------+
              |   Tier 2: Flask   |   Internal only
              |   Backend         |
              |   (Gunicorn)      |
              +-------------------+
                        |
                        v
              +-------------------+
              | Tier 3: PostgreSQL|   Internal only
              | Database          |
              +-------------------+
- **Tier 1 (Presentation)**: Nginx serves static HTML and reverse-proxies API calls to the backend.
- **Tier 2 (Application)**: Flask REST API running on Gunicorn, handles business logic.
- **Tier 3 (Data)**: PostgreSQL database, stores all persistent data in a Docker volume.

Each tier runs in its own Docker container. Only the frontend is exposed to the internet; backend and database communicate over internal Docker networks.

---

## Tech Stack

- **Frontend**: Nginx + HTML/JS
- **Backend**: Python Flask + Gunicorn
- **Database**: PostgreSQL 15
- **Containerization**: Docker + Docker Compose
- **Infrastructure as Code**: Terraform
- **Cloud Provider**: AWS (EC2, Security Groups)
- **CI/CD**: GitHub Actions
- **Image Registry**: DockerHub

---
## Key Features

- Fully containerized 3-tier architecture with isolated network boundaries between tiers
- Zero-downtime style automated deployments via GitHub Actions on every push to `dev`
- Infrastructure fully defined as code using Terraform — reproducible from scratch in minutes
- Database connection retry logic in the backend to handle container startup race conditions
- Reverse proxy routing through Nginx, decoupling frontend and backend network exposure
- Secrets-based credential management — no hardcoded passwords anywhere in source control

---

## What I Learned

- Designing network segmentation in Docker Compose so only the necessary tier is internet-facing
- Debugging GitHub Actions secret propagation and DockerHub authentication failures
- Cleaning sensitive/oversized files out of Git history using `filter-branch`
- Structuring Terraform projects with separate variables, outputs, and tfvars for reusability
- Building a CI/CD pipeline that separates build (image creation) from deploy (infrastructure update) as distinct jobs

---

## License

This project is open source and available for learning purposes.
