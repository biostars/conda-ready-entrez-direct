set -uex

# Detect platform.
osname=`uname -s`
cputype=`uname -m`

case "$osname-$cputype" in
  Linux-x86_64 )           plt=Linux ;;
  Darwin-x86_64 )          plt=Darwin ;;
  Darwin-*arm* )           plt=Silicon ;;
  Linux-*arm* )            plt=ARM ;;
esac

# Unpack platform specific binary
gunzip -c xtract."$platform".gz > xtract."$platform"
gunzip -c rchive."$platform".gz > rchive."$platform"
gunzip -c transmute."$platform".gz > transmute."$platform"

# Set executable flag.
chmod +x xtract."$platform" rchive."$platform" transmute."$platform"
