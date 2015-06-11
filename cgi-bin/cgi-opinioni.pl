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
