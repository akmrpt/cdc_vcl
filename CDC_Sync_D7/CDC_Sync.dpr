program CDC_Sync;

uses
  Forms,
  Unit_Index in 'Unit_Index.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
