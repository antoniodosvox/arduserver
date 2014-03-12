program arduServer;

uses
  Forms,
  arduMain in 'arduMain.pas' {Form1},
  arduAbout in 'arduAbout.pas' {AboutBox};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;
end.
