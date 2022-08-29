#!/usr/bin/perl 


my $filename = "/tmp/snapshot.jpg";
#my $filename = "/root/patrick";
my $state = `netstat -tupan`;
chomp $state;
my $t = `date +%H`;
chomp $t;

#if ($state =~ /96\.230\.7\.11:2222/ ) {
if ($state =~ /198\.211\.110\.180:6322/ ) {
   print "rsync in process - EXIT!!... \n";
    }

if (-e $filename) { 
  print "snapshot exists, deleting\n";
  $m = `rm $filename`;
  $g = `wget -a /home/divellc/wgsnap.log -O /tmp/snapshot.jpg http://192.168.2.252/snapshot.jpg`;
  #$g = `wget https://cisco.com -o /tmp/snapshot`;
  sleep 2;
 } else {
  print "$filename doesn't exist\n"; 
  $g = `wget -a /home/divellc/wgsnap.log -O /tmp/snapshot.jpg http://192.168.2.252/snapshot.jpg`;
  #$g = `wget https://cisco.com -o /tmp/ciscoindex.html`;
 }

if ($state =~ /198\.211\.110\.180:6322/) {
   print "rsync in process... exiting\n"
 } else {
   print "okay to rsync. RSYNCING....\n";
   # rsync -avz -e 'ssh -p 6322 -i .ssh/rsa_divellc' *jpg divellc@198.211.110.180:/tmp
   `/usr/bin/rsync --remove-source-files -zcrptgo /tmp/*jpg -e'ssh -p 6322 -i/home/divellc/.ssh/rsa_divellc' divellc\@198.211.110.180:/home/divellc/newpic/`;
}

# ssh -i/home/padric/id_CAMP -p2222 campcam@96.230.7.11
# chmod 600 id_CAMP
