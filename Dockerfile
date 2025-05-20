FROM pandoc/latex:3.7.0.1

RUN apk add --no-cache git curl bash dos2unix

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /workspace
RUN chown -R appuser:appgroup /workspace

COPY convert_github_to_epub.bsh /usr/local/bin/convert_github_to_epub.bsh
RUN dos2unix /usr/local/bin/convert_github_to_epub.bsh && \
    chmod +x /usr/local/bin/convert_github_to_epub.bsh

USER appuser

ENTRYPOINT ["/bin/bash", "/usr/local/bin/convert_github_to_epub.bsh"]
