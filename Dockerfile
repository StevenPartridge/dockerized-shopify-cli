FROM ruby:3.3.0

# Set the working directory
WORKDIR /usr/src/app

# Create a non-root user and ensure home directory is properly owned
RUN groupadd -g 1000 appuser && \
    useradd -r -u 1000 -g appuser appuser -m -d /home/appuser && \
    mkdir -p /usr/local/bundle && \
    chown -R appuser:appuser /usr/local/bundle /usr/src/app /home/appuser

# Install Node.js and build-essential
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs build-essential

USER appuser

# Install Shopify CLI and theme tools
# Ensure global node modules are installed in a directory owned by appuser
ENV NPM_CONFIG_PREFIX=/home/appuser/.npm-global
RUN npm install -g @shopify/cli @shopify/theme && \
    chown -R appuser:appuser /home/appuser

# Create directory within the container
RUN mkdir -p /home/appuser/.config

# Set permissions and ownership
RUN chown -R appuser:appuser /home/appuser/.config

# Install Ruby gems with Bundler
RUN gem install bundler

# Set environment path for globally installed node modules
ENV PATH="/home/appuser/.npm-global/bin:${PATH}"

# Copy the application files to the container
COPY --chown=appuser:appuser . /usr/src/app

# Install Ruby gems
RUN bundle install
