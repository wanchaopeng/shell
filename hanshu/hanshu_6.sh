#!/bin/bash
#0.更改yum源
mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup &&\
wget -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/CentOS-Base.repo

#1.关闭SELinux
sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config
grep SELINUX=disabled  /etc/selinux/config
setenforce 0
getenforce 0

#2.关闭iptables

# centos 6
#/etc/init.d/iptables stop 
#/etc/init.d/iptables stop
#chkconfig iptables off

#centos 7
systemctl stop iptables
systemctl stop iptables
systemctl disable iptables

#3.精简开机自启服务

#centos 6
chkconfig | awk '{print "chkconfig",$1,"off"}'|bash
chkconfig |egrep "crond|sshd|network|rsyslog|sysstat"|awk '{print "chkconfig",$1,"on"}'|bash
export LANG=en
chkconfig --list |grep 3:on
#centos 7

#4.提权shunmai可以sudo
user add shunmai
echo 123456|passwd --stdin shunmai
cp /etc/sudoers /etc/sudoers.ori
echo "oldboy ALL=(ALL) NOPASSWD: ALL " >> /etc/sudoers
tail -1 /etc/sudoers
visudo -c

#中文字符集
cp /etc/sysconfig/i18n  /etc/sysconfig/i18n.ori
echo 'LANG="zh_CN.UTF-8"' >/etc/sysconfig/i18n
source /etc/syscofig/i18n
echo $LANGG

#时间同步
echo '#time sync by oldboy at 2019-8-5' >> /var/spool/root
echo '*/5 * * * * /usr/sbin/ntpdate time.nist.gov >/dev/null 2>&1' >>/var/spool/cron/root
crontab -l

#命令行安全
echo 'expr TMOUT=600' >>/etc/profile
echo 'expr HISTSIZE=5' >>/etc/profile
echo 'expr HISTFILESIZE=5' >>/etc/profile
tail -3 /etc/profile
. /etc/profile

#加大文件描述
echo '*             -           nofile         65535' >>/etc/security/limits.conf
tail -1 /etc/security/limits.conf

#内核优化
cat >>/etc/sysctl.conf<<EOF
net.ipv4.tcp_fin_timeout = 2 
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_tw_recycle = 1
net.ipv4.tcp_syncookies = 1 
net.ipv4.tcp_keepalive_time = 600
net.ipv4.ip_local_port_range = 4000 65000
net.ipv4.tcp_max_syn_backets = 36000
net.ipv4.route.gc_timeout = 100
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_synack_retries = 1
net.core.somaxconn = 16384
net.core.netdev_max_backlog = 16384
net.ipv4.tcp_max_orphans = 16384

# iptables 优化

#net.nf_conntrack_max = 25000000
#net.netfilter.nf_conntrack_max = 25000000
#net.netfilter.nf_conntrack_tcp_timeout_established = 180
#net.netfilter.nf_conntrack_tcp_timeout_time_wait = 120
#net.netfilter.nf_conntrack_tcp_timeout_close_wait = 60
#net.netfilter.nf_conntrack_tcp_timeout_fin_wait = 120
EOF

sysctl -p
yum update -y 
yum install lrzsz nmap tree dos2unix nc -y
