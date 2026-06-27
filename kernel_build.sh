#CONFIGURATION
kernelsource=https://github.com/xxblebleblexx/moonbeam_gale_kernel.git # Must be edited
kernelname=$(basename "$kernelsource" .git) # No need to edit
branch_kernel=moonbeam # Must be edited
defconfig_path=arch/arm64/configs/gale_defconfig # Must be edited
defconfig=${defconfig_path##*/}
clang_path=/content/clang/bin # No need to edit
fast_path=/tmp # This where kernelsource saved
hooks=kprobes #only manual hook/kprobes hook, must be edited

cd $fast_path
git clone -b $branch_kernel --depth=1 $kernelsource;wait
cd $fast_path/$kernelname

#KSU DRIVER
curl -LSs "https://raw.githubusercontent.com/xxblebleblexx/MultiSU/refs/heads/legacy/kernel/setup.sh" | bash -s legacy

#KSU ACTIVATION
echo "CONFIG_KSU=y" >> $defconfig_path

if [ "$hooks" = "kprobes" ]; then
#KPROBES HOOK
echo "CONFIG_KPROBES=y" >> $defconfig_path
echo "CONFIG_KPROBE_EVENTS=y" >> $defconfig_path
echo "CONFIG_KSU_KPROBES_HOOK=y" >> $defconfig_path
fi

if [ "$hooks" = "manual" ]; then
#MANUAL HOOK
echo "CONFIG_KSU_MANUAL_HOOK=y" >> $defconfig_path
wget https://raw.githubusercontent.com/xxblebleblexx/manual_hook_fix/refs/heads/main/manualhook_1.6_fixed.patch;wait;patch -p1 < manualhook_1.6_fixed.patch
fi

export PATH=$clang_path:$PATH

if [ -f build.sh ]; then
chmod +x build.sh;sh build.sh;wait;cp /out/arch/arm64/boot/image.gz /content/ ;cp /out/arch/arm64/boot/image.gz-dtb /content/; cp /out/arch/arm64/boot/image /content/
else
make O=out ARCH=arm64 $defconfig && make -j$(nproc --all) CC=clang O=out ARCH=arm64 LLVM=1 LLVM_IAS=1 LD=ld.lld AS=llvm-as AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf STRIP=llvm-strip CROSS_COMPILE=aarch64-linux-gnu-
fi
