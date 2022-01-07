//Unit en charge de la cantine
unit unitCantine;
{$codepage utf8}
{$mode objfpc}{$H+}

interface
//----- FONCTIONS ET PROCEDURES -----
uses
  unitLieu;
//Fonction exécutée à l'arrivée dans la cantine
//Renvoie le prochain lieu à visiter
function cantineHUB() : typeLieu;


implementation
uses
  sysutils,unitPersonnage,unitIHM,GestionEcran,unitCantineFonPro,unitCantineIHM;

//Mange le plat et applique le bonus
procedure manger(nbPlat : integer);
begin
     //Fixe le buff
     setBuff(bonus(nbPlat));
end;

//Fonction exécutée à l'arrivée dans la cantine
//Renvoie le prochain lieu à visiter
function cantineHUB() : typeLieu;
var choix : string;
var
  t : Tab;
  texte : String;
  recette : Text;
  i,j,k : Integer;
  choix: String;
begin
  changerTailleConsole(200,49);
  choix:='';

  i := 1;
  assign(recette,'Recettes.txt');
  reset(recette);

  while not eof(recette) do
  begin
    readln(recette,texte);
    T[i,1] := pourNom(texte);
    Inc(i);
  end;
  close(recette);

  j:=1;
  assign(recette, 'Recettes.txt');
  reset(recette);

  while not eof(recette) do
  begin
    readln(recette,texte);
    T[j,2] := pourBonus(texte);
    Inc(j);
  end;
  close(recette);

  k:=1;
  affichage(t, k,choix);
end;
end.

