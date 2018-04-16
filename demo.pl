use Net::FTP;
use Data::Dumper;

# conectarse a servidor por FTP
$ftp = Net::FTP->new("192.168.1.8", Debug => 1)
  or die "Cannot connect to some.host.name: $@";
$ftp->login("pepe", "kiki123")
  or die "Cannot login ", $ftp->message;
# listar directorio
$lista = $ftp->ls()
  or die "cannto list directory", $ftp->message;
print(Dumper($lista));
# cambiar de directorio
$ftp->cwd("Documentos/python/archivos")
  or die "Cannot change working directory ", $ftp->message;
# listar directorio
$lista = $ftp->ls()
  or die "cannto list directory", $ftp->message;
print(Dumper($lista));
# descargar archivo
$ftp->get("requirements.txt")
  or die "get failed ", $ftp->message;
# cerrar conexión
$ftp->quit;
