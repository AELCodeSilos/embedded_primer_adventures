/* linker.ld for STM32F407VG */

MEMORY
{
  FLASH (rx)  : ORIGIN = 0x08000000, LENGTH = 1024K
  RAM (xrw)   : ORIGIN = 0x20000000, LENGTH = 128K
}

SECTIONS
{
  .isr_vector :
  {
    KEEP(*(.isr_vector)) /* Interrupt vector table */
  } > FLASH

  .text :
  {
    *(.text*)            /* Code */
    *(.rodata*)          /* Read-only data */
    _etext = .;
  } > FLASH

  .data : AT (_etext)
  {
    _sdata = .;
    *(.data*)            /* Initialized data */
    _edata = .;
  } > RAM

  .bss :
  {
    _sbss = .;
    *(.bss*)             /* Uninitialized data */
    *(COMMON)
    _ebss = .;
  } > RAM

  .stack :
  {
    . = ALIGN(8);
    _stack_start = .;
    . = . + 2048;        /* 2KB stack */
    _stack_end = .;
  } > RAM

  .heap :
  {
    . = ALIGN(8);
    _heap_start = .;
    . = . + 2048;        /* 2KB heap */
    _heap_end = .;
  } > RAM
}
