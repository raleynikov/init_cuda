yum install kernel-devel kernel-headers -y
7za e driver/NVIDIA-Linux-x86_64-384.90.zip
if [! -e 1.ok]
	echo 'blacklist nouveau' >> /etc/modprobe.d/blacklist.conf
	dracut /boot/initramfs-$(uname -r).img $(uname -r) --force
	touch 1.ok
	reboot
fi
bash driver/NVIDIA-Linux-x86_64-384.90.run
