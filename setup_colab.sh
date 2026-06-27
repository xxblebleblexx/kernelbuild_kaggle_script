#apt setup
alias apt='apt-get'
apt update -y
apt install -y \
git \
llvm \
lld \
build-essential \
libncurses-dev \
libssl-dev \
bc \
flex \
bison \
rsync \
kmod \
cpio \
python3 \
gcc-aarch64-linux-gnu \
binutils-aarch64-linux-gnu \
patch \
ccache
#clang setup
cd kernelbuild_kaggle_script
git clone -b clang-12 --depth=1 https://github.com/xxblebleblexx/zyc-clang.git clang;wait
export PATH=/kaggle/working/kernelbuild_kaggle_script/clang/bin:$PATH; clang --version
