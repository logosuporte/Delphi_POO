unit Un_ViewFuncao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Un_ViewCadastro, StdCtrls, ExtCtrls;

type
  TFr_ViewFuncao = class(TFr_ViewCadastro)
    EditCodigo: TEdit;
    EditDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_ViewFuncao: TFr_ViewFuncao;

implementation

uses Un_Controller_Funcao, Un_Funcao, Un_controller_conexao,Un_Viewlogin;

{$R *.dfm}

procedure TFr_ViewFuncao.Button6Click(Sender: TObject);
var PesquisaFuncao :TControleFuncao;
    wfuncao :TFuncao;
begin
  inherited;
  PesquisaFuncao := TControleFuncao.Create(conexao);
  wfuncao        := TFuncao.Create();
  wfuncao        := PesquisaFuncao.Pesquisa(Edt_Pesquisa.Text);

  if  Assigned(wfuncao) then
  begin
    EditCodigo.Text    := IntToStr(wfuncao.Codigo);
    EditDescricao.Text := wfuncao.Descricao;
  end else
  begin
    ShowMessage('Função Não Localizado');
    Edt_Pesquisa.SetFocus;
    LimparCampo(Fr_ViewFuncao);
  end;

  FreeAndNil(wfuncao);
  FreeAndNil(PesquisaFuncao);
end;

procedure TFr_ViewFuncao.Button1Click(Sender: TObject);
var PesquisaFuncao :TControleFuncao;
    wfuncao :TFuncao;
begin
  if (EditCodigo.Text = emptystr) and (EditDescricao.Text <> EmptyStr) then
  begin
    PesquisaFuncao := TControleFuncao.Create(conexao );
    wfuncao    := TFuncao.Create();

    wfuncao.Descricao := EditDescricao.Text;

    if PesquisaFuncao.inseri(wfuncao) then
      ShowMessage('Funcao inserida com sucesso!')
    else
       ShowMessage('Erro ao inserir funcao');

     inherited;
    FreeAndNil(PesquisaFuncao);
  end else ShowMessage('Impossível inserir!');
end;
procedure TFr_ViewFuncao.Button2Click(Sender: TObject);
var PesquisaFuncao :TControleFuncao;
    wfuncao :TFuncao;
begin
 if EditCodigo.Text <> emptystr then
  begin
  PesquisaFuncao := TControleFuncao.Create(conexao );
  wfuncao        := TFuncao.Create();

  wfuncao.Codigo    := StrToInt(EditCodigo.Text);
  wfuncao.Descricao := EditDescricao.Text;

  if PesquisaFuncao.Altera(wfuncao) then
    ShowMessage('Funcão alterado com sucesso!')
  else
     ShowMessage('Erro ao alterar o função');

   inherited;

   FreeAndNil(PesquisaFuncao);
  end else ShowMessage('Impossível Alterar o registro!');

end;
procedure TFr_ViewFuncao.Button4Click(Sender: TObject);

begin
  inherited;
  EditDescricao.SetFocus;
end;

procedure TFr_ViewFuncao.Button3Click(Sender: TObject);
var PesquisaFuncao :TControleFuncao;
begin

  if EditCodigo.Text <> emptystr then
  begin
    PesquisaFuncao := TControleFuncao.Create(conexao );

    if PesquisaFuncao.Exclui(StrToInt(EditCodigo.text)) then
      ShowMessage('Funcao deletado com sucesso!')
    else
       ShowMessage('Erro ao deletar o funcao');

    inherited;
    FreeAndNil(PesquisaFuncao);
  end else  ShowMessage('Impossível Deletar o registro!');

end;
end.
