#![no_std]
#![no_main]

mod panic;

/// Entry.
#[no_mangle]
unsafe extern "C" fn bsl4_enter() -> ! {
    loop {}
}

