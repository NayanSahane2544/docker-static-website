# 🚀 Containerized Microservices Deployment with Docker & Apache

<p align="center">
  <b>Building Portable and Scalable Static Websites with Docker Compose</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Containerization-Docker-blue?logo=docker&logoColor=white" alt="Docker">
  <img src="https://img.shields.io/badge/Orchestration-Docker%20Compose-2496ED?logo=docker&logoColor=white" alt="Docker Compose">
  <img src="https://img.shields.io/badge/Web%20Server-Apache-red?logo=apache&logoColor=white" alt="Apache">
  <img src="https://img.shields.io/badge/Environment-Linux%20%2F%20Killercoda-orange" alt="Environment">
  <img src="https://img.shields.io/badge/Status-Completed-success" alt="Project Status">
</p>

---

## 📑 Table of Contents

1. [Project Overview](#-project-overview)
2. [The Problem](#-the-problem)
3. [The Solution](#-the-solution)
4. [Architecture](#-architecture)
5. [Technologies Used](#-technologies-used)
6. [How Containerization Works](#-how-containerization-works)
7. [Live Demo](#-live-demo)
8. [Project Screenshots](#-project-screenshots)
9. [Step-by-Step Implementation](#-step-by-step-implementation)
10. [Container Teardown & Rollback](#-container-teardown--rollback)
11. [Challenges and Key Learnings](#-challenges-and-key-learnings)
12. [Cleanup and Resource Management](#-cleanup-and-resource-management)
13. [Future Improvements](#-future-improvements)
14. [Project Documentation](#-project-documentation)
15. [Author](#-author)

---

## 📌 Project Overview

This project demonstrates a **Containerized Microservices Deployment** for a static website, utilizing Docker, Docker Compose, and an Apache web server running on a Linux environment. 

The application is deployed as an isolated, lightweight container:

- 🌐 **Web Tier:** Hosts the static HTML, CSS, JavaScript, and image assets.
- 🐳 **Container Engine:** Docker builds and isolates the environment using the `httpd:2.4-alpine` image.
- ⚙️ **Orchestration:** Docker Compose manages the container lifecycle and network mappings.
- 🔀 **Port Mapping:** Host traffic on port `8080` is seamlessly routed to the container's port `80`.
- 📁 **Version Control:** Project files and configurations are tracked and pushed to GitHub using a Personal Access Token (PAT).

### 🎯 Project Objectives

- Structure a local web directory for deployment (`web2`).
- Write a `Dockerfile` to build a custom Apache image.
- Configure `docker-compose.yml` for automated container orchestration.
- Expose and test the application on a specific port.
- Troubleshoot Linux terminal operations and Git authentication.
- Securely push the code to a remote GitHub repository.

## 🤔 The Problem

In a traditional web deployment, hosting a static website requires manually installing and configuring a web server on a host machine. 

This can lead to:

- "It works on my machine" syndrome due to environment differences.
- Difficulties migrating the website to a new server.
- Configuration conflicts if multiple websites are hosted on the same machine.
- Cumbersome rollback processes if a deployment fails.

## 💡 The Solution

Docker containerization packages the web server (Apache) and the website files together into a single, portable unit. 

Docker Compose simplifies running this unit with predefined network settings.

**Benefits of this approach:**

- Guaranteed consistency across all environments (development, testing, production).
- Extremely fast startup times using the lightweight Alpine Linux distribution.
- Clean isolation from the host operating system.
- One-command deployment (`docker-compose up`) and teardown (`docker-compose down`).
- Easily extensible to a full microservices architecture by adding more containers (e.g., backend, database).

## 🏗️ Architecture

<img src="Architecture_Diagram.png" width="800">

### 🔄 Request Flow

1. A user accesses the Linux Host IP or `localhost` on port `8080`.
2. The Docker Engine receives the incoming request.
3. The port mapping configuration routes the request from host port `8080` into container port `80`.
4. The Apache Web Server processes the request.
5. The requested static files (`index.html`, `style.css`, etc.) are served back to the user.

## ☁️ Technologies Used

| Technology | Purpose |
|---|---|
| **Linux (Ubuntu)** | The host operating system running the Docker Engine (Killercoda). |
| **Docker** | Builds and runs the isolated application container. |
| **Docker Compose** | Orchestrates the container network, ports, and deployment state. |
| **Apache HTTP Server** | The web server running inside the container (`httpd:alpine`). |
| **HTML / CSS / JS** | The static assets constituting the web application. |
| **Git & GitHub** | Version control and remote repository hosting. |

## ⚖️ How Containerization Works

The following table illustrates how the host environment translates to the isolated container environment in this project:

| Component | Host Environment | Docker Container |
|---|---|---|
| Operating System | Ubuntu 24.04 | Alpine Linux |
| Web Root Directory | `~/apache-service/web2` | `/usr/local/apache2/htdocs/` |
| Network Port | `8080` | `80` (Standard HTTP) |
| Running Process | Docker Daemon | `httpd` (Apache) |

**Important:** Because we use a `COPY .` command in the Dockerfile, the image is baked with a snapshot of the files. If you change a file on the host, you must rebuild the image (`--build`) for the container to reflect the changes.

## 🎬 Live Demo

### Docker Static Deployment — Demo

Watch the project deployment directly below.

<p align="center">
  <img src="demo.gif" alt="Docker Deployment Demo" width="800">
  <br>
  *(Add a GIF of your Killercoda deployment process here)*
</p>

## 🖼️ Project Screenshots

### 1. Project Directory Structure
*(Upload screenshot of your `web2` folder with `img`, `index.html`, etc.)*

### 2. Docker Build Process
*(Upload screenshot of the terminal running `docker-compose up -d --build`)*

### 3. Container Running
*(Upload screenshot of `docker ps` showing the running container)*

### 4. Website Output
*(Upload screenshot of the live website accessed via port 8080)*

### 5. GitHub Push Success
*(Upload screenshot of the successful `git push` using your PAT)*

## 🛠️ Step-by-Step Implementation

### Step 1: Prepare the Workspace
- Create the project directory structure (`mkdir -p apache-service/web2`).
- Add the static web assets (`index.html`, `style.css`, `script.js`, and the `img/` folder).

### Step 2: Create the Dockerfile
- Create a `Dockerfile` using the `httpd:2.4-alpine` base image.
- Configure the `COPY . /usr/local/apache2/htdocs/` instruction to bundle the files.
- Expose port `80` for internal container traffic.

### Step 3: Configure Docker Compose
- Create `docker-compose.yml` specifying the service (`frontend-web`).
- Set the build context to the current directory (`build: .`).
- Map the host port `8080` to the container port `80`.
- Set restart policies to `unless-stopped`.

### Step 4: Deploy the Container
- Run `docker-compose up -d --build` to build the custom image and start the container in detached mode.
- Verify deployment by accessing `http://localhost:8080`.

### Step 5: Version Control and GitHub
- Initialize a local git repository (`git init`).
- Commit all configuration and website files.
- Generate a GitHub Personal Access Token (PAT) with `repo` permissions.
- Push the code to the remote GitHub repository using the PAT for authentication.

## 🔄 Container Teardown & Rollback

If you need to update the website, alter the configuration, or clean up the environment, Docker Compose makes teardown simple.

1. Navigate to the directory containing the `docker-compose.yml` file.
2. Run `docker-compose down`.
3. The terminal will gracefully stop and remove the container and the isolated network.
4. To rebuild with new changes, simply run `docker-compose up -d --build` again.

## 🧠 Challenges and Key Learnings

Through this project, I gained practical experience with:

- **Docker Build Context:** Understanding how the `.` in `COPY .` captures subfolders like `/img`.
- **Command Line Troubleshooting:** Moving between directories and managing Linux files without a GUI.
- **Git Authentication:** Learning that GitHub no longer supports passwords for terminal operations, and successfully generating and applying a Personal Access Token (PAT).
- **Port Mapping:** Grasping the concept of routing external host traffic into an isolated container's internal network.

## 💰 Cleanup and Resource Management

Docker containers consume disk space and system memory. After completing the demonstration:

- Stop running containers: `docker-compose down`
- Remove unused Docker images to free up space: `docker image prune -a`
- If using Killercoda, simply closing the browser tab will automatically destroy the temporary environment at no cost.

## 🚀 Future Improvements

Possible improvements include:

- Using **Nginx** instead of Apache for potentially higher performance with static files.
- Adding a **backend microservice** (like Node.js or Python) and connecting them via Docker networks.
- Implementing a **CI/CD Pipeline** using GitHub Actions to automatically build and push the Docker image when code is updated.
- Setting up a **Volume Mount** (`volumes: - .:/usr/local/apache2/htdocs/`) for live-reloading during development without needing to rebuild the image.

## 📄 Project Documentation

The complete project documentation contains the system architecture, component breakdown, and step-by-step deployment guide.

📘 **[Read the Containerized Static Website Documentation](Containerized_Static_Website_Documentation.docx)**

## 👨‍💻 Author

**Nayan Sahane**

- GitHub: [NayanSahane2544](https://github.com/NayanSahane2544)

---

<p align="center">
  ⭐ If you find this project useful, consider starring the repository!
</p>
