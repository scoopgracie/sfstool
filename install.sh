termux-setup-storage
pkg install python
git clone https://gist.github.com/scoopgracie/1d0680979852e8f6715e72e47bb70e44 sfstool_install
mv sfstool_install/sfstool.sh $PREFIX/bin/sfstool
chmod +x $PREFIX/bin/sfstool
rm -rf sfstool_install
echo "sfstool is installed (please set up ~/.sfs)"
echo "sfstool comes with ABSOLUTELY NO WARRANTY, not even the implied warranties of"
echo "merchantibility, fitness for a particular purpose, and noninfringement. The"
echo "authors accept no liability or responsibility for any claim, damages, or other"
echo "liability, arising from, out of, or in connection with sfstool, the use of"
echo "sfstool, or other dealings in sfstool."
