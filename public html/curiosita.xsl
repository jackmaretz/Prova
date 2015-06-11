<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version='1.0' encoding='UTF-8' indent='yes' />

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
<link rel="stylesheet" type="text/css" href="css/mobile.css" media="handheld, screen and (max-width:480px), only screen and (max-device-width:480px)" />
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Pinyon+Script" />
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Quattrocento+Sans" />

</head>

<body>


<div class="header">
  <h1>Pro Loco di Zero Branco</h1>
</div>

<div class="horizontalmenu">
  <ul>
    <li><a href="index.html"><span xml:lang="en">Home</span></a></li>
    <li><a href="eventi.xml">Eventi</a></li>
    <li><a href="galleria.html">Galleria</a></li>
    <li>Curiosit&#224;</li>
    <li><a href="contatti.html">Contatti</a></li>
    <li><a href="opinioni.xml">Opinioni</a></li>
  </ul>
</div>

<div class="corpo">

<h2>Ricette</h2>
<p>Una selezione di ricette che ruotano attorno alle tematiche dei vari
    eventi della Pro Loco. </p>

<ul><xsl:apply-templates select="//ricetta" /></ul>

<p>Visualizza tutte le ricette, anche quelle inserite dagli altri utenti</p>
<p>Hai una ricetta da inserire? Segui le istruzioni qui sotto!  </p>

<div class="formricetta">
<form action="" method="post" enctype="multipart/form-data">
  <div id="infobase">
  <fieldset>
    <legend>Informazioni di base</legend>
  <label for="nomericetta">Nome ricetta:</label>
  <input name="nomericetta" id="nomericetta" value="" maxlenght="100" />
  <label for="numpers">Numero di persone:</label>
  <input name="numpers" id="numpers" value="" maxlenght="2" />
  </fieldset>

    
  <fieldset>
    <legend>Ingredienti</legend>

  <input name="ingrediente1" id="ingrediente1" value="" maxlenght="100" />
  <input name="ingrediente2" id="ingrediente2" value="" maxlenght="100" />
  <input name="ingrediente3" id="ingrediente3" value="" maxlenght="100" />
  <input name="ingrediente4" id="ingrediente4" value="" maxlenght="100" />
  <input name="ingrediente5" id="ingrediente5" value="" maxlenght="100" />
  <input name="ingrediente6" id="ingrediente6" value="" maxlenght="100" />
  <input name="ingrediente7" id="ingrediente7" value="" maxlenght="100" />
  <input name="ingrediente8" id="ingrediente8" value="" maxlenght="100" />
  <input name="ingrediente9" id="ingrediente9" value="" maxlenght="100" />
  <input name="ingrediente10" id="ingrediente10" value="" maxlenght="100" />
  <input name="ingrediente11" id="ingrediente11" value="" maxlenght="100" />
  <input name="ingrediente12" id="ingrediente12" value="" maxlenght="100" />
  <input name="ingrediente13" id="ingrediente13" value="" maxlenght="100" />
  <input name="ingrediente14" id="ingrediente14" value="" maxlenght="100" />
  <input name="ingrediente15" id="ingrediente15" value="" maxlenght="100" />
  </fieldset>
    
  <fieldset>
    <legend>Svolgimento:</legend>
	<textarea  rows="30" cols="25" name="svolgimento"></textarea>
  </fieldset>
  <div id="infobase">
    <fieldset>
    <legend>Ultimi dati:</legend>
  <p>
  <label for="immaginericetta">Immagine:</label>
  <input type="file" name="immaginericetta" />
  <label for="nomeimmagine">Nome dell'immagine:</label>
  <input type="text" name="nomeimmagine" id="nomeimmagine" maxlenght="100" />
  </p>
  <input class="button" type="button" name="controlla" id="controlla" value="Controlla campi"  tabindex="11" onclick="controllaCampi();"/>			
	<input class="button" type="reset" name="cancella"  id="cancella" value="Cancella tutto" tabindex="12" />
	<input class="button" type="submit" name="bottoneinvia" id="bottoneinvia" value="Invia" tabindex="13"  />
  </fieldset>
  </div>
  
  </div>
</form>
  </div>
  </div>
  <div class="footer">
  <p>Pro Loco di Zero Branco</p>
  <p>Telefono: <a href="tel:+39042297613">0422 97613</a></p>
  <p>Email: <a href="mailto:segreteria@prolocozerobranco.it">segreteria@prolocozerobranco.it</a></p>
</div>  

  </body>
  </html>
  
</xsl:template>

<xsl:template match="ricetta">
  <li><h3><xsl:value-of select="titolo" /></h3>
    <p id="ricetta"><xsl:value-of select="numpers" /></p>
    <xsl:element name="img">
      <xsl:attribute name="src">
        <xsl:value-of select="immagine" />
      </xsl:attribute>
    </xsl:element>
    <p id="ricetta">Ingredienti: </p>
      <ul>
        <li><xsl:for-each select="ingredienti/ingrediente">
            <p><xsl:value-of select="." /></p>
          </xsl:for-each>
          </li>
      </ul>
    <p id="ricetta">Procedimento:</p>
    <p><xsl:value-of select="svolgimento" /></p>
  </li>
</xsl:template>

</xsl:stylesheet>
    
