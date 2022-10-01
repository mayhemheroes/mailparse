FROM ghcr.io/evanrichter/cargo-fuzz as builder

ADD . /mailparse
WORKDIR /mailparse/fuzz
RUN cargo +nightly fuzz build 

FROM debian:bookworm
COPY --from=builder /mailparse/fuzz/target/x86_64-unknown-linux-gnu/release/mailparse-fuzz /