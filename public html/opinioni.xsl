<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes' />

<xsl:template match="/">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Curiosit&#224; - Pro Loco di Zero Branco</title>
<meta name="keywords" content="Pro Loco Zero Branco, Eventi Zero Branco, Feste Zero Branco" />
<meta name="description" content="Sito della Pro Loco; contiene informazioni sulle sagre e sugli eventi cittadini." />
<meta name="HandheldFriendly" content="True" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />	
<meta name="viewport" content="height=device-height, initial-scale=1.0,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />	
<meta name="author" content="Giulia Zanibellato, Giacomo Maretto, Patrizio Stella" />
<meta name="rating" content="general" />

<link rel="stylesheet" type="text/css" href="css/custom.css" />
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
    <li><a href="index.html">Home</a></li>
    <li><a href="eventi.xml">Eventi</a></li>
    <li><a href="galleria.html">Galleria</a></li>
    <li><a href="curiosita.xml">Curiosit&#224;</a></li>
    <li><a href="contatti.html">Contatti</a></li>
    <li>Opinioni</li>
  </ul>
</div>

<div class="corpo">

<h2>Opinioni</h2>
<p>Avete partecipato ad una manifestazione organizzata dalla Pro Loco? Volete 
esprimere un pensiero su un evento a cui avete partecipato? Nessun problema: 
vi baster&#224; compilare il form sottostante.</p>

<FORM action="../cgi-bin/primo.pl" method="post">
Nome: <input type="text" name="nomeOpinione" />  

Cognome: <input type="text" name="cognomeOpinione" />


<label for="testoOpinione">La tua opinione: </label>
<input type="text" name="testoOpinione"/> 

<input type="submit" value="Submit" />

</FORM>

<p>Queste sono le opinioni di chi ci ha gi&#224; visitato:</p>

<ul><xsl:apply-templates select="//opinione" /></ul>

  </div>
  <div class="footer">
  <p>Pro Loco di Zero Branco</p>
  <p>Telefono: <a href="tel:+39042297613">0422 97613</a></p>
  <p>Email: <a href="mailto:segreteria@prolocozerobranco.it">segreteria@prolocozerobranco.it</a></p>
</div>  

  </body>
  </html>
  
</xsl:template>

<xsl:template match="opinione">
  <li>
    <p id="nomeopinioni"><xsl:value-of select="nome" />&#160;<xsl:value-of select="cognome" /></p>
    <p><xsl:value-of select="festa" /></p>
    <p><xsl:value-of select="recensione" /></p>
  </li>
</xsl:template>

</xsl:stylesheet>
    
