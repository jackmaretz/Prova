#!/usr/bin/perl -wT

use strict;
use CGI;
use CGI::Carp qw ( fatalsToBrowser );
use File::Basename;

$CGI::POST_MAX = 2048 * 2048;
my $caratteri_nomefile = "a-zA-Z0-9_.-";

my $upload_dir = "/home/mywebsite/htdocs/upload";  #il percorso e' assoluto

my $query = new CGI;
my $nomefile = $query->param("foto");  #legge il nome del file inserito

my ( $nome, $percorso, $estensione ) = fileparse ( $nomefile, '..*' );   #usa il modulo Basename per separare nome del file, percorso assoluto ed estensione
$nomefile = $nome . $estensione;               #concatena nome ed estensione: il risultato e' il nome del file

$nomefile =~ tr/ /_/;
$nomefile =~ s/[^$caratteri_nomefile]//g;           #sostituisce, nel nome del file, gli spazi con l'underscore



if ( $nomefile =~ /^([$caratteri_nomefile]+)$/ )
{
$nomefile = $1;
}
else
{
die "Il nome del file contiene caratteri non validi";
}                                                      #confronta il nome del file con i caratteri permessi indicati alla riga 9


my $upload_filehandle = $query->upload("foto");      #preleva il file dal form




open ( UPLOADFILE, ">$upload_dir/$nomefile" ) or die "$!";
binmode UPLOADFILE;

while ( <$upload_filehandle> )
{
print UPLOADFILE;
}

close UPLOADFILE;                  #salva il file con il nome ora "pulito"

print $query->header ( );
print <<END_HTML;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" >
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Pro Loco di Zero Branco</title>
<meta name="keywords" content="Pro Loco Zero Branco, Eventi Zero Branco, Feste Zero Branco" />
<meta name="description" content="Sito della Pro Loco; contiene informazioni sulle sagre e sugli eventi cittadini." />
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />	
<meta name="viewport" content="height=device-height, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />	
<meta name="author" content="Giulia Zanibellato, Giacomo Maretto, Patrizio Stella" />
<meta name="rating" content="general" />

<link rel="stylesheet" type="text/css" href="css/custom.css" />
<link rel="stylesheet" type="text/css" href="css/mobile.css" />
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Pinyon+Script" />
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Quattrocento+Sans" />

<!--[if lt IE 7]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE7.js"></script>
<![endif]-->
<!--[if lt IE 8]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE8.js"></script>
<![endif]-->
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js"></script>
<![endif]-->

</head>

<body>


<div class="header">
  <h1>Pro Loco di Zero Branco</h1>
</div>

<div class="horizontalmenu">
  <ul>
    <li>Home</li>
    <li><a href="eventi.xml">Eventi</a></li>
    <li><a href="galleria.html">Galleria</a></li>
    <li><a href="curiosita.xml">Curiosit&#224;</a></li>
    <li><a href="contatti.html">Contatti</a></li>
    <li><a href="opinioni.xml">Opinioni</a></li>
  </ul>
</div>

<div class="ringraziamento">
  <h2>Grazie!</h2>
<p>L'immagine e' stata caricata correttamente. Ti ringraziamo per il tuo contributo!</p>
<p>Sei tornato alla pagina principale</p>
<p>Per tornare a visualizzare le foto, <a href="galleria.html">clicca qui</a>.</p>
</div>


<div class="corpo">
  <h2>La Pro Loco</h2>
  <p>La Pro Loco di Zero Branco nasce nel 1967 e, al giorno d'oggi,
  conta oltre 300 soci. Varie sono le attivit&#224; che le hanno consentito di 
  avere una certa rilevanza nel tessuto sociale del paese: la realizzazione di
  una pista di pattinaggio presso l'oratorio, dei campi da tennis di Villa Guidini,
  di un forno per la cottura delle ceramiche della Scuola Media Europa, dell'
  impianto di illuminazione del primo campo sportivo. Ha inoltre acquistato 
  un'intera Enciclopedia Treccani, dei lettori DVD, macchine fotocopiatrici 
  e macchine fotografiche sia per la biblioteca che per le scuole.</p>
  
  <p>La Pro Loco collabora attivamente con il Comune di Zero Branco ed 
  altre Associazioni quali Colmelli Zairo, Coro Palio, Anziani, Avis, 
  Associazioni d'Arma, allestendo manifestazioni gastronomiche per 
  promuovere il territorio ed i prodotti tipici, cos&#236; come manifestazioni 
  culturali per promuovere iniziative di vario tipo.</p>
  
  <img src="images/ragazziproloco.jpg" alt="Una foto del 1970, con
  alcuni degli attuali componenti della Pro Loco da giovani" />

  </div>

<div class="footer">
  <p>Pro Loco di Zero Branco</p>
  <p>Telefono: <a href="tel:+39042297613">0422 97613</a></p>
  <p>Email: <a href="mailto:segreteria@prolocozerobranco.it">segreteria@prolocozerobranco.it</a></p>
</div>  

</body>
</html>
END_HTML







