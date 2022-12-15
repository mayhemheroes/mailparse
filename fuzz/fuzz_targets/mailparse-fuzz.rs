#![no_main]
use libfuzzer_sys::fuzz_target;
use mailparse::*;

fuzz_target!(|data: &[u8]| {
    parse_mail(data);
});
