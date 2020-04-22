FROM SRC_IMG

# Create directories
RUN mkdir -p /repo

# Copy model and entrypoint
COPY entrypoint.sh /
COPY REPO/ /repo

# Make entrypoint executable
RUN chmod +x /entrypoint.sh

WORKDIR /repo

ENTRYPOINT ["/entrypoint.sh"]