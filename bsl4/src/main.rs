#![no_std]
#![no_main]

pub mod arch;

mod panic;

/// Entry.
#[no_mangle]
unsafe extern "C" fn bsl4_enter() -> ! {
    loop {}
}

