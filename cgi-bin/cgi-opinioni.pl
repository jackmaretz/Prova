#!usr/bin/perl  

use CGI;
use CGI:Carp qw(fatalsToBrowsers);
use XML:LibXML;
my $page = new CGI;

if($page -> param('submit') ne 0 && $page -> param('submit') eq 'Invia') 
  {controlloForm();               #controlla i dati inseriti nel form 
  }
else {
  stampaPagina;                   #nel caso di errori, ristampa la form con la lista degli errori commessi
}

sub controlloForm {
  my $nomeOpinione = $page ->param('nomeOpinione');
  my $cognomeOpinione = $page ->param('cognomeOpinione');
  my $testoOpinione = $page ->param('testoOpinione');
  
  my $listaerrori = '<p>Sono stati commessi degli errori nella compilazione della form:</p><ul>';
  if (length $nomeOpinione == 0) {
    $listaerrori. = '<li>Non è stato inserito il nome: inserire il proprio nome (lunghezza minima di due caratteri)</li>';
  }
  elsif (length $nomeOpinione <2) {
    $listaerrori. = '<li>Il nome è troppo corto: inserire un nome più lungo</li>';
  }
  elsif (length $nomeOpinione > 30) {
    $listaerrori. = '<li>Il nome è troppo lungo: inserire un nome più corto</li>';
  }
  elsif ($nomeOpinione   #inserire pattern per il quale sono concessi solo lettere o spazi 
  ) {
    $listaerrori. = '<li>Sono stati inseriti caratteri non concessi: usare soltanto le lettere (ed eventualmente gli spazi)</li>';
  }
  
   if (length $cognomeOpinione == 0) {
    $listaerrori. = '<li>Non è stato inserito il cognome: inserire il proprio cognome (lunghezza minima di due caratteri)</li>';
  }
  elsif (length $cognomeOpinione <2) {
    $listaerrori. = '<li>Il cognome è troppo corto: inserire un cognome più lungo</li>';
  }
  elsif (length $cognomeOpinione > 40) {
    $listaerrori. = '<li>Il cognome è troppo lungo: inserire un cognome più corto</li>';
  }
  elsif ($cognomeOpinione   #inserire pattern per il quale sono concessi solo lettere o spazi 
  ) {
    $listaerrori. = '<li>Sono stati inseriti caratteri non concessi: usare soltanto le lettere (ed eventualmente gli spazi e gli apostrofi)</li>';
  }
  
  if (length $testoOpinione == 0) {
      $listaerrori. = '<li>Non è stato inserito alcun testo: inserire una propria opinione</li>';
  }

if(length $listaerrori == 74) {
    my $fileOpinioni = "../public_html/opinioni.xml";
    my $parser = XML::LibXML -> new();
    my $docOpinioni = $parser->parse_file($fileOpinioni) || die("Operazione di parsificazione fallita");
    my $radiceOpinioni = $docOpinioni->getDocumentElement || die("Operazione di accesso alla radice fallita");
    my $frammentoOpinioni ="<opinione><nome>$nomeOpinione</nome><cognome>$cognomeOpinione</cognome><recensione>$testoOpinione</recensione></opinione>";
    my $nodoOpinioni = $parser->parse_balanced_chunk($frammentoOpinioni)|| die("Il frammento non è ben formato"); 
    $radiceOpinioni->appendChild($nodoOpinioni); 
    open(FILE,">$fileOpinioni")||die("Errore nell'apertura del file XML");
    print FILE $docOpinioni->toString(1);
    close(FILE);
    stampaConferma($nomeOpinione,$cognomeOpinione,$testoOpinione);
}
else {
  $listaerrori. ='</ul>';
  stampaPaginaErrori;
}

sub stampaConferma {   #pagina di avvenuto successo inserimento opinione; può rimandare alle opinioni o alla homepage
  my $nomeOpinione=shift; my $cognomeOpinione=shift; my testoOpinione=shift;
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
  <link rel="stylesheet" type="text/css" href="mobile.css" media="handheld, screen and (max-width:480px), only screen and (max-device-width:480px)" />
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
  <li><span xml:lang="en">Home</span></li>
  <li><a href="eventi.xml">Eventi</a></li>
  <li><a href="galleria.html">Galleria</a></li>
  <li><a href="curiosita.xml">Curiosit&#224;</a></li>
  <li><a href="contatti.html">Contatti</a></li>
  <li><a href="opinioni.xml">Opinioni</a></li>
  </ul>
  </div>
  <div class="divconferma">
  <h2>Opinione inserita con successo</h2>
  END_HTML;
  print "<p>Grazie per la tua opinione, <em>$nome $cognome</em></p>";
  print "<p>Questa è la tua opinione inserita:</p>";
  print "<p id="opinione">$testoOpinone</p>";
  print "<p>Puoi andare a vedere la tua opinione inserita <a href="opinioni.xml">cliccando qui</a></p>";
  print "<p>Oppure puoi tornare alla <a href="index.html">pagina principale</a></p>";
  print "</div>";
  print <<END_HTML;
  <div class="footer">
  <p>Pro Loco di Zero Branco</p>
  <p>Telefono: <a href="tel:+39042297613">0422 97613</a></p>
  <p>Email: <a href="mailto:segreteria@prolocozerobranco.it">segreteria@prolocozerobranco.it</a></p>
  </div>
  </body>
  </html>
  END_HTML;
  }
  
sub stampaPaginaErrori {
  my $nomeOpinioni=shift; my $cognomeOpinioni=shift; my $testoOpinioni=shift; my $errore=shift;
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
  <link rel="stylesheet" type="text/css" href="mobile.css" media="handheld, screen and (max-width:480px), only screen and (max-device-width:480px)" />
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
  <li><span xml:lang="en">Home</span></li>
  <li><a href="eventi.xml">Eventi</a></li>
  <li><a href="galleria.html">Galleria</a></li>
  <li><a href="curiosita.xml">Curiosit&#224;</a></li>
  <li><a href="contatti.html">Contatti</a></li>
  <li><a href="opinioni.xml">Opinioni</a></li>
  </ul>
  </div>
  <div class="divconferma">
  <h2>Opinione non inserita</h2>
  <p>Sono stati commessi i seguenti errori nella compilazione del form:</p> 
  END_HTML;
  print "$errore";
  print END_HTML;
  <p>Se vuoi correggere gli errori, ricompila il form, seguendo i suggerimenti appena elencati.</p>
  <FORM action="../cgi-bin/primo.pl" method="post" name="moduloform">
  Nome: <input type="text" name="nomeOpinione" />
  Cognome: <input type="text" name="cognomeOpinione" />
  <label for="testoOpinione">La tua opinione: </label>
  <input type="text" name="testoOpinione"/>
  <input type="submit" value="Submit" />
  </FORM>
  
  <div class="footer">
  <p>Pro Loco di Zero Branco</p>
  <p>Telefono: <a href="tel:+39042297613">0422 97613</a></p>
  <p>Email: <a href="mailto:segreteria@prolocozerobranco.it">segreteria@prolocozerobranco.it</a></p>
  </div>
  </body>
  </html>
 END_HTML;
}

