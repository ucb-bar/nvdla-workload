ifneq ($(KERNELRELEASE),)

obj-m += opendla.ko

else

opendla.ko:
	make -C sw/kmd KDIR=$(LINUXSRC) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
	mv sw/kmd/port/linux/opendla.ko $@

clean:
	make -C sw/kmd clean
	rm -rf opendla.ko

endif
