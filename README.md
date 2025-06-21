# Todo App – React + Vite + Docker + Jenkins

This is a simple project that demonstrates the workflow for production using Docker and Jenkins. It is intended as a reference implementation for modern frontend deployment pipelines.

A modern, production-ready Todo application built with React, Vite, and Tailwind CSS. The project is containerized with Docker and supports automated CI/CD using Jenkins.

## Features

- Fast React development with Vite
- State management using React Context API
- Tailwind CSS for rapid UI styling
- Production-optimized Docker multi-stage build
- Nginx for static file serving and SPA routing
- Jenkins pipeline for automated build, test, and deployment

## Tech Stack

- [React](https://react.dev/)
- [Vite](https://vitejs.dev/)
- [Tailwind CSS](https://tailwindcss.com/)
- [Docker](https://www.docker.com/)
- [Nginx](https://nginx.org/)
- [Jenkins](https://www.jenkins.io/)

## Getting Started

### Prerequisites

- Node.js (v18+ recommended)
- npm
- Docker (for production build)
- Jenkins (for CI/CD)

### Local Development

1. **Install dependencies:**
   ```sh
   npm install
   ```
2. **Start the development server:**
   ```sh
   npm run dev
   ```
3. Open [http://localhost:5173](http://localhost:5173) in your browser.

### Production Build

1. **Build the app:**
   ```sh
   npm run build
   ```
2. **Preview the production build:**
   ```sh
   npm run preview
   ```

### Docker Usage

1. **Build the Docker image:**
   ```sh
   docker build -t todo-app .
   ```
2. **Run the container:**
   ```sh
   docker run --name todo-app -p 80:80 -d todo-app
   ```
3. The app will be available at [http://localhost](http://localhost)

### CI/CD with Jenkins

- The `Jenkinsfile` automates cloning, building, testing, and deploying the Dockerized app.
- Ensure your Jenkins agent has Docker installed and access to the project repository.

## Folder Structure

```
├── Dockerfile
├── Jenkinsfile
├── README.md
├── package.json
├── vite.config.js
├── tailwind.config.js
├── postcss.config.js
├── public/
├── src/
│   ├── App.jsx
│   ├── main.jsx
│   ├── App.css
│   ├── index.css
│   ├── Component/
│   │   ├── TodoForm.jsx
│   │   ├── TodoItem.jsx
│   │   └── index.js
│   └── context/
│       └── todoContext.js
└── nginx.conf
```

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/your-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/your-feature`)
5. Open a pull request
