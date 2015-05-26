use CGI;
use CGI::Session;
use CGI::Carp qw(warningsToBrowser fatalsToBrowser); 
use XML::LibXML;

$filename = "../public-html/utenti.xml"; 		#file su cui sarà effettuato il parsing
$parser = XML::LibXML->new();				# parser
$xml_doc = $parser->parse_file($filename); 	# parsing

$root = $xml_doc->getDocumentElement();		# nodo radice

$buffer = "";
read(STDIN, $buffer,$ENV{'CONTENT_LENGTH'});
@pairs = split(/&/, $buffer);					# divisione dei parametri, creazione array
%input;
foreach $pair (@pairs) { 
	($name, $value) = split(/=/, $pair); 
	$value =~ tr/+/ /; 															
	$value =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C", hex($1))/eg; 
	$value =~ s/@/"\/@"/eg;
	$name =~ tr/+/ /; 
	$name =~ s/%([a-fA-F0-9][a-fA-F0-9])/pack("C",hex($1))/eg; 
	$input{$name} = $value;						# inserisce il valore nell'array associativo
}

$exists = $root->exists("user[nome=\"$input{\"nome\"}\" and password=\"$input{\"password\"}\"]");

if ($exists) {
	$session = CGI::Session->new();
	$session->param("nome", $input{nome});
	print $session->header(-location => "logindash.cgi");     #DA CREARE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
}
else {
	$cgi = new CGI();
	print $cgi->redirect("login.cgi");                   #DA CREAREEEEEEEEEEEEEEEEEEEEEEE!
