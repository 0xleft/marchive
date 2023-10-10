# Use an official Ruby runtime as a parent image
FROM ruby:3.2.2
# Set the working directory in the container
WORKDIR /app
# Install dependencies
RUN gem install bundler
# Copy Gemfile and Gemfile.lock into the container
COPY Gemfile Gemfile.lock ./
# Install Ruby dependencies
RUN bundle install
# Copy the rest of the application code into the container
COPY . .
# Expose port 3000 for the Rails application
EXPOSE 80
# Start the Rails application
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "80", "-e", "production"]