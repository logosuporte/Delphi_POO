unit Un_ViewFucionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Un_ViewCadastro, StdCtrls, ExtCtrls, Mask, ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFr_ViewCadastroFuncionario = class(TFr_ViewCadastro)
    EditCodigo: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    EdtdtaNascimento: TMaskEdit;
    Button5: TButton;
    EditCep: TEdit;
    IdHTTP1: TIdHTTP;
    EditComplemento: TEdit;
    EditNumero: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    EditLagradouro: TEdit;
    EditBairro: TEdit;
    EditCidade: TEdit;
    EditUF: TEdit;
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidarCampos():Boolean;

  end;

var
  Fr_ViewCadastroFuncionario: TFr_ViewCadastroFuncionario;

implementation

uses Un_Controller_Funcionario, Un_Funcionario,
  Un_ViewListarFuncoes, Un_ViewLogin;

{$R *.dfm}

procedure TFr_ViewCadastroFuncionario.Button6Click(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;
begin
  inherited;
  PesquisaFuncionario    := TControleFuncionario.Create(conexao);
  Funcionario            := TFuncionario.Create();
  Funcionario            := PesquisaFuncionario.Pesquisa(Edt_Pesquisa.Text);

  if  Assigned(Funcionario) then
  begin
    EditCodigo.Text        := IntToStr(Funcionario.Codigo);
    Edit3.Text             := Funcionario.Nome;
    EdtdtaNascimento.Text  := DateToStr(Funcionario.DtNascimento);
    Edit4.Text             :=  FormatCurr('#0.00',Funcionario.Salario);
    Edit6.Text             := IntToStr(Funcionario.Funcao);

    EditCep.Text         := IntToStr(Funcionario.CEP);
    EditComplemento.Text := Funcionario.COMPLEMENTO;
    EditNumero.Text      := IntToStr(Funcionario.NUMERO);

   EditLagradouro.text := Funcionario.LAGRADOURO;
   EditBairro.text     := Funcionario.BAIRRO;
   EditCidade.text     := Funcionario.CIDADE;
   EditUF.text         := Funcionario.UF;
  end else
  begin
    ShowMessage('Funcionario Não Localizado');
    Edt_Pesquisa.SetFocus;
    LimparCampo(Fr_ViewCadastroFuncionario);
  end;

  FreeAndNil(Funcionario);
  FreeAndNil(PesquisaFuncionario);
end;

procedure TFr_ViewCadastroFuncionario.Button1Click(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;
begin
  if (EditCodigo.Text = emptystr) and (ValidarCampos()) then
  begin
    PesquisaFuncionario  := TControleFuncionario.Create(conexao);
    Funcionario          := TFuncionario.Create();

    with Funcionario do
    begin
      Nome           := Edit3.Text;
      DtNascimento   := StrToDate(EdtdtaNascimento.Text);
      Salario        := StrToCurr(Edit4.Text);
      Funcao         := StrToInt(Edit6.Text);
      CEP            := StrToInt(EditCep.Text);
      NUMERO         := StrToInt(EditNumero.Text);
      COMPLEMENTO    := (EditComplemento.Text);
      BAIRRO         := (EditBairro.Text);
      UF             := (EditUF.Text);
      LAGRADOURO     := (EditLagradouro.Text);
      CIDADE         := (EditCidade.Text);
    end;

    if PesquisaFuncionario.inseri(Funcionario) then
      ShowMessage('Funcionario inserido com sucesso!')
    else
       ShowMessage('Erro ao inserir funcionario');

     inherited;
  end else ShowMessage('Registro ja consta na base de dados!');

  FreeAndNil(Funcionario);
  FreeAndNil(PesquisaFuncionario);
end;

procedure TFr_ViewCadastroFuncionario.Button2Click(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;
begin
 if EditCodigo.Text <> emptystr then
  begin


  PesquisaFuncionario  := TControleFuncionario.Create(conexao );
  Funcionario          := TFuncionario.Create();

  with Funcionario do
  begin
    Codigo         := StrToInt(EditCodigo.Text);
    Nome           := Edit3.Text;
    DtNascimento   := StrToDate(EdtdtaNascimento.Text);
    Salario        := StrToCurr(Edit4.Text);
    Funcao         := StrToInt(Edit6.Text);
    CEP            := StrToInt(EditCep.Text);
    NUMERO         := StrToInt(EditNumero.Text);
    COMPLEMENTO    := (EditComplemento.Text);
    BAIRRO         := (EditBairro.Text);
    UF             := (EditUF.Text);
    LAGRADOURO     := (EditLagradouro.Text);
    CIDADE         := (EditCidade.Text);
   end;
  //Funcionario            :=
  if PesquisaFuncionario.Altera(Funcionario) then
    ShowMessage('Funcionario alterado com sucesso!')
  else
     ShowMessage('Erro ao alterar o funcionario');

   inherited;
  end else ShowMessage('Impossível Alterar o registro!');

  FreeAndNil(Funcionario);
  FreeAndNil(PesquisaFuncionario);
end;

procedure TFr_ViewCadastroFuncionario.Button3Click(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;

begin
  if EditCodigo.Text <> emptystr then
  begin

    PesquisaFuncionario  := TControleFuncionario.Create(conexao );

    if PesquisaFuncionario.Exclui(StrToInt(EditCodigo.text)) then
      ShowMessage('Funcionario deletado com sucesso!')
    else
       ShowMessage('Erro ao deletar o funcionario');

    inherited;
  end else  ShowMessage('Impossível Deletar o registro!');

  FreeAndNil(Funcionario);
  FreeAndNil(PesquisaFuncionario)
end;

procedure TFr_ViewCadastroFuncionario.Button4Click(Sender: TObject);
begin
   inherited;
   Edit3.SetFocus;
end;

function TFr_ViewCadastroFuncionario.ValidarCampos():Boolean;
begin
  Result := True;
  if  (Edit3.Text = EmptyStr) or
      (Edit4.Text = EmptyStr) or
      (EdtdtaNascimento.Text = EmptyStr) or
      (Edit6.Text = EmptyStr) then
    Result := False;
end;

procedure TFr_ViewCadastroFuncionario.Button5Click(Sender: TObject);
var
  lodados: TStringList;
begin
  lodados             := TStringList.Create;
  lodados.text        := StringReplace(idhttp1.URL.URLDecode(idhttp1.Get('http://republicavirtual.com.br/web_cep.php?cep='+EditCep.text+'&formato=query_string')),'&',#13#10,[rfreplaceAll]);
  EditLagradouro.text := lodados.Values['TIPO_LOGRADOURO']+' '+lodados.Values['LOGRADOURO'];
  EditBairro.text     := lodados.Values['BAIRRO'];
  EditCidade.text     := lodados.Values['CIDADE'];
  EditUF.text         := lodados.Values['UF'];
  lodados.Free;
  EditNumero.SetFocus;
end;

procedure TFr_ViewCadastroFuncionario.Edit4Exit(Sender: TObject);
begin
  inherited;
if Trim(Edit4.Text) <> EmptyStr then
    Edit4.Text := FormatCurr('#0.00',StrToFloat(Edit4.text));
end;

procedure TFr_ViewCadastroFuncionario.Edit6Exit(Sender: TObject);
begin
  inherited;
  if Self.Text = EmptyStr then
  begin
    Application.CreateForm(TFr_ViewListaFuncoes,Fr_ViewListaFuncoes);
    Fr_ViewListaFuncoes.ShowModal;
    Edit6.Text := IntToStr(Fr_ViewListaFuncoes.CodigoFuncao);
    FreeAndNil(Fr_ViewListaFuncoes);
  end;
end;

end.
