#!/usr/bin/perl

use XML::LibXML;

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
