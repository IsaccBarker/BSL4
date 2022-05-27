extern "C" {
    pub static __bootrom_start__: u64;
    pub static __bootrom_size__: u64;
    pub static __approm_start__: u64;
    pub static __approm_size__: u64;

    pub fn load_stack_ptr_jmp(pc: u32, sp: u32);
}

#[allow(dead_code)]
pub fn start_aarch64() {
    unsafe {
        let reset_ptr_jump = get_reset_ptr_jump();
        let pc = reset_ptr_jump.1;
        let sp = reset_ptr_jump.0;

        load_stack_ptr_jmp(pc, sp);
    }
}

unsafe fn get_reset_ptr_jump() -> (u32, u32) {
    let app_code = __approm_start__ as *const u32;
    let app_sp = *app_code;
    let app_pc = *app_code.add(1);

    (app_sp, app_pc)
}

