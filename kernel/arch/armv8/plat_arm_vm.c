/**
 * \file plat_arm_vm.c
 * \brief 
 */


/*
 * Copyright (c) 2016 ETH Zurich.
 * All rights reserved.
 *
 * This file is distributed under the terms in the attached LICENSE file.
 * If you do not find this file, copies can be found by writing to:
 * ETH Zurich D-INFK, Universitaetsstrasse 6, CH-8092 Zurich. Attn: Systems Group.
 */

#include <kernel.h>
#include <offsets.h>
#include <platform.h>
#include <serial.h>
#include <arch/arm/pl011.h>

errval_t serial_init(unsigned port, bool initialize_hw)
{
    lvaddr_t base = local_phys_to_mem(uart_base[port]);
    pl011_init(port, base, initialize_hw);
    return SYS_ERR_OK;
};

/*
 * Return the address of the UART device.
 */
lpaddr_t platform_get_uart_address(unsigned port)
{
    return local_phys_to_mem(uart_base[port]);
}

/*
 * Do any extra initialisation for this particular CPU (e.g. A9/A15).
 */
void platform_revision_init(void)
{

}

/*
 * Figure out how much RAM we have
 */
size_t platform_get_ram_size(void)
{
    return 0;
}

/*
 * Boot secondary processors
 */
int platform_boot_aps(coreid_t core_id, genvaddr_t gen_entry)
{
    return 0;
}

void platform_notify_bsp(lpaddr_t *mailbox)
{

}


/*
 * Return the core count
 */
size_t platform_get_core_count(void)
{
    return 0;
}

/*
 * Print system identification. MMU is NOT yet enabled.
 */
void platform_print_id(void)
{

}

/*
 * Fill out provided `struct platform_info`
 */
void platform_get_info(struct platform_info *pi)
{

}

void armv8_get_info(struct arch_info_armv8 *ai)
{

}

/*
 * Timers
 */
void timers_init(int timeslice)
{

}

uint64_t timestamp_read(void)
{

    return 0;
}

uint32_t timestamp_freq(void)
{
    return 1;
}

bool timer_interrupt(uint32_t irq)
{
    return 0;
}
