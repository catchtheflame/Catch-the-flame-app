unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, shellAPI, System.Rtti,
  FMX.Grid.Style, FMX.ScrollBox, FMX.Grid;

type
intArray = array [0..10] of integer;
multiArray = array [0..29] of array of integer;
  TForm1 = class(TForm)
    img_logo: TImage;
    btn_where: TButton;
    btn_help: TButton;
    lbl_fire: TLabel;
    btn_backf: TButton;
    edt_test: TEdit;
    lbl_help: TLabel;
    btn_backh: TButton;
    btn_game: TButton;
    btn_donate: TButton;
    btn_share: TButton;
    img_firemap: TImage;
    save: TSaveDialog;
    img_share: TImage;
    btn_backd: TButton;
    lbl_donate: TLabel;
    lbl_learn: TLabel;
    lbl_link1: TLabel;
    lbl_link2: TLabel;
    lbl_link3: TLabel;
    lbl_link4: TLabel;
    lbl_link5: TLabel;
    lbl_welcome: TLabel;
    img_info: TImage;
    btn_info: TButton;
    btn_backi: TButton;
    red0: TCircle;
    red1: TCircle;
    red2: TCircle;
    red3: TCircle;
    red4: TCircle;
    red5: TCircle;
    Red6: TCircle;
    red7: TCircle;
    red8: TCircle;
    red9: TCircle;
    red10: TCircle;
    red11: TCircle;
    red12: TCircle;
    red13: TCircle;
    red14: TCircle;
    red15: TCircle;
    red16: TCircle;
    red17: TCircle;
    red18: TCircle;
    red19: TCircle;
    red20: TCircle;
    red21: TCircle;
    red22: TCircle;
    red23: TCircle;
    red24: TCircle;
    red25: TCircle;
    red26: TCircle;
    red27: TCircle;
    red28: TCircle;
    red29: TCircle;
    orange0: TCircle;
    orange1: TCircle;
    orange2: TCircle;
    orange3: TCircle;
    orange5: TCircle;
    orange6: TCircle;
    orange7: TCircle;
    orange4: TCircle;
    orange8: TCircle;
    orange11: TCircle;
    orange13: TCircle;
    orange9: TCircle;
    orange15: TCircle;
    orange14: TCircle;
    orange10: TCircle;
    orange12: TCircle;
    orange19: TCircle;
    orange20: TCircle;
    orange16: TCircle;
    orange17: TCircle;
    orange18: TCircle;
    orange24: TCircle;
    orange23: TCircle;
    orange22: TCircle;
    orange21: TCircle;
    orange25: TCircle;
    orange26: TCircle;
    orange28: TCircle;
    orange29: TCircle;
    orange27: TCircle;
    lbl_location: TLabel;
    btn_go: TButton;
    edt_display: TEdit;
    yellow: TCircle;
    orange: TCircle;
    red: TCircle;
    lbl_scale: TLabel;
    y0: TCircle;
    y1: TCircle;
    y2: TCircle;
    y3: TCircle;
    y4: TCircle;
    y5: TCircle;
    y6: TCircle;
    y8: TCircle;
    y7: TCircle;
    y11: TCircle;
    y13: TCircle;
    y15: TCircle;
    y9: TCircle;
    y20: TCircle;
    y19: TCircle;
    y12: TCircle;
    y10: TCircle;
    y14: TCircle;
    y17: TCircle;
    y18: TCircle;
    y24: TCircle;
    y23: TCircle;
    y25: TCircle;
    y22: TCircle;
    y21: TCircle;
    y26: TCircle;
    y28: TCircle;
    y29: TCircle;
    y27: TCircle;
    y16: TCircle;
    lbl_mission: TLabel;
    lbl_para: TLabel;
    img_infologo: TImage;
    img_koala: TImage;
    img_fire: TImage;
    procedure btn_whereClick(Sender: TObject);
    procedure btn_backfClick(Sender: TObject);
    procedure btn_helpClick(Sender: TObject);
    procedure btn_backhClick(Sender: TObject);
    procedure btn_gameClick(Sender: TObject);
    procedure btn_shareClick(Sender: TObject);
    procedure btn_donateClick(Sender: TObject);
    procedure lbl_link1Click(Sender: TObject);
    procedure btn_infoClick(Sender: TObject);
    procedure btn_goClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2;
{$R *.iPhone55in.fmx IOS}

type
  TRecord = record
    foliageDensity: real;    //scale of 0 to 10
    temp : real;              // 0 to 35 degrees
    soilMoisture : real;      // scale of 0 to 10
    Wind : real;               // scale of 0 to 10
    history : boolean;        //has there been a wildfire in the last five years
    precipitation : real;     // chance of rain percentage
    steepness : real;         // scale of 0 to 10
    hasFire : boolean;        // is the fire in this region?
    riskLevel : real;        //overall risk level
  end;

var
  FireData: array [0..29] of TRecord;
  adjacency : multiarray;

procedure sampleData;   // generates sample geographical data between certain ranges
var
  i: Integer;
  boolRandom : boolean;
begin
  if random(1) = 0 then
    boolRandom := true
  else
  boolRandom := false;

for i := 0 to 29 do
begin
  fireData[i].foliageDensity := random(10);
  fireData[i].temp := random(35);
  fireData[i].soilMoisture := random(10);
  fireData[i].Wind := random(10);
  fireData[i].history := boolRandom;
  fireData[i].precipitation := random(10);
  fireData[i].steepness := random(10);
  fireData[i].riskLevel := 0;      //initialise risk level
end;

end;

procedure assignNeighbours;
begin
adjacency[0] := [1,5,30,30,30,30,30,30,30,30,30];
adjacency[1] := [0,2,6,30,30,30,30,30,30,30,30];
adjacency[2] := [3,6,1,30,30,30,30,30,30,30,30];
adjacency[3] := [4,2,7,30,30,30,30,30,30,30,30];
adjacency[4] := [8,7,3,30,30,30,30,30,30,30,30,30];
adjacency[5] := [0,30,30,30,30,30,30,30,30,30,30,30];
adjacency[6] := [1,2,7,30,30,30,30,30,30,30,30,30];
adjacency[7] := [6,2,3,4,8,10,11,30,30,30,30,30];
adjacency[8] := [4,7,11,13,30,30,30,30,30,30,30,30];
adjacency[9] := [10,14,30,30,30,30,30,30,30,30,30,30];
adjacency[10] := [9,7,11,12,18,14,30,30,30,30,30,30];
adjacency[11] := [7,8,13,10,12,30,30,30,30,30,30,30];
adjacency[12] := [10,11,13,18,19,30,30,30,30,30,30];
adjacency[13] := [8,11,12,19,20,30,30,30,30,30,30,30];
adjacency[14] := [9,10,17,30,30,30,30,30,30,30,30,30];
adjacency[15] := [17,16,30,30,30,30,30,30,30,30,30,30];
adjacency[16] := [15,17,21,22,30,30,30,30,30,30,30,30];
adjacency[17] := [14,15,16,22,23,18,30,30,30,30,30,30];
adjacency[18] := [10,12,17,19,23,30,30,30,30,30,30,30];
adjacency[19] := [12,13,18,20,24,30,30,30,30,30,30,30];
adjacency[20] := [13,19,24,25,26,27,30,30,30,30,30,30];
adjacency[21] := [22,16,26,28,30,30,30,30,30,30,30,30];
adjacency[22] := [17,16,21,26,23,30,30,30,30,30,30,30];
adjacency[23] := [22,17,18,24,25,26,30,30,30,30,30,30];
adjacency[24] := [23,19,25,30,30,30,30,30,30,30,30,30];
adjacency[25] := [23,24,20,26,30,30,30,30,30,30,30,30];
adjacency[26] := [21,22,23,25,20,27,28,29,30,30,30,30];
adjacency[27] := [20,26,29,30,30,30,30,30,30,30,30,30];
adjacency[28] := [21,26,29,30,30,30,30,30,30,30,30,30];
adjacency[29] := [28,26,27,30,30,30,30,30,30,30,30,30];

end;


function calculateRisklevel(region : TRecord) : real;
begin
region.riskLevel := 0;
  if region.foliageDensity > 8  then
    region.riskLevel := region.riskLevel + 1
  else if region.foliageDensity > 6 then
    region.riskLevel := region.riskLevel + 0.8
  else if region.foliageDensity > 4 then
    region.riskLevel := region.riskLevel + 0.6
  else if region.foliageDensity > 2 then
    region.riskLevel := region.riskLevel + 0.4;

  if region.temp > 30  then
    region.riskLevel := region.riskLevel + 2
  else if region.temp > 25 then
    region.riskLevel := region.riskLevel + 1
  else if region.temp > 20 then
    region.riskLevel := region.riskLevel + 0.5
  else if region.temp > 15 then
    region.riskLevel := region.riskLevel + 0.1;

  if region.soilMoisture < 1  then
    region.riskLevel := region.riskLevel + 1.5
  else if region.soilMoisture < 3 then
    region.riskLevel := region.riskLevel + 1
  else if region.soilMoisture < 5 then
    region.riskLevel := region.riskLevel + 0.5
  else if region.soilMoisture < 7 then
    region.riskLevel := region.riskLevel + 0.1;

  if region.Wind > 8  then
    region.riskLevel := region.riskLevel + 2
  else if region.Wind > 6 then
    region.riskLevel := region.riskLevel + 1.5
  else if region.Wind > 4 then
    region.riskLevel := region.riskLevel + 1
  else if region.Wind > 2 then
    region.riskLevel := region.riskLevel + 0.5;

if region.history = true then
    region.riskLevel := region.riskLevel - 2
else
    region.riskLevel := region.riskLevel + 1;

  if region.precipitation < 1  then
    region.riskLevel := region.riskLevel + 3
  else if region.precipitation < 3 then
    region.riskLevel := region.riskLevel + 2
  else if region.precipitation < 5 then
    region.riskLevel := region.riskLevel + 1
  else if region.precipitation < 7 then
    region.riskLevel := region.riskLevel + 0.5;

  if region.steepness < 1  then
    region.riskLevel := region.riskLevel + 1.5
  else if region.steepness < 3 then
    region.riskLevel := region.riskLevel + 1
  else if region.steepness < 5 then
    region.riskLevel := region.riskLevel + 0.5
  else if region.steepness < 7 then
    region.riskLevel := region.riskLevel + 0.1;

  calculateRisklevel := region.riskLevel;
end;


Procedure showOrange;
begin
  if fireData[0].riskLevel >= 1 then
     form1.y0.Visible := true;
  if fireData[1].riskLevel >= 1 then
     form1.y1.Visible := true;
  if fireData[2].riskLevel >= 1 then
     form1.y3.Visible := true;
  if fireData[3].riskLevel >= 1 then
     form1.y3.Visible := true;
  if fireData[4].riskLevel >= 1 then
     form1.y4.Visible := true;
  if fireData[5].riskLevel >= 1 then
     form1.y5.Visible := true;
  if fireData[6].riskLevel >= 1 then
     form1.y6.Visible := true;
  if fireData[7].riskLevel >= 1 then
     form1.y7.Visible := true;
  if fireData[8].riskLevel >= 1 then
     form1.y8.Visible := true;
  if fireData[9].riskLevel >= 1 then
     form1.y9.Visible := true;
  if fireData[10].riskLevel >= 1 then
     form1.y10.Visible := true;
  if fireData[11].riskLevel >= 1 then
     form1.y11.Visible := true;
  if fireData[12].riskLevel >= 1 then
     form1.y12.Visible := true;
  if fireData[13].riskLevel >= 1 then
     form1.y13.Visible := true;
  if fireData[14].riskLevel >= 1 then
     form1.y14.Visible := true;
  if fireData[15].riskLevel >= 1 then
     form1.y15.Visible := true;
  if fireData[16].riskLevel >= 1 then
     form1.y16.Visible := true;
  if fireData[17].riskLevel >= 1 then
     form1.y17.Visible := true;
  if fireData[18].riskLevel >= 1 then
     form1.y18.Visible := true;
  if fireData[19].riskLevel >= 1 then
     form1.y19.Visible := true;
  if fireData[20].riskLevel >= 1 then
     form1.y20.Visible := true;
  if fireData[21].riskLevel >= 1 then
     form1.y21.Visible := true;
  if fireData[22].riskLevel >= 1 then
     form1.y22.Visible := true;
  if fireData[23].riskLevel >= 1 then
     form1.y23.Visible := true;
  if fireData[24].riskLevel >= 1 then
     form1.y24.Visible := true;
  if fireData[25].riskLevel >= 1 then
     form1.y25.Visible := true;
  if fireData[26].riskLevel >= 1 then
     form1.y26.Visible := true;
  if fireData[27].riskLevel >= 1 then
     form1.y27.Visible := true;
  if fireData[28].riskLevel >= 1 then
     form1.y28.Visible := true;
  if fireData[29].riskLevel >= 1 then
     form1.y29.Visible := true;


  if fireData[0].riskLevel >= 3 then
     form1.orange0.Visible := true;
  if fireData[1].riskLevel >= 3 then
     form1.orange1.Visible := true;
  if fireData[2].riskLevel >= 3 then
     form1.orange3.Visible := true;
  if fireData[3].riskLevel >= 3 then
     form1.orange3.Visible := true;
  if fireData[4].riskLevel >= 3 then
     form1.orange4.Visible := true;
  if fireData[5].riskLevel >= 3 then
     form1.orange5.Visible := true;
  if fireData[6].riskLevel >= 3 then
     form1.orange6.Visible := true;
  if fireData[7].riskLevel >= 3 then
     form1.orange7.Visible := true;
  if fireData[8].riskLevel >= 3 then
     form1.orange8.Visible := true;
  if fireData[9].riskLevel >= 3 then
     form1.orange9.Visible := true;
  if fireData[10].riskLevel >= 3 then
     form1.orange10.Visible := true;
  if fireData[11].riskLevel >= 3 then
     form1.orange11.Visible := true;
  if fireData[12].riskLevel >= 3 then
     form1.orange12.Visible := true;
  if fireData[13].riskLevel >= 3 then
     form1.orange13.Visible := true;
  if fireData[14].riskLevel >= 3 then
     form1.orange14.Visible := true;
  if fireData[15].riskLevel >= 3 then
     form1.orange15.Visible := true;
  if fireData[16].riskLevel >= 3 then
     form1.orange16.Visible := true;
  if fireData[17].riskLevel >= 3 then
     form1.orange17.Visible := true;
  if fireData[18].riskLevel >= 3 then
     form1.orange18.Visible := true;
  if fireData[19].riskLevel >= 3 then
     form1.orange19.Visible := true;
  if fireData[20].riskLevel >= 3 then
     form1.orange20.Visible := true;
  if fireData[21].riskLevel >= 3 then
     form1.orange21.Visible := true;
  if fireData[22].riskLevel >= 3 then
     form1.orange22.Visible := true;
  if fireData[23].riskLevel >= 3 then
     form1.orange23.Visible := true;
  if fireData[24].riskLevel >= 3 then
     form1.orange24.Visible := true;
  if fireData[25].riskLevel >= 3 then
     form1.orange25.Visible := true;
  if fireData[26].riskLevel >= 3 then
     form1.orange26.Visible := true;
  if fireData[27].riskLevel >= 3 then
     form1.orange27.Visible := true;
  if fireData[28].riskLevel >= 3 then
     form1.orange28.Visible := true;
  if fireData[29].riskLevel >= 3 then
     form1.orange29.Visible := true;


 if fireData[0].riskLevel >= 6 then
     form1.red0.Visible := true;
  if fireData[1].riskLevel >= 6 then
     form1.red1.Visible := true;
  if fireData[2].riskLevel >= 6 then
     form1.red3.Visible := true;
  if fireData[3].riskLevel >= 6 then
     form1.red3.Visible := true;
  if fireData[4].riskLevel >= 6 then
     form1.red4.Visible := true;
  if fireData[5].riskLevel >= 6 then
     form1.red5.Visible := true;
  if fireData[6].riskLevel >= 6 then
     form1.red6.Visible := true;
  if fireData[7].riskLevel >= 6 then
     form1.red7.Visible := true;
  if fireData[8].riskLevel >= 6 then
     form1.red8.Visible := true;
  if fireData[9].riskLevel >= 6 then
     form1.red9.Visible := true;
  if fireData[10].riskLevel >= 6 then
     form1.red10.Visible := true;
  if fireData[11].riskLevel >= 6 then
     form1.red11.Visible := true;
  if fireData[12].riskLevel >= 6 then
     form1.red12.Visible := true;
  if fireData[13].riskLevel >= 6 then
     form1.red13.Visible := true;
  if fireData[14].riskLevel >= 6 then
     form1.red14.Visible := true;
  if fireData[15].riskLevel >= 6 then
     form1.red15.Visible := true;
  if fireData[16].riskLevel >= 6 then
     form1.red16.Visible := true;
  if fireData[17].riskLevel >= 6 then
     form1.red17.Visible := true;
  if fireData[18].riskLevel >= 6 then
     form1.red18.Visible := true;
  if fireData[19].riskLevel >= 6 then
     form1.red19.Visible := true;
  if fireData[20].riskLevel >= 6 then
     form1.red20.Visible := true;
  if fireData[21].riskLevel >= 6 then
     form1.red21.Visible := true;
  if fireData[22].riskLevel >= 6 then
     form1.red22.Visible := true;
  if fireData[23].riskLevel >= 6 then
     form1.red23.Visible := true;
  if fireData[24].riskLevel >= 6 then
     form1.red24.Visible := true;
  if fireData[25].riskLevel >= 6 then
     form1.red25.Visible := true;
  if fireData[26].riskLevel >= 6 then
     form1.red26.Visible := true;
  if fireData[27].riskLevel >= 6 then
     form1.red27.Visible := true;
  if fireData[28].riskLevel >= 6 then
     form1.red28.Visible := true;
  if fireData[29].riskLevel >= 6 then
     form1.red29.Visible := true;
end;

procedure clearAllDots;    //make all dots invisible (find shorter method later)
begin
  form1.red0.Visible := false;
  form1.red1.Visible := false;
  form1.red2.Visible := false;
  form1.red3.Visible := false;
  form1.red4.Visible := false;
  form1.red5.Visible := false;
  form1.red6.Visible := false;
  form1.red7.Visible := false;
  form1.red8.Visible := false;
  form1.red9.Visible := false;
  form1.red10.Visible := false;
  form1.red11.Visible := false;
  form1.red12.Visible := false;
  form1.red13.Visible := false;
  form1.red14.Visible := false;
  form1.red15.Visible := false;
  form1.red16.Visible := false;
  form1.red17.Visible := false;
  form1.red18.Visible := false;
  form1.red19.Visible := false;
  form1.red20.Visible := false;
  form1.red21.Visible := false;
  form1.red22.Visible := false;
  form1.red23.Visible := false;
  form1.red24.Visible := false;
  form1.red25.Visible := false;
  form1.red26.Visible := false;
  form1.red27.Visible := false;
  form1.red28.Visible := false;
  form1.red29.Visible := false;

  form1.y0.Visible := false;
  form1.y1.Visible := false;
  form1.y2.Visible := false;
  form1.y3.Visible := false;
  form1.y4.Visible := false;
  form1.y5.Visible := false;
  form1.y6.Visible := false;
  form1.y7.Visible := false;
  form1.y8.Visible := false;
  form1.y9.Visible := false;
  form1.y10.Visible := false;
  form1.y11.Visible := false;
  form1.y12.Visible := false;
  form1.y13.Visible := false;
  form1.y14.Visible := false;
  form1.y15.Visible := false;
  form1.y16.Visible := false;
  form1.y17.Visible := false;
  form1.y18.Visible := false;
  form1.y19.Visible := false;
  form1.y20.Visible := false;
  form1.y21.Visible := false;
  form1.y22.Visible := false;
  form1.y23.Visible := false;
  form1.y24.Visible := false;
  form1.y25.Visible := false;
  form1.y26.Visible := false;
  form1.y27.Visible := false;
  form1.y28.Visible := false;
  form1.y29.Visible := false;

  form1.orange0.Visible := false;
  form1.orange1.Visible := false;
  form1.orange2.Visible := false;
  form1.orange3.Visible := false;
  form1.orange4.Visible := false;
  form1.orange5.Visible := false;
  form1.orange6.Visible := false;
  form1.orange7.Visible := false;
  form1.orange8.Visible := false;
  form1.orange9.Visible := false;
  form1.orange10.Visible := false;
  form1.orange11.Visible := false;
  form1.orange12.Visible := false;
  form1.orange13.Visible := false;
  form1.orange14.Visible := false;
  form1.orange15.Visible := false;
  form1.orange16.Visible := false;
  form1.orange17.Visible := false;
  form1.orange18.Visible := false;
  form1.orange19.Visible := false;
  form1.orange20.Visible := false;
  form1.orange21.Visible := false;
  form1.orange22.Visible := false;
  form1.orange23.Visible := false;
  form1.orange24.Visible := false;
  form1.orange25.Visible := false;
  form1.orange26.Visible := false;
  form1.orange27.Visible := false;
  form1.orange28.Visible := false;
  form1.orange29.Visible := false;

end;

procedure finalDisplay;
var
  t: Integer;
  j: Integer;
begin
assignNeighbours;
  for t := 0 to 29 do
  begin
    for j := 0 to 10 do
    begin
      if adjacency[t,j] = strtoint(form1.edt_test.text) then
      //the number entered into the edit box corrosponds to a region in california
      //e.g. 7 is sacramento
          fireData[t].riskLevel := calculateRisklevel(fireData[t]);
    end;
  end;

  //form1.edt_display.text:= floattostr(firedata[12].temp);
  form1.edt_display.text := floattostr(firedata[18].riskLevel);
  showorange;
end;

procedure clearHome;
begin
  Form1.img_logo.visible := false;
  Form1.lbl_welcome.Visible := false;
  Form1.btn_where.Visible := false;
  Form1.btn_help.Visible := false;
end;

procedure loadHome;
begin
  Form1.img_logo.visible := true;
  Form1.lbl_welcome.Visible := true;
  Form1.btn_where.Visible := true;
  Form1.btn_help.Visible := true;
 // Form1.btn_backf.Visible := true;
 form1.img_info.Visible := true;
end;

procedure clearHelp;
begin
Form1.lbl_help.Visible := false;
Form1.btn_backh.Visible := false;
Form1.btn_share.Visible := false;
Form1.btn_game.Visible := false;
Form1.btn_donate.Visible := false;
end;

procedure loadHelp;
begin
Form1.lbl_help.Visible := true;
Form1.btn_backh.Visible := true;
Form1.btn_share.Visible := true;
Form1.btn_game.Visible := true;
Form1.btn_donate.Visible := true;
Form1.btn_backh.Visible := true;
end;

procedure clearfire;
begin
clearAllDots;
form1.lbl_fire.Visible := false;
form1.btn_backf.Visible := false;
form1.img_firemap.Visible := false;
form1.lbl_location.visible := false;
form1.btn_go.Visible := false;
form1.lbl_location.Visible := false;
form1.edt_test.Visible := false;
form1.edt_display.Visible := false;
form1.lbl_scale.Visible := false;
form1.red.Visible := false;
form1.orange.Visible := false;
form1.yellow.Visible := false;
end;

procedure TForm1.btn_backhClick(Sender: TObject);
begin
clearHelp;
loadHome;
end;

procedure TForm1.btn_donateClick(Sender: TObject);
begin
 lbl_help.Visible := false;
btn_share.Visible := false;
btn_game.Visible := false;
btn_donate.Visible := false;

btn_backd.Visible := true;
btn_backh.Visible := false;
lbl_learn.Visible := true;
lbl_donate.Visible := true;
lbl_link1.Visible := true;
lbl_link2.Visible := true;
lbl_link3.Visible := true;
lbl_link4.Visible := true;
lbl_link5.Visible := true;
end;

procedure TForm1.btn_gameClick(Sender: TObject);
begin
form2.Show;
end;

procedure TForm1.btn_goClick(Sender: TObject);
var
  i: Integer;
begin
sampledata;
clearalldots;
for i := 0 to 29 do
firedata[i].riskLevel := 0;

finalDisplay;
end;

procedure cleardonate;
begin
 form1.btn_backd.Visible := false;
form1.lbl_link1.Visible := false;
form1.lbl_link2.Visible := false;
form1.lbl_link3.Visible := false;
form1.lbl_link4.Visible := false;
form1.lbl_link5.Visible := false;
form1.lbl_donate.Visible := false;
form1.lbl_learn.Visible := false;
end;

procedure TForm1.btn_helpClick(Sender: TObject);
begin
clearhome;
btn_backh.Visible := true;

lbl_help.Visible := true;
btn_share.Visible := true;
btn_game.Visible := true;
btn_donate.Visible := true;

cleardonate;
img_info.Visible := false;

end;


procedure TForm1.btn_infoClick(Sender: TObject);
begin
clearHome;
cleardonate;
clearhelp;
clearfire;
btn_backi.Visible := true;
////////////////////////////////////////////
lbl_mission.Visible := true;
img_infologo.visible := true;
lbl_para.Visible := true;
img_fire.Visible := true;
img_koala.Visible := true;
end;

procedure TForm1.btn_shareClick(Sender: TObject);
var
mems : TMemoryStream;
begin
  save.InitialDir := 'C:\Users\jenni\OneDrive\Pictures\Saved Pictures';
  save.DefaultExt := '.png';
  save.Execute;
if Save.FileName<>'' then
  begin
  mems := TMemoryStream.Create;
  img_share.bitmap.SaveToStream (mems);
  mems.SaveToFile(save.FileName);
  mems.Free;
  end;
end;

procedure TForm1.btn_whereClick(Sender: TObject);
begin
clearhome;
btn_backf.Visible := true;

lbl_fire.Visible := true;
img_firemap.Visible := true;
edt_display.Visible := true;
edt_test.Visible := true;
lbl_location.Visible := true;
btn_go.Visible := true;
form1.lbl_scale.Visible := true;
form1.red.Visible := true;
form1.orange.Visible := true;
form1.yellow.Visible := true;

img_info.Visible := false;

//sampledata;
end;



procedure TForm1.lbl_link1Click(Sender: TObject);
var
  MyLink: string;
begin
  form2.Show;
  MyLink := 'https://www.calfund.org/wildfire-relief-fund/';
//  ShellExecute(Handle , 'open' , PChar(MyLink), nil, nil, SW_SHOW);
end;


procedure TForm1.btn_backfClick(Sender: TObject);
begin

clearfire;
loadHome;

btn_backi.Visible := false;
lbl_mission.Visible := false;
img_infologo.visible := false;
lbl_para.Visible := false;
img_fire.Visible := false;
img_koala.Visible := false;

end;
end.
