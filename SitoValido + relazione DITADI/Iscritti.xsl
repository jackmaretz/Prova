<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:a="http://www.Iscritti.com" exclude-result-prefixes="a">
<xsl:output method='html' version='1.0' encoding='UTF-8' indent='yes' doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"/>
<xsl:template match="/a:iscritti">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">	
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="stile.css"></link>
		<link rel="stylesheet" type="text/css" href="medium.css" media="handheld, screen and (max-width:800px), only screen and (max-device-width:800px)" />
		<link rel="stylesheet" type="text/css" href="mini.css" media="handheld, screen and (max-width:480px), only screen and (max-device-width:480px)" />
		<title>Lista Partecipanti-Arcella Club</title>
		<meta name="title" content="Arcella Club - Iscrizione Tornei"/>
		<meta name="description" content="Lista dei partecipanti del torneo selezionato"/>
		<meta name="keywords" content="Arcella Club,sala giochi,iscritti"/>
		<meta name="language" content="italian it"/>
		<meta name="author" content="Filippo Ditadi,Stefano Righetto,Stefano Sattin,Francesco Zanotto"/>		
	</head>
	<body>
		<div id="header">
			<h1 id="logo"><span>Arcella Club</span></h1>
		</div>
		<div id="breadcrumb"><span>Ti trovi in : <a href="Homepage.html" xml:lang="en">Home</a> &gt;&gt; <a href="Tornei.html" >Tornei</a> &gt;&gt; <a href="Tornei_Programma.html" >Programma</a> &gt;&gt; Lista Partecipanti</span></div>
		<div id="nav">		
			<ul>
				<li><div><a href="Homepage.html" xml:lang="en">Homepage</a></div></li>			
				<li><div><a href="Giochi.html">Giochi</a></div></li>							
				<li><div><a href="TempoLibero.html">Tempo Libero</a></div></li>
				<li class="corrente"><span>♥♣</span><a href="Tornei.html">Tornei</a><span>♦♠</span>				
					<ul id="submenu">
						<li><div>&gt;</div><a href="Tornei_Programma.html">Programma</a></li>
						<li><div>&gt;</div><a href="cgi-bin/Tornei_Iscrizione.pl">Iscrizione</a></li>
						<li><div>&gt;</div><a href="Tornei_Eventi.html">Eventi</a></li>
						<li><div>&gt;</div><a href="Tornei_Premi.html">Premi</a></li>				
					</ul>					
				</li>
				<li><div><a href="Regolamento.html">Regolamento</a></div></li>
				<li><div><a href="DoveSiamo.html">Dove Siamo</a></div></li>				
			</ul>
		</div>		
		<div id="content">
			<h1 id="liste">Lista partecipanti Torneo di <xsl:value-of select="@giorno"/></h1>
			<xsl:choose>
				<xsl:when test="count(a:iscritto)&gt;16">
					<p>Attualmente ci sono <xsl:value-of select="count(a:iscritto)"/> iscritti :</p>					
					<div id="iscritti">
					<ol>						
						<xsl:for-each select="a:iscritto">
							<li xml:space="preserve"><xsl:value-of select="a:nome"/> <xsl:value-of select="a:cognome"/></li>
						</xsl:for-each>
					</ol>
					</div>
				</xsl:when>
				<xsl:when test="count(a:iscritto)&gt;1">
					<p>Attualmente ci sono <xsl:value-of select="count(a:iscritto)"/> iscritti :</p>					
					<ol>						
						<xsl:for-each select="a:iscritto">
							<li xml:space="preserve"><xsl:value-of select="a:nome"/> <xsl:value-of select="a:cognome"/></li>
						</xsl:for-each>
					</ol>
				</xsl:when>
				<xsl:when test="count(a:iscritto)&gt;0">
					<p>Attualmente c'è 1 iscritto :</p>
					<p id="lasciaMargine" xml:space="preserve"><xsl:value-of select="//a:nome"/> <xsl:value-of select="//a:cognome"/></p>
				</xsl:when>				
				<xsl:otherwise>
					<p id="lasciaMargine">Non c'è ancora nessun iscritto a questo torneo.</p>
				</xsl:otherwise>
			</xsl:choose>	
			<a href="Tornei_Programma.html" class="torna">Torna al Programma</a>
		</div>
		<div id="footer">
			<img src="Immagini/valid-xhtml10.png" alt="Xhtml Valido"/>			
			<img src="Immagini/vcss-blue.gif" alt="Css Valido"/>
			<p><a href="DoveSiamo.html">Lo Staff di Arcella <span xml:lang="en">Club</span></a></p><p>Seguici su :</p>
			<a href="https://www.facebook.com/arcellaclub"><span id="fb"></span></a>
			<a href="https://twitter.com/ArcellaClub"><span id="tw"></span></a>	
		</div>
	</body>
</html>
</xsl:template>         
</xsl:stylesheet>