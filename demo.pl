use Net::FTP;
use Data::Dumper;

$ftp = Net::FTP->new("192.168.1.8", Debug => 0)
  or die "Cannot connect to some.host.name: $@";

$ftp->login("pepe",'kiki123')
  or die "Cannot login ", $ftp->message;

#$ftp->cwd("/home/pepe/Documentos/python")
  #or die "Cannot change working directory ", $ftp->message;
#$ftp->get("that.file")
  #or die "get failed ", $ftp->message;
$lista = $ftp->ls()
  or die "cannto list directory", $ftp->message;
print(Dumper($lista));

$ftp->cwd("Documentos/python/archivos")
  or die "Cannot change working directory ", $ftp->message;

$lista = $ftp->ls()
  or die "cannto list directory", $ftp->message;
print(Dumper($lista));

$ftp->get("requirements.txt")
  or die "get failed ", $ftp->message;

$ftp->quit;
