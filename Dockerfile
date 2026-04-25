FROM nginx:alpine AS base

# Copy static website files
COPY . /usr/share/nginx/html/

# Configure nginx with basic optimization and logging to stdout/stderr
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Forward nginx logs to Docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
