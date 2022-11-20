ARG VARIANT=latest
FROM ghcr.io/alexjackson1/contex:${VARIANT} as compile

WORKDIR /usr/document
COPY ./ ./
ARG DOCUMENT_NAME=main
RUN latexmk -interaction=nonstopmode -file-line-error -xelatex -outdir=build ${DOCUMENT_NAME}.tex && \
    cp build/${DOCUMENT_NAME}.pdf .

FROM busybox:stable
ARG DOCUMENT_NAME=main
COPY --from=compile /usr/document/${DOCUMENT_NAME}.pdf /