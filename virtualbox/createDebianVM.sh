#!/bin/bash
set +x

MACHINENAME=$1
VMFOLDER=/Users/elmos/vmware/VB/linux

# Download debian.iso
if [ ! -f ./debian.iso ]; then
    curl -L -o debian.iso https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-9.9.0-amd64-netinst.iso
fi

if [ ! -f ./debian.iso ]; then
    echo "Erro file still not found"
    exit 10
fi

#Create VM
VBoxManage createvm --name $MACHINENAME --ostype "Debian_64" --register --basefolder $VMFOLDER
#Set memory and network
VBoxManage modifyvm $MACHINENAME --ioapic on
VBoxManage modifyvm $MACHINENAME --memory 1024 --vram 128
VBoxManage modifyvm $MACHINENAME --nic1 nat
#Create Disk and connect Debian Iso
VBoxManage createhd --filename $VMFOLDER/$MACHINENAME/$MACHINENAME_DISK.vdi --size 80000 --format VDI
VBoxManage storagectl $MACHINENAME --name "SATA Controller" --add sata --controller IntelAhci
VBoxManage storageattach $MACHINENAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium  $VMFOLDER/$MACHINENAME/$MACHINENAME_DISK.vdi
VBoxManage storagectl $MACHINENAME --name "IDE Controller" --add ide --controller PIIX4
VBoxManage storageattach $MACHINENAME --storagectl "IDE Controller" --port 1 --device 0 --type dvddrive --medium `pwd`/debian.iso
VBoxManage modifyvm $MACHINENAME --boot1 dvd --boot2 disk --boot3 none --boot4 none

#Enable RDP
VBoxManage modifyvm $MACHINENAME --vrde on
VBoxManage modifyvm $MACHINENAME --vrdemulticon on --vrdeport 10001

#Other
VBoxManage modifyvm $MACHINENAME --audio none
VBoxManage modifyvm $MACHINENAME --usb off
VBoxManage modifyvm $MACHINENAME --usbehci off
VBoxManage modifyvm $MACHINENAME --usbxhci off

#VBoxManage modifyvm $MACHINENAME --nic1 bridged --bridgeadapter1 wlan0 --nic2 nat

#Start the VM
#VBoxHeadless --startvm $MACHINENAME 
VBoxManage unattended install $MACHINENAME --user=elmos --password=P@SSWORD --country=FR --time-zone=MET --hostname=$MACHINENAME.exemple.com --iso=`pwd`/debian.iso --start-vm=gui --locale='fr_FR' --language='fr_FR' 
