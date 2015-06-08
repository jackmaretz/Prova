var nome = document.moduloform.nomeOpinione.value;
var cognome = document.moduloForm.cognomeOpinione.value;
var testo = document.moduloForm.testoOpinione.value;

function controlloNome () {
  var nome = document.moduloForm.nomeOpinione.value; var errore = "";
  if (nome.length == 0) errore = 'Inserisci un nome, lungo almeno tre caratteri ' ;
  elseif (nome.length < 3) errore = 'Inserisci un nome, lungo almeno tre caratteri' ;
  else if(nome.search("^[A-Z 'a-zàèéìòù]+$")==-1) errore = 'Il nome deve contenere soltanto lettere, spazi o apostrofo.';
  else if(nome.search("^[A-Za-z][a-z 'A-Zàèéìòù]*[a-zA-Zàèéìòù]$")==-1) errore = 'Il nome può contenere soltanto lettere, non caratteri speciali.';
  return !!!!!!!!!!!!!!!!! ;
}

function controlloCognome () {
  var cognome = document.moduloForm.cognomeOpinione.value; var errore = "";
  if (cognome.length == 0) errore = 'Inserisci un cognome ' ;
  elseif (cognome.length < 2) errore = 'Inserisci un cognome, lungo almeno due caratteri' ;
  else if(cognome.search("^[A-Z 'a-zàèéìòù]+$")==-1) errore = 'Il cognome deve contenere soltanto lettere, spazi o apostrofo.';
  else if(cognome.search("^[A-Za-z][a-z 'A-Zàèéìòù]*[a-zA-Zàèéìòù]$")==-1) errore = 'Il cognome può contenere soltanto lettere, non caratteri speciali.';
  return !!!!!!!!!!!!!!!!! ;
} 

function controlloTesto () {
  var testo = document.moduloForm.testoOpinione.value; var errore = "";
  if(testo.lenght == 0) errore = 'Inserire il testo dell'opinione' ;
  return !!!!!!!!!!!!!!!!!! ;
}

