FROM concourse/static-golang

ADD scripts/local /go/local

RUN mkdir -p src/github.com/concourse && \
    cd src/github.com/concourse && \
    git clone https://github.com/troyready/s3-resource.git

# VOLUME /assets

CMD ["/bin/bash", "/go/local"]
