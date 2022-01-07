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

//Fonction exécutée pour afficher l'écran d'affichage des compétences
//Renvoie le prochain lieu à visiter
function choixCompetence() : typeLieu;
var choix : string;
  choixNumber : integer;
begin
  choix := '';
  while (choix <> '0') do
  begin
    afficherInterfacePrincipale();
    afficherLieu('Cantine de la ville de Brightwood');
                                                        
    deplacerCurseurXY(63,5);write('L''entraîneur vous proposent :');
    couleurTexte(Cyan);
    deplacerCurseurXY(30,7);write('Compétence');
    deplacerCurseurXY(70,7);write('Decription');  
    couleurTexte(White);
    deplacerCurseurXY(30,9);write('1/ Boule de feu');
    deplacerCurseurXY(70,9);write('Permets de lancer une boule de feu sur son adversaire (50 HP)');
    deplacerCurseurXY(30,10);write('2/ Éclair'); 
    deplacerCurseurXY(70,10);write('Permets d''abattre un éclair sur son adversaire (25 HP)');

    deplacerCurseurZoneAction(1);write('Que souhaitez-vous faire ?');
    deplacerCurseurZoneAction(3);write('     ?/ Apprendre une compétence (entrer son numéro)');

    deplacerCurseurZoneAction(6);write('     0/ Retourner sur la place principale');

    deplacerCurseurZoneResponse();
    readln(choix);

    //Si l'utilisateur saisit 0 => sortir
    if(choix = '0') then choixCompetence := ville
    //Si l'utilisateur saisit un nombre, convertir choix (string) en choixNumber (integer)
    else if(TryStrToInt(choix,choixNumber)) then
    begin
         //Si la compétence existe, l'apprendre
         if(choixNumber > 0) and (choixNumber < 3) then setCompetence(choixNumber);
    end;
  end;


end;


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

    deplacerCurseurZoneAction(1);write('Que souhaitez-vous faire ?');
    deplacerCurseurZoneAction(3);write('     1/ Apprendre une compétence');

    deplacerCurseurZoneAction(5);write('     0/ Retourner sur la place principale');

    deplacerCurseurZoneResponse();
    readln(choix);
  end;

  case choix of
      '0' : campsHUB := ville;
      '1' : choixCompetence();
  end;

end;
end.