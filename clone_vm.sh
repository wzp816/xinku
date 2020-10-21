#!/urs/bin/env bash
IMG_DIR="/var/lib/libvirt/images/"
XML_DIR="/etc/libvirt/qemu/"
cd ${IMG_DIR}
qemu-img create -f qcow2 -b ${IMG_DIR}.centos.qcow2 centos1.img 5G
cp ${XML_DIR}.centos.xml ${XML_DIR}centos1.xml
sed -i  '/uuid/d' ${XML_DIR}centos1.xml
sed -i 's/centos/centos1/' ${XML_DIR}centos1.xml
sed -i 's/centos1.qcow2/centos1.img/' ${XML_DIR}centos1.xml
virsh define ${XML_DIR}centos1.xml
virsh start centos1
 


