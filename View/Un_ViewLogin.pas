unit Un_ViewLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdCoder, IdCoder3to4, IdCoderMIME,Un_controller_conexao,
  ComCtrls;

type
  TFr_Login = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EditNome: TEdit;
    EditSenha: TEdit;
    Button1: TButton;
    IdEncoderMIME1: TIdEncoderMIME;
    StatusBar1: TStatusBar;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_Login: TFr_Login;
  conexao :TControle;
implementation

uses Math, Un_Controller_Usuario,  Un_Principal;

{$R *.dfm}

procedure TFr_Login.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end else
  if Key = #27 then
  begin
     Application.Terminate
  end;
end;

procedure TFr_Login.Button1Click(Sender: TObject);
var Usuario :TControleUsuario;
begin
  if (EditNome.Text <> EmptyStr) and  (EditSenha.Text <> EmptyStr) then
  begin
    Usuario := TControleUsuario.Create(conexao);
    EditSenha.Text := IdEncoderMIME1.Encode(trim(EditSenha.Text));
    if Usuario.Login(EditNome.Text,EditSenha.Text) then
       ShowMessage('Usuario e/ou senha invalidos!') else
    begin
      FreeAndNil(Usuario);
      Application.CreateForm(TFr_Principal,Fr_Principal);
      Fr_Principal.ShowModal;
      FreeAndNil(Fr_Principal);
      Application.Terminate;
    end;
  end
  else ShowMessage('Informe o Usuario e senha, por favor"!');
end;

procedure TFr_Login.FormCreate(Sender: TObject);
begin
  conexao := TControle.Create;
end;

procedure TFr_Login.FormDestroy(Sender: TObject);
begin
  FreeAndNil(conexao);
end;

end.
