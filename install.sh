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
gunzip -c xtract.$plt.gz > xtract.$plt
gunzip -c rchive.$plt.gz > rchive.$plt
gunzip -c transmute.$plt.gz > transmute.$plt

# Set executable flag.
chmod +x xtract.$plt rchive.$plt transmute.$plt
