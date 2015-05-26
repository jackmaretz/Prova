//rimettere classe corrente sul submenu e la spunta sul regolamento sulla form
function controlloNome(){
	var nome=document.getElementById('nome').value;var messaggio="";
	if(nome.length<2)messaggio='Inserire un nome di almeno due caratteri!';
	else if(nome.search("^[A-Z a-zàèéìòù]+$")==-1)messaggio='Il nome può contenere solo lettere e spazi!';
	else if(nome.search("^[A-Za-z][a-z A-Zàèéìòù]*[a-zA-Zàèéìòù]$")==-1)messaggio='Il nome deve iniziare e finire con una lettera!';
	return modificaErrore('nome',messaggio);
}
function controlloCognome(){	
	var cognome=document.getElementById('cognome').value;var messaggio="";
	if(cognome.length<2)messaggio='Inserire un cognome di almeno due caratteri!';
	else if(cognome.search("^[A-Z 'a-zàèéìòù]+$")==-1)messaggio="Il cognome può contenere solo lettere,spazi o l'apostrofo!";
	else if(cognome.search("^[A-Za-z][a-z 'A-Zàèéìòù]*[a-zA-Zàèéìòù]$")==-1)messaggio='Il cognome deve iniziare e finire con una lettera!';
	return modificaErrore('cognome',messaggio);
}
function controlloTelefonoEmail(){//Per telefono ed Email i controlli li faccio congiuntamente
	var telefono=document.getElementById('telefono').value;email=document.getElementById('email').value;var messaggioT="";var messaggioE="";
	if(telefono.length!=0&&telefono.length<6)messaggioT='Inserire un telefono di almeno 6 cifre!';
	else if(telefono.length>10)messaggioT='Inserire un telefono di non più di 10 cifre!';
	else if(telefono.search("^[0-9]*$")==-1)messaggioT='Il telefono può contenere solo cifre!';
	if(email.length!=0&&email.search("^[\\w-\\.0-9]{2,}[@][a-z]{2,}[\\.][a-z]{2,}$")==-1)messaggioE='Inserire una Mail valida!';	
	if(telefono.length==0&&email.length==0){messaggioT='Inserire almeno un recapito!';messaggioE=messaggioT;}
	var tCorretto=modificaErrore('telefono',messaggioT);
	var eCorretta=modificaErrore('email',messaggioE);
	if(!tCorretto||!eCorretta)return false;
	return true;
}
function controllaSpunta(){
	var messaggio="";
	if(!document.getElementById('regolamento').checked)messaggio="Devi Accettare il Regolamento per poter partecipare!";
	return modificaErrore('regolamento',messaggio);
}
function controllaTorneo(){
	var messaggio="";
	if(document.getElementById('torneo').value=="")messaggio="Devi selezionare un torneo!";
	return modificaErrore('torneo',messaggio);
}
function controllaErrori(){	
	var rit=true;
	focus=controlloTelefonoEmail();
	if(!controlloCognome())rit=false;
	if(!controlloNome())rit=false;	
	if(!controllaSpunta())rit=false;
	if(!controllaTorneo())rit=false;
	return rit;
}
function modificaErrore(id,messaggio)
{
	document.getElementById(id+'Err').innerHTML=messaggio;
	if(messaggio.length!=0){document.getElementById(id).style.borderColor="red";return false;}
	else {document.getElementById(id).style.borderColor="initial";return true;}		
}
function togliMessaggi(){
	modificaErrore('nome','');
	modificaErrore('cognome','');
	modificaErrore('email','');
	modificaErrore('telefono','');
	modificaErrore('regolamento','');
	modificaErrore('torneo','');
}