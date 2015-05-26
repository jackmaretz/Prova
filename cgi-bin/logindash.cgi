use CGI::Session;
use CGI;
use XML::LibXML;


$session = CGI::Session->new();   #controlla l'autenticazione dell'utente

$user = "";
if ($session->param(-name => "nome")) {
	$user = $session->param(-name => "nome");
}
else {
	$cgi = new CGI();
	print $cgi->redirect("../public html/index.html");
	
print <<EOF;

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


  <h1>Pannello di amministrazione</h1>
  
  <h2>Modifica eventi</h2>
  <h2>Modifica galleria</h2>
  <h2>Modifica opinioni</h2>
  
  </body>
  </html>
