#!/usr/bin/env bash
## add this at the end of the vagrantfile 
##  config.vm.provision :shell, path: "bootstrap.sh"

yum update
yum --quiet -y install centos-release-scl
yum --quiet -y install gcc openssl-devel bzip2-devel libffi libffi-devel xz-devel
yum --quiet -y install wget
wget -P /usr/local/bin/ https://www.python.org/ftp/python/3.7.0/Python-3.7.0.tgz
tar xzf /usr/local/bin/Python-3.7.0.tgz --directory /usr/local/bin/
sh /usr/local/bin/Python-3.7.0/configure --enable-optimizations
make altinstall
export PATH=$PATH:/usr/local/bin

# For installing mono
rpm --import "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF"
curl https://download.mono-project.com/repo/centos7-stable.repo | tee /etc/yum.repos.d/mono-centos7-stable.repo
yum --quiet -y install mono-devel

#For installing dotnet 
rpm -Uvh https://packages.microsoft.com/config/rhel/7/packages-microsoft-prod.rpm
yum --quiet -y install dotnet-sdk-2.2
yum --quiet -y install dotnet-sdk-2.1
##yum install libunwind.x86_64


yum --quiet -y install dos2unix

ln -s /usr/lib64/libgit2.so /usr/lib64/libgit2-15e1193.so
yum --quiet -y install libgit2-devel
yum --quiet -y install git
