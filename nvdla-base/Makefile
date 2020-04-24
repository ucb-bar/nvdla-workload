ifneq ($(KERNELRELEASE),)

obj-m += opendla.ko

else

NVDLA_SW_SRC=$(PWD)/nvdla-sw

opendla.ko:
	make -C $(NVDLA_SW_SRC)/kmd KDIR=$(LINUXSRC) ARCH=riscv CROSS_COMPILE=riscv64-unknown-linux-gnu-
	mv $(NVDLA_SW_SRC)/kmd/port/linux/opendla.ko $@

clean:
	make -C $(NVDLA_SW_SRC)/kmd clean
	rm -rf opendla.ko

endif
