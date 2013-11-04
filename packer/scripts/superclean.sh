# Make sure udev doesn't block our network
if grep -q -i "release 6" /etc/redhat-release ; then
    rm /etc/udev/rules.d/70-persistent-net.rules
    mkdir /etc/udev/rules.d/70-persistent-net.rules
    rm /lib/udev/rules.d/75-persistent-net-generator.rules
fi
rm -rf /dev/.udev/
sed -i "/^HWADDR/d" /etc/sysconfig/network-scripts/ifcfg-eth0

package-cleanup --oldkernel --count 1 --keepdevel

cd /tmp
curl -L http://sourceforge.net/projects/bleachbit/files/bleachbit-0.9.6.tar.bz2 | tar xj && cd /tmp/bleachbit-0.9.6
python bleachbit.py -c system.cache system.desktop_entry \
system.localizations system.recent_documents \
system.rotated_logs system.tmp system.trash \
yum.clean_all yum.vacuum > /tmp/bleachbit.log
tail -3 /tmp/bleachbit.log

# Just to be certain...
yum -y clean all

rm -rf /tmp/*
