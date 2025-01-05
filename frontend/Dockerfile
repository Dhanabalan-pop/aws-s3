# build stage
FROM node:18-alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm install && npm cache clean --force

COPY . .
ENV NODE_OPTIONS=--openssl-legacy-provider
# Run the build script to create the build directory
RUN npm run build

#################################
# production stage
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Copy the build output to the nginx html directory
COPY --from=builder /app/build .

# Use JSON format for CMD instruction
CMD ["nginx", "-g", "daemon off;"]