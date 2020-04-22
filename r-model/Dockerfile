FROM SRC_IMG

# Create directories
RUN mkdir -p /repo

# Copy model
COPY REPO/ /repo

WORKDIR /repo

ENTRYPOINT ["Rscript"]