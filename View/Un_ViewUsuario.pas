unit Un_ViewUsuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Un_ViewCadastro, StdCtrls, ExtCtrls, IdCoder, IdCoder3to4,
  IdCoderMIME, IdBaseComponent, ComCtrls;

type
  TFr_ViewUsuario = class(TFr_ViewCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditCodigo: TEdit;
    EditNome: TEdit;
    EditSenha: TEdit;
    IdEncoderMIME1: TIdEncoderMIME;
    IdDecoderMIME1: TIdDecoderMIME;
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_ViewUsuario: TFr_ViewUsuario;

implementation

uses Un_ViewFuncao, Un_Controller_Usuario, Un_Usuario, Un_ViewLogin;

{$R *.dfm}

procedure TFr_ViewUsuario.Button6Click(Sender: TObject);
var PesquisaUsuario :TControleUsuario;
    wUsuario :TUsuario;
begin
  inherited;
  PesquisaUsuario  := TControleUsuario.Create(conexao);
  wUsuario         := TUsuario.Create();
  wUsuario         := PesquisaUsuario.Pesquisa(Edt_Pesquisa.Text);

  if  Assigned(wUsuario) then
  begin
    EditCodigo.Text := IntToStr(wUsuario.Codigo);
    Editnome.Text   := wUsuario.Nome;
    EditSenha.Text  := IdDecoderMIME1.DecodeString (trim(wUsuario.Senha));

  end else
  begin
    ShowMessage('Usuário Não Localizado');
    Edt_Pesquisa.SetFocus;
    LimparCampo(Fr_ViewUsuario);
  end;

  FreeAndNil(PesquisaUsuario);
  FreeAndNil(wUsuario);
end;
procedure TFr_ViewUsuario.Button1Click(Sender: TObject);
var PesquisaUsuario :TControleUsuario;
    wUsuario :TUsuario;

begin
  if (EditCodigo.Text = emptystr) and (EditNome.Text <> EmptyStr) then
  begin

    PesquisaUsuario := TControleUsuario.Create(conexao );
    wUsuario        := TUsuario.Create();

    wUsuario.Nome  := EditNome.Text;
    wUsuario.Senha := IdEncoderMIME1.Encode(trim(EditSenha.Text));

    if PesquisaUsuario.inseri(wUsuario) then
      ShowMessage('Usuario inserido com sucesso!')
    else
       ShowMessage('Erro ao inserir Usuario');

     inherited;
    FreeAndNil(PesquisaUsuario);
    FreeAndNil(wUsuario);
  end else ShowMessage('Impossível inserir!');
end;

procedure TFr_ViewUsuario.Button4Click(Sender: TObject);
begin
  inherited;
  EditNome.SetFocus
end;

procedure TFr_ViewUsuario.Button2Click(Sender: TObject);
var PesquisaUsuario :TControleUsuario;
    wUsuario :TUsuario;
begin

 if EditCodigo.Text <> emptystr then
  begin

  PesquisaUsuario := TControleUsuario.Create(conexao );
  wUsuario        := TUsuario.Create();

  wUsuario.Codigo := StrToInt(EditCodigo.Text);
  wUsuario.Nome   := EditNome.Text;
  wUsuario.Senha  := IdEncoderMIME1.Encode(trim(EditSenha.Text));

  if PesquisaUsuario.Altera(wUsuario) then
    ShowMessage('Usuario alterado com sucesso!')
  else
     ShowMessage('Erro ao alterar o Usuario');

   inherited;
    FreeAndNil(PesquisaUsuario);
    FreeAndNil(wUsuario);
  end else ShowMessage('Impossível Alterar o registro!');
    inherited;
end;

procedure TFr_ViewUsuario.Button3Click(Sender: TObject);
var PesquisaUsuario :TControleUsuario;
begin

  if EditCodigo.Text <> emptystr then
  begin
    PesquisaUsuario       := TControleUsuario.Create(conexao );

    if PesquisaUsuario.Exclui(StrToInt(EditCodigo.text)) then
      ShowMessage('Usuario deletado com sucesso!')
    else
       ShowMessage('Erro ao deletar o Ususario');

    inherited;
    FreeAndNil(PesquisaUsuario);
  end else  ShowMessage('Impossível Deletar o registro!');end;

end.
