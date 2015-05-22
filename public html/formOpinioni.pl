#!/usr/bin/perl

use XML::LibXML;
use CGI;

my $file = 'opinioni.xml';  #ATTENZIONE! PERCORSO DEL FILE QUANDO CARICO SU SERVER UNIPD!

my $parser = XML::LibXML->new();

my $doc = $parser->parse_file($file);

my $radice = $doc->getDocumentElement;
my@elementi = $radice->getElementByTagName('opinione');

$nuovaOp = "\n<opinione>
              \n<nome>$input{'nomeOpinione'}</nome>\n
              \n<cognome>$input{'cognomeOpinione'}</cognome>\n
              \n<recensione>$input{'testoOpinione'}</recensione>\n
            \n</opinione>\n";

$gemma = $parser->parse_balanced_chunk($nuovaOp);

$padre->appendChild($frammento);

print OUT $doc->toString;

print "Content-type:text/html\r\n\r\n";
print "<html>";
print "<head>";
print "<title>Hello - Second CGI Program</title>";
print "</head>";
print "<body>";
print "<h2>Hello $first_name $last_name - Second CGI Program</h2>";
print "</body>";
print "</html>";

#potrebbe mancare la l di uploadOpinioni
