# --- Builder Stage ---
FROM node:current-alpine3.21 AS builder

WORKDIR /app

# Install dependencies using npm ci for clean install
COPY package.json package-lock.json* ./
RUN npm ci --prefer-offline --no-audit --progress=false

# Copy the rest of the source code
COPY . .

# Build the app for production
RUN npm run build

# --- Production Stage ---
FROM nginx:alpine AS production

# Remove default nginx static assets
RUN rm -rf /usr/share/nginx/html/*

# Copy built assets from builder
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom nginx config (optional, for SPA routing)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
