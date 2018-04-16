use strict;
use warnings;
use Net::FTP;
use Data::Dumper;

my ($ftp, $host, $user, $pass, $dir, $fpath);
$host = "192.168.1.8";
$user = "pepe";
$pass = "kiki123";
$dir = "";
# conectarse a servidor por FTP
$ftp = Net::FTP->new($host, Debug => 0)
  or die "Cannot connect to some.host.name: $@";
$ftp->login($user, $pass)
  or die "Cannot login ", $ftp->message;
# listar directorio
my $lista = 0;
$lista = $ftp->ls()
  or die "cannto list directory", $ftp->message;
#print(Dumper($lista));
# cambiar de directorio
$ftp->cwd("Documentos/python/archivos")
  or die "Cannot change working directory ", $ftp->message;
# listar directorio
$lista = $ftp->ls()
  or die "cannto list directory", $ftp->message;
#print(Dumper($lista));
# descargar archivo
$ftp->get("requirements.txt")
  or die "get failed ", $ftp->message;
# cambiar de directorio
$ftp->cwd("static")
  or die "Cannot change working directory ", $ftp->message;
# subir archivo
$ftp->binary();
$ftp->put("/home/pepe/Imágenes/ftpput/luxor.jpg", "luxor.jpg")
  or die "put failed ", $ftp->message;
# cerrar conexión
$ftp->quit;
