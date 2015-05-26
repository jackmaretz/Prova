#!/usr/bin/perl
print "Content-type:text/html\n\n";
use CGI::Carp qw(fatalsToBrowser);
use CGI;
use XML::LibXML;
my $page=new CGI;

if($page->param('submit')ne 0 && $page->param('submit')eq 'Iscriviti'){controllaErroriForm();}# entro qui solo se l'utente ha cliccato su iscriviti
else 
{
	stampaInizioPagina();
	stampaForm();
}

sub controllaErroriForm
{
	my $torneo=$page->param("torneo");
	my $nome=$page->param("nome");
	my $cognome=$page->param("cognome");
	my $telefono=$page->param("telefono");
	my $email=$page->param("email");
	my $regolamento=$page->param("regolamento");	
	my $errore='<ul id="errori"><p>Compilare correttamente i dati richiesti! Sono stati rilevati i seguenti errori:</p>';#inizializzo il messaggio d'errore come una lista vuota di errori
	#Controlli su validità input,faccio più di un controllo per input e scrivo tutti gli errori trovati,se il campo è vuoto però scrivo un solo messaggio
	if(length $torneo==0) {$errore.='<li> - Non hai selezionato alcun torneo!</li>';}
	if(length $nome==0) {$errore.='<li> - Campo nome mancante!</li>';}
	else
	{
		$errore.='<li> - Il nome deve contenere almeno due caratteri </li>' unless(length $nome>1);
		$errore.='<li> - Il nome può contenere solo lettere e spazi </li>' unless($nome=~'^[A-Za-z àèéìòù]*$');
		$errore.='<li> - Il nome deve iniziare e finire con una lettera</li>' unless($nome=~'^[A-Za-z].*[A-Za-zàèéìòù]$');
	}
	if(length $cognome==0) {$errore.='<li> - Campo cognome mancante!</li>'}
	else
	{
		$errore.='<li> - Il cognome deve contenere almeno due caratteri </li>' unless(length $cognome>1);
		$errore.="<li> - Il cognome può contenere solo lettere,spazi o l'apostrofo</li>" unless($cognome=~'^[A-Za-zàèéìòù \']*$');
		$errore.='<li> - Il cognome deve iniziare e finire con una lettera</li>' unless($cognome=~'^[A-Za-z].*[A-Za-zàèéìòù]$');
	}	
	if(length $telefono==0&&length $email==0) {$errore.='<li> - Manca un recapito tra telefono ed email!</li>'}
	else
	{
		$errore.='<li> - Il telefono deve contenere minimo 6 e massimo 10 cifre </li>' unless(length $telefono==0||(length $telefono>5&& length $telefono<11 && $telefono=~'^[0-9]{6,10}'));
		$errore.='<li> - Mail non valida </li>' unless(length $email==0||($email=~'^[\\w-\\.0-9]{2,}[@][a-z]{2,}[\\.][a-z]{2,}$'));
	}
	$errore.='<li> - Il regolamento non è stato accettato' unless($regolamento eq 'regolamento');
	#se non ho trovato errori inserisco l'iscritto e confermo l'avvenuto inserimento,altrimenti stampo a video la form con l'elenco degli errori in cima
	if(length $errore==103)#lunghezza della stringa se non ho aggiunto nessun errore
	{
		stampaInizioPagina();
		#Inseriamo l'iscritto nel file Torneo1.xml
		my $fileDati="../public_html/".$torneo.".xml";#imposto il path del file dati del torneo al quale mi sto iscrivendo
		my $parser = XML::LibXML->new(); #creo il parser
		my $doc = $parser->parse_file($fileDati) || die("Operazione di parsificazione fallita"); #parser del documento
		my $root = $doc->getDocumentElement || die("Non accedo alla radice"); #recupero l'elemento radice		
		my $frammento = "<iscritto><nome>$nome</nome><cognome>$cognome</cognome>";
		$frammento.="<telefono>$telefono</telefono> if($telefono ne '')";
		$frammento.="<email>$email</email> if($email ne '')";
		my $nodo = $parser->parse_balanced_chunk($frammento)|| die("frammento non ben formato");
		$root->appendChild($nodo); #Aggiungo sempre nella radice del documento
		open(FILE,">$fileDati")||die("Impossibile aprire il file xml");
		print FILE $doc->toString(1); #il parametro uno dice di tentare di tenere il file ben indentato
		close(FILE);
		stampaConferma($nome,$cognome,$telefono,$email);	
	}
	else 
	{
		$errore.='</ul>';
		stampaInizioPagina();
		stampaForm($torneo,$nome,$cognome,$telefono,$email,$errore);
	}
}
sub stampaInizioPagina
{	
	print <<END_HTML; #stampo l'inizio della pagina fino a content
	<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
	<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">	
	<head>	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="../stile.css"></link>
		<link rel="stylesheet" type="text/css" href="../medium.css" media="handheld, screen and (max-width:800px), only screen and (max-device-width:800px)" />
		<link rel="stylesheet" type="text/css" href="../mini.css" media="handheld, screen and (max-width:480px), only screen and (max-device-width:480px)" />
		<title>Iscrizione-Arcella Club</title>
		<meta name="title" content="Arcella Club - Iscrizione"/>
		<meta name="description" content="Pagina per l'iscrizione ai tornei organizzati da Arcella Club."/>
		<meta name="keywords" content="Arcella Club,sala giochi,iscrizione"/>
		<meta name="language" content="italian it"/>
		<meta name="author" content="Filippo Ditadi,Stefano Righetto,Stefano Sattin,Francesco Zanotto"/>	
		<script type="text/javascript" src="../ControlliForm.js"></script>		
	</head>
	<body>
		<div id="header">
		<h1 id="logo"><span>Arcella Club</span></h1>
		</div>
		<div id="breadcrumb"><span>Ti trovi in : <a xml:lang="en" href="../Homepage.html">Home</a> &gt;&gt; <a href="../Tornei.html">Tornei</a> &gt;&gt; Iscrizione</span></div>
		<div id="nav">		
		<a class="saltaNav" href="#content">Vai al contenuto</a>
		<ul>
		<li><div><a href="../Homepage.html" xml:lang="en">Homepage</a></div></li>			
		<li><div><a href="../Giochi.html">Giochi</a></div></li>			
		<li><div><a href="../TempoLibero.html">Tempo Libero</a></div></li>
		<li class="corrente"><span>♥♣</span><a href="../Tornei.html">Tornei</a><span>♦♠</span>					
			<ul id="submenu">						
				<li><div>&gt;</div><a href="../Tornei_Programma.html">Programma</a></li>	
				<li class="correnteS">Iscrizione</li>
				<li><div>&gt;</div><a href="../Tornei_Eventi.html">Eventi</a></li>
				<li><div>&gt;</div><a href="../Tornei_Premi.html">Premi</a></li>			
			</ul>					
		</li>				
		<li><div><a href="../Regolamento.html">Regolamento</a></div></li>
		<li><div><a href="../DoveSiamo.html">Dove Siamo</a></div></li>				
		</ul>
		</div>		
		<div id="content">
END_HTML
}
sub stampaForm
{	
	#prendo in ingresso tutti i campi compilati ed eventualmente la lista di errori da mostrare
	my $torneo=shift;my $nome=shift;my $cognome=shift;my $telefono=shift;my $email=shift;my $errori=shift;
	#posso anche creare una variabile che memorizzi il fatto di avere accettato il regolamento a no
	print '<p>Qui puoi registrarti ai tornei organizzati dal nostro club. Per vedere la tabella completa visita la sezione <a href="../Tornei_Programma.html">Programma</a>.</p>';
	print "<p>Per l'iscrizione devi scegliere un torneo,compilare <em>tutte</em> le informazioni personali ed inserire <em>almeno un</em> recapito.</p>";	
	print $errori unless($errori eq '');	
	print <<END_HTML;	
	<form action="" method="post" onsubmit="return controllaErrori()">						
		<fieldset>
		<legend>Torneo : </legend>
		<select name="torneo" id="torneo">
		<option value="" selected="selected">Scegli un Torneo</option>
		<option value="Torneo1">Lunedì 1</option>
		<option value="Torneo2">Martedì 2</option>
		<option value="Torneo3">Mercoledì 3</option>
		<option value="Torneo4">Giovedì 4</option>
		<option value="Torneo5">Venerdì 5</option>
		<option value="Torneo6">Sabato 6</option>
		<option value="Torneo7">Domenica 7</option>		
		</select>
		<div id="torneoErr"></div>	
		</fieldset>
		<fieldset>
		<legend>Informazioni Personali : </legend>
		<label for="nome">Nome :</label>
		<input type="text" name="nome" id="nome" value="$nome" onblur="controlloNome()"/>
		<div id="nomeErr"></div>		
		<label for="cognome">Cognome :</label>
		<input type="text" name="cognome" id="cognome" value="$cognome" onblur="controlloCognome()"/>
		<div id="cognomeErr"></div>			
		</fieldset>				
		<fieldset>
		<legend>Recapito : </legend>
		<label for="telefono">Telefono :</label>
		<input type="text" name="telefono" id="telefono" value="$telefono" onblur="controlloTelefonoEmail()"/>
		<div id="telefonoErr"></div>		
		<label for="email" xml:lang="en">Email :</label>
		<input type="text" name="email" id="email" value="$email" onblur="controlloTelefonoEmail()"/>
		<div id="emailErr"></div>		
		</fieldset>
		<fieldset>
		<legend>Regolamento : </legend>
		<input name="regolamento" id="regolamento" type="checkbox" value="regolamento"/>
		<label for="regolamento" id="reg">Accetto</label><p> il <a href="../Regolamento.html">Regolamento</a> del Club.</p><div id="regolamentoErr"></div>								
		</fieldset>				
		<fieldset>
		<legend>Opzioni : </legend>
		<input type="submit" name="submit" value="Iscriviti" id="iscriviti"/>
		<input type="reset" value="Cancella Tutto" onclick="togliMessaggi()"/>
		</fieldset>
	</form>				
	</div>
	<div id="footer">
		<img src="../Immagini/valid-xhtml10.png" alt="Xhtml Valido"/>			
		<img src="../Immagini/vcss-blue.gif" alt="Css Valido"/>
		<p><a href="../DoveSiamo.html">Lo Staff di Arcella <span xml:lang="en">Club</span></a></p><p>Seguici su :</p>
		<a href="https://www.facebook.com/arcellaclub"><span id="fb"></span></a>
		<a href="https://twitter.com/ArcellaClub"><span id="tw"></span></a>	
	</div>
</body>
</html>
END_HTML
}
sub stampaConferma
{
	my $nome=shift;my $cognome=shift;my $telefono=shift;my $email=shift;
	print <<END_HTML;
	<p>Iscrizione effettuata con successo !!</p>
	<p>Ecco i dati inseriti:</p>
	<ul id="datiPersonali">
		<li>Nome : $nome</li>
		<li>Cognome : $cognome</li>
END_HTML
	print "<li>Telefono : $telefono</li>" if($telefono);
	print "<li>Email : $email</li>" if($email);
	print "</ul>";
	print <<END_HTML;
		<p>Puoi controllare l'avvenuta iscrizione controllando la lista partecipanti del torneo selezionato!</p>				
		<a href="../Tornei_Programma.html" class="torna">Torna al Programma</a>
	</div>
	<div id="footer">
		<img src="../Immagini/valid-xhtml10.png" alt="Xhtml Valido"/>			
		<img src="../Immagini/vcss-blue.gif" alt="Css Valido"/>
		<p><a href="../DoveSiamo.html">Lo Staff di Arcella <span xml:lang="en">Club</span></a></p><p>Seguici su :</p>
		<a href="https://www.facebook.com/arcellaclub"><span id="fb"></span></a>
		<a href="https://twitter.com/ArcellaClub"><span id="tw"></span></a>	
	</div>
	</body>
</html>
END_HTML
}