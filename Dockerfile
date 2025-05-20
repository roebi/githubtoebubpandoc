FROM pandoc/latex:3.1.5.2

RUN apk add --no-cache git bash

RUN addgroup -S appgroup && adduser -S appuser -G appgroup
WORKDIR /workspace

COPY convert_github_to_epub.bsh /usr/local/bin/convert_github_to_epub.bsh
RUN chmod +x /usr/local/bin/convert_github_to_epub.bsh

USER appuser

ENTRYPOINT ["/usr/local/bin/convert_github_to_epub.bsh"]
