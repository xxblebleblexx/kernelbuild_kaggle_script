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
wget https://github.com/greenforce-project/greenforce_clang/releases/download/20260523/gf-clang-23.0.0-20260523.tar.gz;wait; mkdir -p clang; mv gf-clang-23.0.0-20260523.tar.gz clang.tar.gz;mv clang.tar.gz clang;cd clang;tar -xvzf clang.tar.gz;wait
export PATH=/kaggle/working/kernelbuild_kaggle_script/clang/bin:$PATH; clang --version
