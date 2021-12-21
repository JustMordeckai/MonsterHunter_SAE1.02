//Unit en charge du camps d'entrainement
unit unitCamps;
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//----- FONCTIONS ET PROCEDURES -----
uses
  unitLieu;
//Fonction exécutée à l'arrivée dans le camps d'entrainement
//Renvoie le prochain lieu à visiter
function campsHUB() : typeLieu;












implementation
uses
  sysutils,unitPersonnage,unitIHM,GestionEcran;

//Fonction exécutée à l'arrivée dans le camps d'entrainement
//Renvoie le prochain lieu à visiter
function campsHUB() : typeLieu;
var choix : string;
begin
  choix := '';
  while (choix <> '0') and (choix <> '1') and (choix <> '2') do
  begin
    afficherInterfacePrincipale();
    afficherLieu('Camps d''entrainement de la ville de Brightwood');

    deplacerCurseurXY(30,7);write('Text ligne 1');
    deplacerCurseurXY(30,8);write('Text ligne 2');
    deplacerCurseurXY(30,9);write('Text ligne 3');
    deplacerCurseurXY(30,10);write('Text ligne 4');

    deplacerCurseurXY(30,12);write('Text ligne 6');
    deplacerCurseurXY(30,13);write('Text ligne 7');

    deplacerCurseurXY(30,15);write('Text ligne 9');
    deplacerCurseurXY(30,16);write('Text ligne 10');

    couleurTexte(White);

    deplacerCurseurZoneAction(1);write('Quel compétence voulez-vous apprendre ?');
    deplacerCurseurZoneAction(3);write('     1/ #Compétence 1');
    deplacerCurseurZoneAction(4);write('     2/ #Compétence 2');

    deplacerCurseurZoneAction(6);write('     0/ Retourner sur la place principale');

    deplacerCurseurZoneResponse();
    readln(choix);
  end;

  case choix of
       '0' : campsHUB := ville;
  end;

end;
end.