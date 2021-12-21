unit Un_ViewCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ComCtrls;

type
  TFr_ViewCadastro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel4: TPanel;
    Label13: TLabel;
    Button6: TButton;
    StaticText1: TStaticText;
    Edt_Pesquisa: TEdit;
    StatusBar1: TStatusBar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparCampo(pnomeform:TForm);
  end;

var
  Fr_ViewCadastro: TFr_ViewCadastro;

implementation

{$R *.dfm}

procedure TFr_ViewCadastro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end else
  if Key = #27 then  Close;
end;



procedure TFr_ViewCadastro.Button6Click(Sender: TObject);
var Numero:integer;
begin
  try
    Numero := StrToInt(Edt_Pesquisa.Text);
  except
    raise Exception.Create('Digite apenas numero no campo de pesquisa');
    Edt_Pesquisa.SetFocus;
    Edt_Pesquisa.SelectAll;
  end


end;

procedure TFr_ViewCadastro.LimparCampo(pnomeform:TForm);
var i : integer;
begin
  for i := pnomeform.ComponentCount -1 downto 0 do
  begin
    if (pnomeform.Components[i] is TEdit) then
     (pnomeform.Components[i] as TEdit).text := '' else
    if (pnomeform.Components[i] is TMaskEdit) then
     (pnomeform.Components[i] as TMaskEdit).text := '';
  end;
  Edt_Pesquisa.SetFocus;
end;

procedure TFr_ViewCadastro.Button1Click(Sender: TObject);
begin
  LimparCampo(Self);
end;

procedure TFr_ViewCadastro.Button2Click(Sender: TObject);
begin
LimparCampo(Self);
end;

procedure TFr_ViewCadastro.Button3Click(Sender: TObject);
begin
LimparCampo(Self);
end;

procedure TFr_ViewCadastro.Button4Click(Sender: TObject);
begin
  LimparCampo(Self);
end;

end.
