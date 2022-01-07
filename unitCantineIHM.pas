unit unitencoreunptndetestIHM;

{$mode objfpc}{$H+}

interface
uses
  gestionEcran;

procedure IHMCantine();

implementation
procedure IHMCantine();
begin
   //en-tête
   dessinerCadreXY(1,3,198,49,simple,white,black);
   dessinerCadreXY(48,0,150,2,simple,white,black);
   dessinerCadreXY(54,1,145,3,simple,white,black);
   deplacerCurseurXY(83,2);write('Cantine de la ville de Brightwood');

   //Détails
   deplacerCurseurXY(30,4);write('Plats');
   deplacerCurseurXY(90,4);write('Bonus');
   deplacerCurseurXY(140,4);write('Plats');
   deplacerCurseurXY(187,4);write('Bonus');

   //pied de page
   dessinerCadreXY(0,46,199,49,Simple,white,black);
   deplacerCurseurXY(15,45);write('?/ Commander un plat (entrer son numero)');
   deplacerCurseurXY(15,46);write('0/ Retourner sur la place principale');
   deplacerCurseurXY(80,45);write('X/ Afficher par ordre alphabétique');
   deplacerCurseurXY(80,46);write('Y/ Afficher en fonction des bonus');
   deplacerCurseurXY(130,45);write('Z/ Page suivante');
   deplacerCurseurXY(130,46);write('Buff : Aucun');
end;
end.

