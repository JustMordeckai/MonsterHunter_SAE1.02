unit UnitEncoreUnPtnDeTest;

{$mode objfpc}{$H+}

interface
uses gestionEcran, unitCantineIHM,sysutils,unitPersonnage,unitCantine;
type tab = array[1..5000,1..2] of String; //tableau deux dimensions qui va contenir les recettes
function estContenu(s : String;c:Char) : Integer; //savoir si un char est contenu dans un string
function pourNom(s : String) : String; //permet de remplir les noms des recettes dans le tableau
function pourBonus(s : String) : String; //permet de remplir les bonus des recette dans le tableau
procedure TriABulleAlpha(var t : tab); //permet de trier les recettes par ordre alphabétique
procedure TriABulleBonus(var t : tab); //permet de trier les recettes par rapport au bonus
procedure affichage(var t : tab; var k:Integer;choix:String); //affiche les recettes

implementation
//affiche les recettes
procedure affichage(var t : tab; var k:Integer;choix:String);
var
  y:Integer;
begin
   effacerEcran();
   IHMCantine();
   if k = 5000 then k:=1;
   for y:= 4 to 43 do
   begin
    deplacerCurseurXY(5,y);
    write(k,'/ ',T[k,1]);
    deplacerCurseurXY(87,y);
    write(T[k,2]);
    inc(k);
   end;

   for y:=4 to 43 do
   begin
    deplacerCurseurXY(105,y);
    write(k,'/ ',T[k,1]);
    deplacerCurseurXY(183,y);
    write(T[k,2]);
    inc(k);
   end;

   deplacerCurseurXY(175,45);write('Votre choix : ');
   deplacerCurseurXY(189,45);readln(choix);
   //Si l'utilisateur saisit 0 => sortir
   if(choix = '0') then choixRecette := ville
   else if(TryStrToInt(choix,choixNumber)) then
    begin
         //Si la recette existe, la manger
         if(choixNumber > 0) and (choixNumber < 5001) then manger(choixNumber);
    end;
   if choix = 'Z' then
     affichage(t,k,choix);
   end;
end;

//savoir si un char est contenu dans un string
function estContenu(s : String;c:Char) : Integer;
var
  i : Integer;
  sortie : Boolean;
  res : Integer;
begin
  sortie := False;
  i := Low(s);

  while sortie = false do
     begin
       if i > Length(s)then
        begin
          res := -1;
          sortie := true;
        end
      else if s[i] = c then
        begin
          res := i;
          sortie := true;
        end
      else
        i := i +1
    end;

  estContenu := res;
end;

//permet de remplir les noms des recettes dans le tableau
function pourNom(s : String) : String;
var
  pos : Integer;
  sRes : String;
begin
  pos:=estContenu(s,'/');
  if pos <> -1 then
    begin
      sRes := copy(s,1,pos-1);
    end
  else sRes:= s;
  pourNom := sRes;
end;

//permet de remplir les bonus des recette dans le tableau
function pourBonus(s : String) : String;
var
  pos : Integer;
  sRes : String;
begin
  pos:=estContenu(s,'/');
  if pos <> -1 then
    begin
      sRes := copy(s,pos+1);
    end
  else sRes:= s;
  pourBonus := sRes;
end;

//permet de trier les recettes par ordre alphabétique
procedure TriABulleAlpha(var t : tab);
var
  i,j:Integer;
  sortie:Boolean;
  temp,tempA:String;
begin
  i:=High(t);
  sortie:=True;

  repeat
    sortie:=False;
    for j := Low(t) to i-1 do
    begin
     if t[j+1,1] < t[j,1] then
       begin
         temp := t[j+1,1];
         t[j+1,1] := t[j,1];
         t[j,1] := temp;

         tempA := t[j+1,2];
         t[j+1,2] := t[j,2];
         t[j,2] := tempA;
         sortie := True;
       end;
    end;
    dec(i);
  until sortie = False;
end;

//permet de trier les recettes par rapport au bonus
procedure TriABulleBonus(var t : tab);
var
  i,j:Integer;
  sortie:Boolean;
  temp,tempA:String;
begin
  i:=High(t);
  sortie:=True;

  repeat
    sortie:=False;
    for j := Low(t) to i-1 do
    begin
     if t[j+1,2] < t[j,2] then
       begin
         temp := t[j+1,2];
         t[j+1,2] := t[j,2];
         t[j,2] := temp;

         tempA := t[j+1,1];
         t[j+1,1] := t[j,1];
         t[j,1] := tempA;
         sortie := True;
       end;
    end;
    dec(i);
  until sortie = False;
end;

end.

