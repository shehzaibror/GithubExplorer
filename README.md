# GitHub User Explorer

GitHub User Explorer is a simple web application built with Ruby on Rails that allows you to search for GitHub users and view their repositories using the Github Public API.

## Prerequisites

- Ruby (version 3.0.2)
- Rails (version 7 or higher)
- PostgreSQL
- Docker (optional, if you want to run the app using Docker)

## Getting Started

### Clone the repository

```bash
git clone https://github.com/username/GithubExplorer.git
cd GithubExplorer
```

### Install Dependencies

```bash
bundle install
```

### Set up the database
Make sure you have PostgreSQL installed and running on your system. Update the config/database.yml file with your PostgreSQL credentials if necessary.

Create and migrate the database:

```bash
rails db:create
rails db:migrate
```

### Start the Server
```bash
rails server
```

### Usage

- Open your web browser and go to http://localhost:3000.
- Enter a GitHub username in the search box and click the "Search" button.
- The application will fetch the user's information from the GitHub API and display it on the left side of the page.
- The user's repositories will be displayed on the right side of the page.
- Click on a repository name to view its details on GitHub.

## Using Docker (Optional)
If you prefer to use Docker to run the app, follow these steps:

Build the Docker image:
```bash
docker-compose build
```

Set up the database:
```bash
docker-compose run web rails db:create db:migrate
```

Start the server:
```bash
docker-compose up
```