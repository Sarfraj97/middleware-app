# Base image
FROM ruby:3.2.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock into the container
COPY Gemfile* /app/

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . /app

# Set the Rails environment to development by default
ENV RAILS_ENV=development

# Expose port 3000 for the Rails app
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
