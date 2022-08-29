#!/user/bin/perl
# 2022-08-28 
# Attempts to download still image from 
# Visualint

my $epoch = `date +%s`;
my $snap = `wget -a wgetlog 192.168.2.252/snapshit.jpg`;


