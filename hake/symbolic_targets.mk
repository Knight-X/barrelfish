##########################################################################
# Copyright (c) 2009-2013 ETH Zurich.
# All rights reserved.
#
# This file is distributed under the terms in the attached LICENSE file.
# If you do not find this file, copies can be found by writing to:
# ETH Zurich D-INFK, CAB F.78, Universitaetstr. 6, CH-8092 Zurich,
# Attn: Systems Group.
#
# This file defines symbolic (i.e. non-file) targets for the Makefile
# generated by Hake.  Edit this to add your own symbolic targets.
#
##########################################################################

# Disable built-in implicit rules. GNU make adds environment's MAKEFLAGS too.
MAKEFLAGS=r

# Explicitly disable the flex and bison implicit rules
%.c : %.y

%.c : %.l

# Set default architecture to the first specified by Hake in generated Makefile.
ARCH ?= $(word 1, $(HAKE_ARCHS))
ARM_GCC?=arm-none-linux-gnueabi-gcc
ARM_OBJCOPY?=arm-none-linux-gnueabi-objcopy
# settings for the Intel Xeon Phi
K1OM_GCC?=x86_64-k1om-barrelfish-gcc
K1OM_OBJCPY?=x86_64-k1om-barrelfish-objcopy

# All binaries of the RCCE LU benchmark
BIN_RCCE_LU= \
	sbin/rcce_lu_A1 \
	sbin/rcce_lu_A2 \
	sbin/rcce_lu_A4 \
	sbin/rcce_lu_A8 \
	sbin/rcce_lu_A16 \
	sbin/rcce_lu_A32 \
	sbin/rcce_lu_A64

# All binaries of the RCCE BT benchmark
BIN_RCCE_BT= \
	sbin/rcce_bt_A1 \
	sbin/rcce_bt_A4 \
	sbin/rcce_bt_A9  \
	sbin/rcce_bt_A16 \
	sbin/rcce_bt_A25 \
	sbin/rcce_bt_A36

# Default list of modules to build/install for all enabled architectures
MODULES_COMMON= \
	sbin/init_null \
	sbin/init \
	sbin/chips \
	sbin/skb \
	sbin/spawnd \
	sbin/startd \
	sbin/flounder_stubs_empty_bench \
	sbin/flounder_stubs_buffer_bench \
	sbin/flounder_stubs_payload_bench \
	sbin/hellotest \
	sbin/mem_serv \
	sbin/idctest \
	sbin/memtest \
	sbin/fread_test \
	sbin/fscanf_test \
	sbin/monitor \
	sbin/ramfsd \
	sbin/channel_cost_bench \
	sbin/schedtest \
	sbin/testerror \
	sbin/yield_test \
	sbin/xcorecap \
	sbin/xcorecapserv \
	sbin/xcorecapbench \

# List of modules that are arch-independent and always built
MODULES_GENERIC= \
	skb_ramfs.cpio.gz \
	sshd_ramfs.cpio.gz \

# x86_64-specific modules to build by default
# this should shrink as targets are ported and move into the generic list above
MODULES_x86_64= \
	sbin/cpu \
	sbin/mdbtest_range_query \
	sbin/mdbtest_addr_zero \
	sbin/mdb_bench \
	sbin/mdb_bench_old \
	sbin/ahci_bench \
	sbin/ata_rw28_test \
	sbin/apicdrift_bench \
	sbin/bench \
	sbin/bfscope \
	sbin/bomp_benchmark_cg \
	sbin/bomp_benchmark_ft \
	sbin/bomp_benchmark_is \
	sbin/bomp_sync \
	sbin/bomp_cpu_bound \
	sbin/bomp_cpu_bound_progress \
	sbin/bomp_sync_progress \
	sbin/bomp_test \
	sbin/boot_perfmon \
	sbin/bulkbench \
	sbin/datagatherer \
	sbin/ahcid \
	sbin/e1000n \
	sbin/NGD_mng \
	sbin/e10k \
	sbin/sfxge \
	sbin/e10k_queue \
	sbin/rtl8029 \
	sbin/netd \
	sbin/echoserver \
	sbin/elver \
	sbin/fbdemo \
	sbin/fish \
	sbin/fputest \
	sbin/hpet \
	sbin/lpc_kbd \
	sbin/lpc_timer \
	sbin/lrpc_bench \
	sbin/mem_affinity \
	sbin/mem_serv_dist \
	sbin/net-test \
	sbin/netthroughput \
	sbin/elb_app \
	sbin/elb_app_tcp \
	sbin/lo_queue \
	sbin/pci \
	sbin/acpi \
	sbin/kaluga \
	sbin/placement_bench \
	sbin/phases_bench \
	sbin/phases_scale_bench \
	sbin/phoenix_kmeans \
	$(BIN_RCCE_BT) \
	$(BIN_RCCE_LU) \
	sbin/rcce_pingpong \
	sbin/serial \
	sbin/shared_mem_clock_bench \
	sbin/sif \
	sbin/slideshow \
	sbin/spantest \
	sbin/testconcurrent \
	sbin/thc_v_flounder_empty \
	sbin/thcidctest \
	sbin/thcminitest \
	sbin/thctest \
	sbin/tsc_bench \
	sbin/tweedtest \
	sbin/udp_throughput \
	sbin/ump_latency \
	sbin/ump_exchange \
	sbin/ump_latency_cache \
	sbin/ump_throughput \
	sbin/ump_send \
	sbin/ump_receive \
	sbin/vbe \
	sbin/vmkitmon \
	sbin/webserver \
	sbin/tlstest \
	sbin/timer_test \
	sbin/net_openport_test \
	sbin/perfmontest \
	sbin/routing_setup \
	sbin/multihoptest \
	sbin/multihop_latency_bench \
	sbin/cryptotest \
	$(BIN_CONSENSUS) \
	sbin/bcached \
	sbin/testdesc \
	sbin/testdesc-child \
	sbin/angler \
	sbin/sshd \
	sbin/lshw \
	sbin/block_server \
	sbin/block_server_client \
	sbin/bs_user \
	sbin/bulk_shm \
	sbin/bulk_transfer_passthrough \
	sbin/bulkbench_micro_echo \
	sbin/bulkbench_micro_throughput \
	sbin/bulkbench_micro_rtt \


# the following are broken in the newidc system
MODULES_x86_64_broken= \
	sbin/barriers \
	sbin/driver_msd \
	sbin/ehci \
	sbin/ipi_bench \
	sbin/ring_barriers \
	sbin/usb_manager \
	sbin/ssf_bcast \
	sbin/lamport_bcast \

# x86-32-specific module to build by default
MODULES_x86_32=\
	sbin/cpu \
	sbin/lpc_kbd \
	sbin/serial \
	$(BIN_RCCE_BT) \
	$(BIN_RCCE_LU) \
	sbin/rcce_pingpong \
	sbin/bench \
	sbin/fbdemo \
	sbin/fish \
	sbin/fputest \
	sbin/pci \
	sbin/acpi \
	sbin/kaluga \
	sbin/slideshow \
	sbin/thc_v_flounder_empty \
	sbin/thcidctest \
	sbin/thcminitest \
	sbin/thctest \
	sbin/vbe \
	sbin/mem_serv_dist \
	sbin/routing_setup \
	sbin/multihoptest \
	sbin/multihop_latency_bench \
	sbin/angler \
	sbin/sshd \

# SCC-specific module to build by default
MODULES_scc=\
	sbin/cpu \
	$(BIN_RCCE_BT) \
	$(BIN_RCCE_LU) \
	sbin/rcce_pingpong \
	sbin/bench \
	sbin/eMAC \
	sbin/netd \
	sbin/NGD_mng \
	sbin/webserver \
	sbin/ipirc_test \
	sbin/thc_v_flounder_empty \
	sbin/thcidctest \
	sbin/thcminitest \
	sbin/thctest \
	sbin/mem_serv_dist \
	sbin/net-test \
	sbin/netthroughput \
	sbin/udp_throughput \

# ARM-specific modules to build by default
MODULES_armv5=\
	sbin/cpu \
	sbin/cpu.bin

# XScale-specific modules to build by default
MODULES_xscale=\
	sbin/cpu_ixp2800 \
	sbin/cpu_ixp2800.bin

# ARMv7-specific modules to build by default
# XXX: figure out armv7 default
MODULES_armv7=\
	sbin/cpu_omap44xx \
	sbin/usb_manager \
	sbin/usb_keyboard \
	sbin/kaluga \
	sbin/fish \
	sbin/examples/xmpl-spawn

# ARM11MP-specific modules to build by default
MODULES_arm11mp=\
	sbin/cpu \
	sbin/cpu.bin
	
# Intel Xeon Phi-specific modules
MODULES_k1om =\
	sbin/cpu \

# construct list of all modules to be built (arch-specific and common for each arch)
MODULES=$(foreach a,$(HAKE_ARCHS),$(foreach m,$(MODULES_$(a)),$(a)/$(m)) \
                                  $(foreach m,$(MODULES_COMMON),$(a)/$(m))) \
        $(MODULES_GENERIC)

all: $(MODULES) menu.lst
	@echo "You've just run the default ("all") target for Barrelfish"
	@echo "using Hake.  The following modules have been built:"
	@echo $(MODULES)
	@echo "If you want to change this target, edit the file called"
	@echo "'symbolic_targets.mk' in your build directory."
.PHONY: all

# XXX: this should be overridden in some local settings file?
INSTALL_PREFIX ?= /home/netos/tftpboot/$(USER)

# Only install a binary if it doesn't exist in INSTALL_PREFIX or the modification timestamp differs
install: $(MODULES)
	for m in ${MODULES}; do \
	  if [ ! -f ${INSTALL_PREFIX}/$$m ] || \
	      [ $$(stat -c%Y $$m) -ne $$(stat -c%Y ${INSTALL_PREFIX}/$$m) ]; then \
	    echo Installing $$m; \
	    mkdir -p ${INSTALL_PREFIX}/$$(dirname $$m); \
	    install -p $$m ${INSTALL_PREFIX}/$$m; \
	  fi; \
	done;
.PHONY : install

sim: simulate
.PHONY : sim

QEMU=unknown-arch-error
GDB=unknown-arch-error
CLEAN_HD=

DISK=hd.img
AHCI=-device ahci,id=ahci -device ide-drive,drive=disk,bus=ahci.0 -drive id=disk,file=$(DISK),if=none

ifeq ($(ARCH),x86_64)
        QEMU_CMD=qemu-system-x86_64 -no-kvm -smp 2 -m 1024 -net nic,model=ne2k_pci -net user $(AHCI) -fda $(SRCDIR)/tools/grub-qemu.img -tftp $(PWD) -nographic
	GDB=x86_64-pc-linux-gdb
	CLEAN_HD=qemu-img create $(DISK) 10M
else ifeq ($(ARCH),x86_32)
        QEMU_CMD=qemu-system-i386 -no-kvm -smp 2 -m 1024 -net nic,model=ne2k_pci -net user -fda $(SRCDIR)/tools/grub-qemu.img -tftp $(PWD) -nographic
	GDB=gdb
else ifeq ($(ARCH),scc)
        QEMU_CMD=qemu-system-i386 -no-kvm -smp 2 -m 1024 -cpu pentium -net nic,model=ne2k_pci -net user -fda $(SRCDIR)/tools/grub-qemu.img -tftp $(PWD) -nographic
	GDB=gdb
else ifeq ($(ARCH),armv5)
	ARM_QEMU_CMD=qemu-system-arm -no-kvm -kernel armv5/sbin/cpu.bin -nographic -no-reboot -m 256 -initrd armv5/romfs.cpio
	GDB=xterm -e arm-linux-gnueabi-gdb
simulate: $(MODULES) armv5/romfs.cpio
	$(ARM_QEMU_CMD)
.PHONY: simulate

armv5/tools/debug.arm.gdb: $(SRCDIR)/tools/debug.arm.gdb
	cp $< $@

debugsim: $(MODULES) armv5/romfs.cpio armv5/tools/debug.arm.gdb
	$(SRCDIR)/tools/debug.sh "$(ARM_QEMU_CMD) -initrd armv5/romfs.cpio" "$(GDB)" "-s $(ARCH)/sbin/cpu -x armv5/tools/debug.arm.gdb $(GDB_ARGS)"
.PHONY : debugsim
else ifeq ($(ARCH),arm11mp)
	QEMU_CMD=qemu-system-arm -no-kvm -cpu mpcore -M realview -kernel arm11mp/sbin/cpu.bin
	GDB=arm-linux-gnueabi-gdb
else ifeq ($(ARCH), k1om)
	# what is the emulation option for the xeon phi ?  
	QEMU=unknown-arch-error
	GDB=x86_64-k1om-barrelfish-gdb
endif


ifdef QEMU_CMD

simulate: $(MODULES)
	$(CLEAN_HD)
	$(QEMU_CMD)
.PHONY : simulate

debugsim: $(MODULES)
	$(CLEAN_HD)
	$(SRCDIR)/tools/debug.sh "$(QEMU_CMD)" "$(GDB)" "-x $(SRCDIR)/tools/debug.gdb $(GDB_ARGS)" "file:/dev/stdout"
.PHONY : debugsim

endif



$(ARCH)/menu.lst: $(SRCDIR)/hake/menu.lst.$(ARCH)
	cp $< $@

$(ARCH)/romfs.cpio: $(SRCDIR)/tools/arm-mkbootcpio.sh $(MODULES) $(ARCH)/menu.lst
	$(SRCDIR)/tools/arm-mkbootcpio.sh $(ARCH)/menu.lst $@

# Location of hardcoded size of romfs CPIO image
arm_romfs_cpio = "$(ARCH)/include/romfs_size.h"

# XXX: Horrid hack to hardcode size of romfs CPIO image into ARM kernel
# This works in several recursive make steps:
# 1. Create a dummy romfs_size.h header file
# 2. Compile everything
# 3. Create the romfs CPIO image
# 4. Determine its size and write to romfs_size.h
# 5. Re-compile kernel (but not the romfs) with correct size information
# 6. Install romfs to installation location
arm:
	$(MAKE)
	$(MAKE) $(ARCH)/romfs.cpio
	echo "//Autogenerated size of romfs.cpio because the bootloader cannot calculate it" > $(arm_romfs_cpio)
	echo "size_t romfs_cpio_archive_size = `ls -asl $(ARCH)/romfs.cpio | sed -e 's/ /\n/g' | head -6 | tail -1`;" >> $(arm_romfs_cpio)
	$(MAKE)
.PHONY: arm

# Builds a dummy romfs_size.h
$(ARCH)/include/romfs_size.h:
	mkdir -p $(shell dirname $@)
	echo "size_t romfs_cpio_archive_size = 0; //should not see this" > $@

arminstall:
	$(MAKE) arm
	$(MAKE) install
	install -p $(ARCH)/romfs.cpio ${INSTALL_PREFIX}/$(ARCH)/romfs.cpio
.PHONY: arminstall

# Copy the scc-specific menu.lst from the source directory to the build directory
menu.lst.scc: $(SRCDIR)/hake/menu.lst.scc
	cp $< $@

scc: all tools/bin/dite menu.lst.scc
	$(shell find scc/sbin -type f -print0 | xargs -0 strip -d)
	tools/bin/dite -32 -o bigimage.dat menu.lst.scc
	cp $(SRCDIR)/tools/scc/bootvector.dat .
	bin2obj -m $(SRCDIR)/tools/scc/bigimage.map -o barrelfish0.obj
	bin2obj -m $(SRCDIR)/tools/scc/bootvector.map -o barrelfish1.obj
	@echo Taking the barrelfish.obj files to SCC host
	scp barrelfish[01].obj user@tomme1.in.barrelfish.org:

# Source indexing targets
cscope.files:
	find $(abspath .) $(abspath $(SRCDIR)) -name '*.[ch]' -type f -print | sort | uniq > $@
.PHONY: cscope.files

cscope.out: cscope.files
	cscope -k -b -i$<

TAGS: cscope.files
	etags - < $< # for emacs
	cat $< | xargs ctags -o TAGS_VI # for vim

# force rebuild of the Makefile
rehake: ./hake/hake
	./hake/hake --source-dir $(SRCDIR)
.PHONY: rehake

clean::
	$(RM) -r tools $(HAKE_ARCHS)
.PHONY: clean

realclean:: clean
	$(RM) hake/*.o hake/*.hi hake/hake Hakefiles.hs cscope.*
.PHONY: realclean

# Documentation
DOCS= \
	./docs/TN-000-Overview.pdf \
	./docs/TN-001-Glossary.pdf \
	./docs/TN-002-Mackerel.pdf \
	./docs/TN-003-Hake.pdf \
	./docs/TN-004-VirtualMemory.pdf \
	./docs/TN-005-SCC.pdf \
	./docs/TN-006-Routing.pdf \
	./docs/TN-008-Tracing.pdf \
	./docs/TN-009-Notifications.pdf \
	./docs/TN-010-Spec.pdf \
	./docs/TN-011-IDC.pdf \
	./docs/TN-012-Services.pdf \
	./docs/TN-013-CapabilityManagement.pdf \
	./docs/TN-014-bulk-transfer.pdf \
	./docs/TN-015-DiskDriverArchitecture.pdf \
	./docs/TN-016-Serial.pdf \
	./docs/TN-017-ARM.pdf \
	./docs/TN-018-PracticalGuide.pdf \
	./docs/TN-019-DeviceDriver.pdf

docs doc: $(DOCS)
.PHONY: docs doc

clean::
	$(RM) $(DOCS)
.PHONY: clean

doxygen: Doxyfile
	doxygen $<
.PHONY: doxygen

# pretend to be CMake's CONFIGURE_FILE command
# TODO: clean this up
Doxyfile: $(SRCDIR)/doc/Doxyfile.cmake
	sed -r 's#@CMAKE_SOURCE_DIR@#$(SRCDIR)#g' $< > $@

# Scheduler simulator test cases
RUNTIME = 1000
TESTS = $(addsuffix .txt,$(basename $(wildcard $(SRCDIR)/tools/schedsim/*.cfg)))

schedsim-regen: $(TESTS)

$(TESTS): %.txt: %.cfg tools/bin/simulator
	tools/bin/simulator $< $(RUNTIME) > $@

schedsim-check: $(wildcard $(SRCDIR)/tools/schedsim/*.cfg)
	for f in $^; do tools/bin/simulator $$f $(RUNTIME) | diff -q - `dirname $$f`/`basename $$f .cfg`.txt || exit 1; done


######################################################################
#
# Intel Xeon Phi Builds
#
######################################################################

k1om:: $(MODULES_k1om)
        @echo "NYI: building the Xeon Phi Image"
.PHONY: k1om

#######################################################################
#
# Pandaboard builds
#
#######################################################################

PANDABOARD_MODULES=\
	armv7/sbin/cpu_omap44xx \
	armv7/sbin/init \
	armv7/sbin/mem_serv \
	armv7/sbin/monitor \
	armv7/sbin/ramfsd \
	armv7/sbin/spawnd \
	armv7/sbin/startd \
	armv7/sbin/skb \
	armv7/sbin/memtest \
	armv7/sbin/kaluga \
	armv7/sbin/fish \
	armv7/sbin/usb_manager \
	armv7/sbin/usb_keyboard \

menu.lst.pandaboard: $(SRCDIR)/hake/menu.lst.pandaboard
	cp $< $@

pandaboard_image: $(PANDABOARD_MODULES) \
		tools/bin/arm_molly \
		menu.lst.pandaboard
	# Translate each of the binary files we need
	$(SRCDIR)/tools/arm_molly/build_data_files.sh menu.lst.pandaboard molly_panda
	# Generate appropriate linker script
	cpp -P -DBASE_ADDR=0x82001000 $(SRCDIR)/tools/arm_molly/molly_ld_script.in \
		molly_panda/molly_ld_script
	# Build a C file to link into a single image for the 2nd-stage
	# bootloader
	tools/bin/arm_molly menu.lst.pandaboard panda_mbi.c
	# Compile the complete boot image into a single executable
	$(ARM_GCC) -std=c99 -g -fPIC -pie -Wl,-N -fno-builtin \
		-nostdlib -march=armv7-a -mapcs -fno-unwind-tables \
		-Tmolly_panda/molly_ld_script \
		-I$(SRCDIR)/include \
		-I$(SRCDIR)/include/arch/arm \
		-I./armv7/include \
		-I$(SRCDIR)/include/oldc \
		-I$(SRCDIR)/include/c \
		-imacros $(SRCDIR)/include/deputy/nodeputy.h \
		$(SRCDIR)/tools/arm_molly/molly_boot.S \
		$(SRCDIR)/tools/arm_molly/molly_init.c \
		$(SRCDIR)/tools/arm_molly/lib.c \
		./panda_mbi.c \
		$(SRCDIR)/lib/elf/elf32.c \
		./molly_panda/* \
		-o pandaboard_image
	@echo "OK - pandaboard boot image is built."
	@echo "If your boot environment is correctly set up, you can now:"
	@echo "$ usbboot ./pandaboard_image"

########################################################################
#
# GEM5 build
#
########################################################################

menu.lst.arm_gem5: $(SRCDIR)/hake/menu.lst.arm_gem5
	cp $< $@

menu.lst.arm_gem5_mc: $(SRCDIR)/hake/menu.lst.arm_gem5_mc
	cp $< $@

GEM5_MODULES=\
	armv7/sbin/cpu_arm_gem5 \
	armv7/sbin/init \
	armv7/sbin/mem_serv \
	armv7/sbin/monitor \
	armv7/sbin/ramfsd \
	armv7/sbin/spawnd \
	armv7/sbin/startd \
	armv7/sbin/skb \
	armv7/sbin/memtest


arm_gem5_image: $(GEM5_MODULES) \
		tools/bin/arm_molly \
		menu.lst.arm_gem5_mc
	# Translate each of the binary files we need
	$(SRCDIR)/tools/arm_molly/build_data_files.sh menu.lst.arm_gem5_mc molly_gem5
	# Generate appropriate linker script
	cpp -P -DBASE_ADDR=0x00100000 $(SRCDIR)/tools/arm_molly/molly_ld_script.in \
		molly_gem5/molly_ld_script
	# Build a C file to link into a single image for the 2nd-stage
	# bootloader
	tools/bin/arm_molly menu.lst.arm_gem5_mc arm_mbi.c
	# Compile the complete boot image into a single executable
	$(ARM_GCC) -std=c99 -g -fPIC -pie -Wl,-N -fno-builtin \
		-nostdlib -march=armv7-a -mapcs -fno-unwind-tables \
		-Tmolly_gem5/molly_ld_script \
		-I$(SRCDIR)/include \
		-I$(SRCDIR)/include/arch/arm \
		-I./armv7/include \
		-I$(SRCDIR)/include/oldc \
		-I$(SRCDIR)/include/c \
		-imacros $(SRCDIR)/include/deputy/nodeputy.h \
		$(SRCDIR)/tools/arm_molly/molly_boot.S \
		$(SRCDIR)/tools/arm_molly/molly_init.c \
		$(SRCDIR)/tools/arm_molly/lib.c \
		./arm_mbi.c \
		$(SRCDIR)/lib/elf/elf32.c \
		./molly_gem5/* \
		-o arm_gem5_image

# ARM GEM5 Simulation Targets
ARM_FLAGS=$(SRCDIR)/tools/arm_gem5/gem5script.py --caches --l2cache --n=2 --kernel=arm_gem5_image

arm_gem5: arm_gem5_image $(SRCDIR)/tools/arm_gem5/gem5script.py
	gem5.fast $(ARM_FLAGS)

arm_gem5_detailed: arm_gem5_image $(SRCDIR)/tools/arm_gem5/gem5script.py
	gem5.fast $(ARM_FLAGS) --cpu-type=arm_detailed

.PHONY: arm_gem5 arm_gem5_detailed

#######################################################################
#
# Pandaboard build for the armv7-M slave image (to be used in conjunction with a master image)
# (basically a normal pandaboard_image, but compiled for the cortex-m3)
#
#######################################################################

HETEROPANDA_SLAVE_MODULES=\
	armv7-m/sbin/cpu_omap44xx \
	armv7-m/sbin/init \
	armv7-m/sbin/mem_serv \
	armv7-m/sbin/monitor \
	armv7-m/sbin/ramfsd \
	armv7-m/sbin/spawnd \
	armv7-m/sbin/startd \
	armv7-m/sbin/skb \
	armv7-m/sbin/memtest

menu.lst.armv7-m: $(SRCDIR)/hake/menu.lst.armv7-m
	cp $< $@

heteropanda_slave: $(HETEROPANDA_SLAVE_MODULES) \
		tools/bin/arm_molly \
		menu.lst.armv7-m
	# Translate each of the binary files we need
	$(SRCDIR)/tools/arm_molly/build_data_files.sh menu.lst.armv7-m molly_panda_slave
	# Generate appropriate linker script
	cpp -P -DBASE_ADDR=0x0 $(SRCDIR)/tools/arm_molly/molly_ld_script.in \
		molly_panda_slave/molly_ld_script
	# Build a C file to link into a single image for the 2nd-stage
	# bootloader
	tools/bin/arm_molly menu.lst.armv7-m panda_mbi_slave.c
	# Compile the complete boot image into a single executable
	$(ARM_GCC) -std=c99 -g -fPIC -pie -Wl,-N -fno-builtin \
		-nostdlib -march=armv7-m -mcpu=cortex-m3 -mthumb -mapcs -fno-unwind-tables \
		-Tmolly_panda_slave/molly_ld_script \
		-I$(SRCDIR)/include \
		-I$(SRCDIR)/include/arch/arm \
		-I./armv7-m/include \
		-I$(SRCDIR)/include/oldc \
		-I$(SRCDIR)/include/c \
		-imacros $(SRCDIR)/include/deputy/nodeputy.h \
		$(SRCDIR)/tools/arm_molly/molly_boot.S \
		$(SRCDIR)/tools/arm_molly/molly_init.c \
		$(SRCDIR)/tools/arm_molly/lib.c \
		./panda_mbi_slave.c \
		$(SRCDIR)/lib/elf/elf32.c \
		./molly_panda_slave/* \
		-o heteropanda_slave
	@echo "OK - heteropanda slave image is built."
	@echo "you can now use this image to link into a regular pandaboard image"




#######################################################################
#
# Pandaboard build for the heteropanda_master:
# basically a regular pandaboard_image, except that it contains
# a heteropanda_slave image, and arm_molly is called with -DHETEROPANDA
#
#######################################################################

menu.lst.heteropanda_master: $(SRCDIR)/hake/menu.lst.heteropanda_master
	cp $< $@

heteropanda_master_image: $(PANDABOARD_MODULES) \
		tools/bin/arm_molly \
		menu.lst.heteropanda_master \
		heteropanda_slave \
		$(SRCDIR)/tools/arm_molly/molly_ld_script.in
	# Translate each of the binary files we need
	$(SRCDIR)/tools/arm_molly/build_data_files.sh menu.lst.heteropanda_master molly_panda
	# Generate appropriate linker script
	cpp -P -DBASE_ADDR=0x82001000 $(SRCDIR)/tools/arm_molly/molly_ld_script.in \
		molly_panda/molly_ld_script

	# HETEROPANDA: convert slave image into a form we can insert in our image
	$(ARM_OBJCOPY) -I binary -O elf32-littlearm -B arm --rename-section \
	    .data=.rodata_thumb,alloc,load,readonly,data,contents heteropanda_slave \
	    molly_panda/heteropanda_slave

	# Build a C file to link into a single image for the 2nd-stage
	# bootloader
	tools/bin/arm_molly menu.lst.heteropanda_master panda_mbi.c
	# Compile the complete boot image into a single executable
	$(ARM_GCC) -std=c99 -g -fPIC -pie -Wl,-N -fno-builtin \
		-nostdlib -march=armv7-a -mcpu=cortex-a9 -mapcs -fno-unwind-tables \
		-Tmolly_panda/molly_ld_script \
		-I$(SRCDIR)/include \
		-I$(SRCDIR)/include/arch/arm \
		-I./armv7/include \
		-I$(SRCDIR)/include/oldc \
		-I$(SRCDIR)/include/c \
		-imacros $(SRCDIR)/include/deputy/nodeputy.h \
		$(SRCDIR)/tools/arm_molly/molly_boot.S \
		$(SRCDIR)/tools/arm_molly/molly_init.c \
		$(SRCDIR)/tools/arm_molly/lib.c \
		./panda_mbi.c \
		$(SRCDIR)/lib/elf/elf32.c \
		./molly_panda/* \
		-DHETEROPANDA \
		-o heteropanda_master_image
	@echo "OK - heteropanda_master_image is built."
	@echo "If your boot environment is correctly set up, you can now:"
	@echo "$ usbboot ./heteropanda_master_image"
