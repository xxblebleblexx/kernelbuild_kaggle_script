#apt setup
apt update -y
apt upgrade -y
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
wget https://github.com/greenforce-project/greenforce_clang/releases/download/20260523/gf-clang-23.0.0-20260523.tar.gz;wait; mkdir -p clang; mv gf-clang-23.0.0-20260523.tar.gz clang.tar.gz;mv clang.tar.gz clang;cd clang;tar -xvzf clang.tar.gz;wait
export PATH="/content/clang/bin:$PATH"
clang --version
