.syntax unified
.cpu cortex-m4
.fpu softvfp
.thumb

.global _start
.global Reset_Handler

/* Vector Table */
.section .isr_vector, "a", %progbits
.type isr_vector, %object
isr_vector:
    .word _estack                 /* Initial Stack Pointer */
    .word Reset_Handler          /* Reset Handler */
    .word NMI_Handler            /* NMI Handler */
    .word HardFault_Handler      /* Hard Fault Handler */
    .word MemManage_Handler      /* MPU Fault Handler */
    .word BusFault_Handler       /* Bus Fault Handler */
    .word UsageFault_Handler     /* Usage Fault Handler */
    .word 0                      /* Reserved */
    .word 0                      /* Reserved */
    .word 0                      /* Reserved */
    .word 0                      /* Reserved */
    .word SVC_Handler            /* SVCall Handler */
    .word DebugMon_Handler       /* Debug Monitor Handler */
    .word 0                      /* Reserved */
    .word PendSV_Handler         /* PendSV Handler */
    .word SysTick_Handler        /* SysTick Handler */

    /* External Interrupts (can be extended as needed) */
    .word Default_Handler        /* IRQ0 */
    .word Default_Handler        /* IRQ1 */
    .word Default_Handler        /* IRQ2 */
    .word Default_Handler        /* IRQ3 */
    .word Default_Handler        /* IRQ4 */
    .word Default_Handler        /* IRQ5 */
    .word Default_Handler        /* IRQ6 */
    .word Default_Handler        /* IRQ7 */
    .word Default_Handler        /* IRQ8 */
    .word Default_Handler        /* IRQ9 */
    .word Default_Handler        /* IRQ10 */
    .word Default_Handler        /* IRQ11 */
    .word Default_Handler        /* IRQ12 */
    .word Default_Handler        /* IRQ13 */
    .word Default_Handler        /* IRQ14 */
    .word Default_Handler        /* IRQ15 */
    /* Add more IRQs as needed for STM32F407VG */

.size isr_vector, . - isr_vector

/* Reset Handler */
.section .text.Reset_Handler
.type Reset_Handler, %function
Reset_Handler:
    /* Call system initialization (e.g., SystemInit) */
    bl SystemInit

    /* Call main function */
    bl main

    /* Infinite loop if main returns */
    b .

/* Default Handlers */
.section .text.Default_Handler, "ax", %progbits
.type Default_Handler, %function
Default_Handler:
    b .

/* Weak aliases for exception handlers */
.weak NMI_Handler
.thumb_set NMI_Handler, Default_Handler

.weak HardFault_Handler
.thumb_set HardFault_Handler, Default_Handler

.weak MemManage_Handler
.thumb_set MemManage_Handler, Default_Handler

.weak BusFault_Handler
.thumb_set BusFault_Handler, Default_Handler

.weak UsageFault_Handler
.thumb_set UsageFault_Handler, Default_Handler

.weak SVC_Handler
.thumb_set SVC_Handler, Default_Handler

.weak DebugMon_Handler
.thumb_set DebugMon_Handler, Default_Handler

.weak PendSV_Handler
.thumb_set PendSV_Handler, Default_Handler

.weak SysTick_Handler
.thumb_set SysTick_Handler, Default_Handler

/* Stack top definition */
.section .stack
.word 0x20020000 /* Top of 128KB SRAM for STM32F407VG */