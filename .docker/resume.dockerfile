FROM pandoc/latex:2.9

RUN apk add make
RUN apk --no-cache add libc6-compat rsync
RUN mkdir /context && cd /context \
  && wget http://minimals.contextgarden.net/setup/first-setup.sh \
    && sh ./first-setup.sh --modules=all --engine=luatex
# adjust PATH
ENV PATH "/context/tex/texmf-linuxmusl-64/bin:$PATH"


COPY actions/entrypoint.sh /entrypoint.sh
