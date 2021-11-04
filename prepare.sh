set -ue

#
# Usage: bash prepare 15.6.20210906
#
VERSION=$1

arr=(${VERSION//./ })

MAJOR=${arr[0]}
MINOR=${arr[1]}
DATE=${arr[2]}

# Name of the remote (and local) file
FNAME=edirect-$VERSION.tar.gz


# Root URL
URL=https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect

# Remote file
DIST=$URL/versions/$VERSION/$FNAME

echo **** Preparing: $MAJOR $MINOR $DATE

# Remove build directory if it exists
rm -f build

# The build directory
mkdir -p build

cd build

# Get the archive from the remove site
wget -nc $DIST

# Unpack the file
tar xzvf $FNAME

# Fetch the binaries
cat ../platforms.txt | xargs -I {} -n 1 wget -nc https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/xtract.{}.gz
cat ../platforms.txt  | xargs -I {} -n 1 wget -nc https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/rchive.{}.gz
cat ../platforms.txt | xargs -I {} -n 1 wget -nc https://ftp.ncbi.nlm.nih.gov/entrez/entrezdirect/transmute.{}.gz

# Move the files into the archive
mv -f xtract.* rchive.* transmute.* edirect/

# Copy the new install script to edirect.
cp -f ../install.sh edirect

# Repackage the archive
tar czvf $FNAME edirect/*

# Back to root dir
cd ..

# Move the package to the distribution folder
mv build/$FNAME dist/

# Create the SHA sum
cat dist/$FNAME | shasum -a 256 > dist/$FNAME.shasum

# Add the distribution to the archive
git add -f dist/$FNAME
git add -f dist/$FNAME.shasum

