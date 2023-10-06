# cypher-vmtools

Steps:
1. Enter Guest OS
2. Change directory
3. Install the package 
sudo ./install.sh
4. Follow tips to complete installation

Notes:
If kernel does not contain virtio driver (version earlier than Linux 2.6.25), installation will fail.
In case system failed to start after reboot, go to the Summary page of the VM to uninstall vmTools and perform reboot again.
If the message "mount special device /dev/sr1 does not exist" pops up while CD/DVD drive is mounted, the directory may be incorrect. You can try mounting the drive onto another directory. (There should be a file named VMOptimizationToolsLinux.tar.gz in /mnt/cdrom after CD/DVD drive is mounted).
