OUTPUT_FORMAT(binary)

SECTIONS {
    .boot :{
        *(.boot)
    }
    .text 0x200:{
        *(.text)
    }
    .data :{
        *(.data)
    }
    .bss :{
        *(.bss)
    }
    .rodata :{
        *(.rodata)
    }
}