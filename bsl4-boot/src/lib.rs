#![no_std]
#![no_main]

mod panic;
mod aarch64;

/// Entry.
#[no_mangle]
pub extern "C" fn _start() -> ! {
    #[cfg(feature="aarch64")]
    aarch64::start_aarch64();

    loop {}
}

