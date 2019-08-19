#!/bin/bash
export PATH=$PATH:/bin:/sbin:/usr/sbin
  if [ "$UID" != "0" ]
    then
      echo "please run this script by root."
      exit 1 
  fi

SERVICE=`which service`
CHKCONFIG=`which chkconfig`

function mod_yum () {
  if [ -e /etc/yum.repo.d/CentOS-Base.repo ]
    then
      mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup &&\
      wget -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/CentOS-Base.repo
  fi
}

function close_selinux () {
sed -i 's#SELINUX=enforcing#SELINUX=disabled#g' /etc/selinux/config
#grep SELINUX=disabled  /etc/selinux/config
setenforce 0
#getenforce 0
}

function close_iptable () {
systemctl stop iptables
systemctl stop iptables
systemctl disable iptables
}

function least_service () {
chkconfig | awk '{print "chkconfig",$1,"off"}'|bash
chkconfig |egrep "crond|sshd|network|rsyslog|sysstat"|awk '{print "chkconfig",$1,"on"}'|bash
#export LANG=en
#chkconfig --list |grep 3:on
}

function adduser () {
if [ `grep -w shunmai /etc/passwd|wc -l ` -lt 1 ]
  then
    user add shunmai
    echo 123456|passwd --stdin shunmai
    cp /etc/sudoers /etc/sudoers.ori
    echo "oldboy ALL=(ALL) NOPASSWD: ALL " >> /etc/sudoers
    tail -1 /etc/sudoers
    visudo -c &>/dev/null
fi
}

function charset () {
cp /etc/sysconfig/i18n  /etc/sysconfig/i18n.ori
echo 'LANG="zh_CN.UTF-8"' >/etc/sysconfig/i18n
source /etc/syscofig/i18n
#echo $LANGG
}

function time_sync () {
cron=/var/spool/cron/root
if [  `grep -w "ntpdate" $cron|wc -l` -lt 1 ]
  then
    echo '#time sync by oldboy at 2019-8-5' >>$cron
    echo '*/5 * * * * /usr/sbin/ntpdate time.nist.gov >/dev/null 2>&1' >>/var/spool/cron/root
    crontab -l
fi
}

function com_line_set () {
if [ `egrep "TMOUT|HISTSIZE|ISTFILESIZE" /etc/profile|wc -l` -lt 3 ]
  then 
    echo 'expr TMOUT=600' >>/etc/profile
    echo 'expr HISTSIZE=5' >>/etc/profile
    echo 'expr HISTFILESIZE=5' >>/etc/profile
    source /etc/profile
fi
}

function open_file_set () {
if [ `grep 65535 /etc/security/limits.conf|wc -l` -lt 1 ]
  then
    echo '*             -           nofile         65535' >>/etc/security/limits.conf
    tail -1 /etc/security/limits.conf
fi
}

function set_kernel () {
if [ `grep kernel_flag /etc/sysctl.conf|wc -l` -lt 1 ]
  then
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
fi
}

function init_ssh () {
  if [ `rpm -qa lrzsz nmap tree dos2unix nc | wc -l` -le 3 ]
    then
      yum install lrzsz nmap tree dos2unix nc -y
  fi
}

main () {
mod_yum
close_selinux
close_iptable
least_service
adduser
charset
time_sync
com_line_set
open_file_set
set_kernel
init_ssh
}
main
