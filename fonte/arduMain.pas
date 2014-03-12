{----------------------------------------------------------------------}
{  Emulador de teclado, usando Arduíno e teclado de 16 teclas          }
{  Autor: Antonio Borges                                               }
{  Driver: por Antonio Borges e Alexandre Miloski                      }
{  Em 23/01/2014                                                       }
{----------------------------------------------------------------------}

unit arduMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TForm1 = class(TForm)
    rg_portas: TRadioGroup;
    Timer1: TTimer;
    Memo1: TMemo;
    b_ativar: TButton;
    cb_transmitir: TCheckBox;
    b_desativar: TButton;
    cb_enviaEnter: TCheckBox;
    cb_number: TCheckBox;
    cb_asterisco: TCheckBox;
    SpeedButton1: TSpeedButton;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure b_ativarClick(Sender: TObject);
    procedure b_desativarClick(Sender: TObject);
    procedure cb_transmitirClick(Sender: TObject);
    procedure cb_enviaEnterClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


uses
    dvcomm, dvmacro, arduAbout;

var s: string;
    debugando: boolean;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin
    rg_portas.Items.Clear;
    for i := 1 to 8 do
        if dvcomm.inicLink(i, 9600, 8, 1, 0) = 0 then
            begin
                rg_portas.Items.add ('COM'+intToStr(i));
                rg_portas.ItemIndex := i-1;
                dvcomm.finalLink;
            end;

    cb_enviaEnterClick(Sender);
end;

procedure TForm1.b_ativarClick(Sender: TObject);
var sel: string;
begin
    sel := rg_portas.Items[rg_portas.ItemIndex];
    delete (sel, 1, 3);
    dvcomm.inicLink(strToInt(sel), 9600, 8, 1, 0);
    b_ativar.Enabled := false;
    b_desativar.Enabled := true;
    timer1.enabled := true;
    rg_portas.Enabled := false;
end;

procedure TForm1.b_desativarClick(Sender: TObject);
begin
    timer1.enabled := false;
    dvcomm.finalLink;
    b_desativar.Enabled := false;
    b_ativar.Enabled := true;
    rg_portas.Enabled := true;
end;

procedure TForm1.cb_transmitirClick(Sender: TObject);
begin
    debugando := not cb_transmitir.Checked;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
    i: integer;
    c: char;
begin
    while dvcomm.chegouLink do
        begin
            dvcomm.leLink(c);
            if (c <> #$0d) and (c <> #$0a) then
                s := s + c;
            if c = #$0a then break;
        end;

    if s <> '' then
        begin
            if not debugando then
                begin
                     for i := 1 to length(s) do
                         if cb_number.Checked and (s[i] = '#') then
                             dvmacro.keyboardVirtKey (VK_RETURN, false, false, false, 500)
                         else
                         if cb_asterisco.Checked and (s[i] = '*') then
                             dvmacro.keyboardVirtKey (VK_ESCAPE, false, false, false, 500)
                         else
                             dvmacro.keyboardChar(s[i], 500);

                     if cb_enviaEnter.Checked then
                         dvmacro.keyboardVirtKey (VK_RETURN, false, false, false, 500);
                end;
            memo1.Lines.Add(s);
            s := '';
        end;
end;


procedure TForm1.cb_enviaEnterClick(Sender: TObject);
begin
    cb_number.enabled := not cb_enviaEnter.Checked;
    cb_asterisco.enabled := not cb_enviaEnter.Checked;
    cb_asterisco.Checked :=  cb_asterisco.enabled;
    cb_number.Checked :=  cb_number.enabled;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
    arduabout.AboutBox.showModal;
end;

end.
