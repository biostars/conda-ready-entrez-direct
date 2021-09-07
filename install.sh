set -uex

# Detect platform.
osname=`uname -s`
cputype=`uname -m`

case "$osname-$cputype" in
  Linux-x86_64 )           platform=Linux ;;
  Darwin-x86_64 )          platform=Darwin ;;
  CYGWIN_NT-* | MINGW*-* ) platform=CYGWIN_NT ;;
  Linux-*arm* )            platform=ARM ;;
  * )                      platform=UNSUPPORTED ;;
esac

# Unpack platform specific binary
gunzip -c xtract."$platform".gz > xtract
gunzip -c rchive."$platform".gz > rchive
gunzip -c transmute."$platform".gz > transmute

# Set executable flag.
chmod +x xtract rchive transmute
