use core::arch::global_asm;

#[cfg(feature = "x86_64")]
global_asm!(include_str!("boot.S"));

