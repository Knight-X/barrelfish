/*
 * Kernel-level serial driver.  Implements the interface in
 * /kernel/include/serial.h
 *
 * Copyright (c) 2015-2016, ETH Zurich.
 * Copyright (c) 2016, Hewlett Packard Enterprise Development LP.
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached LICENSE file.
 * If you do not find this file, copies can be found by writing to:
 * ETH Zurich D-INFK, Universitaetstr. 6, CH-8092 Zurich. Attn: Systems Group.
 */


#include <kernel.h>
#include <offsets.h>
#include <serial.h>
#include <dev/pl011_uart_dev.h>
#include <arch/arm/pl011.h>
#include <arch/armv8/platform.h>

#define NUM_PORTS 1
unsigned int serial_console_port = 0;
unsigned int serial_debug_port = 1;
unsigned serial_num_physical_ports = NUM_PORTS;

#define UART_STEP 0x00010000


errval_t serial_init(unsigned port, bool initialize_hw)
{
    lvaddr_t base = uart_base[port];
    pl011_init(port, base, initialize_hw);
    return SYS_ERR_OK;
};

//errval_t
//serial_init(unsigned int port, bool hwinit) {
//    if(port >= NUM_PORTS) return SYS_ERR_SERIAL_PORT_INVALID;
//    return SYS_ERR_OK;
//}
//
//errval_t
//serial_early_init(unsigned int port) {
//    if(port >= NUM_PORTS) return SYS_ERR_SERIAL_PORT_INVALID;
//    pl011_configure(port, (platform_get_uart_address() | KERNEL_OFFSET) + port*UART_STEP);
//    pl011_init(port, true);
//    return SYS_ERR_OK;
//}
//
//void
//serial_putchar(unsigned int port, char c) {
//    assert(port < NUM_PORTS);
//    pl011_putchar(port, c);
//}
//
//char
//serial_getchar(unsigned int port) {
//    assert(port < NUM_PORTS);
//    return pl011_getchar(port);
//}
