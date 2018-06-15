FROM buildpack-deps:bionic
LABEL maintainer="skinlayers@gmail.com"

ARG SPROUT_PKEY_NAME=sprout-proving.key
ARG SPROUT_PKEY_URL=https://z.cash/downloads/$SPROUT_PKEY_NAME
ARG SPROUT_PKEY_SHA256=8bc20a7f013b2b58970cddd2e7ea028975c88ae7ceb9259a5344a16bc2c0eef7
ARG SPROUT_PKEY_SHA256_FILE=sprout-proving-sha256.txt
RUN set -eu && \
    curl -L "$SPROUT_PKEY_URL" -o "$SPROUT_PKEY_NAME" && \
    echo "$SPROUT_PKEY_SHA256  $SPROUT_PKEY_NAME" \
        > "$SPROUT_PKEY_SHA256_FILE" && \
    sha256sum -c "$SPROUT_PKEY_SHA256_FILE"

ARG SPROUT_VKEY_NAME=sprout-verifying.key
ARG SPROUT_VKEY_URL=https://z.cash/downloads/$SPROUT_VKEY_NAME
ARG SPROUT_VKEY_SHA256=4bd498dae0aacfd8e98dc306338d017d9c08dd0918ead18172bd0aec2fc5df82
ARG SPROUT_VKEY_SHA256_FILE=sprout-verifying-sha256.txt
RUN curl -L "$SPROUT_VKEY_URL" -o "$SPROUT_VKEY_NAME" && \
    echo "$SPROUT_VKEY_SHA256  $SPROUT_VKEY_NAME" \
        > "$SPROUT_VKEY_SHA256_FILE" && \
    sha256sum -c "$SPROUT_VKEY_SHA256_FILE"

