FROM SRC_IMG

# Create directories
RUN mkdir -p /repo

# Copy model and entrypoint
COPY entrypoint.sh /repo
COPY REPO/ /repo

# Make entrypoint executable
RUN ["chmod", "+x", "/repo/entrypoint.sh"]

WORKDIR /repo

ENTRYPOINT ["entrypoint.sh"]