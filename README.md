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

## Project Structure
3-tier/
├── docker-compose.yml          # local dev (builds images)
├── docker-compose.prod.yml     # production (pulls images)
├── frontend/                   # Nginx + static UI
├── backend/                    # Flask API
├── terraform/                  # AWS infra as code
└── .github/workflows/          # CI/CD pipeline
