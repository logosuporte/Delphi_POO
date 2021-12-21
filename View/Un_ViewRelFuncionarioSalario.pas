unit Un_ViewRelFuncionarioSalario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, RLReport, DB, ExtCtrls, DBClient;

type
  TFr_ViewRelFuncionarioSalario = class(TForm)
    btnVisualizar: TBitBtn;
    btnCancelar: TBitBtn;
    DataSource1: TDataSource;
    Bevel1: TBevel;
    CkheckIgnorarSalario: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    RLReportFuncionariosalario: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel3: TRLLabel;
    CdsFuncionarios: TClientDataSet;
    CdsFuncionariosCodigo: TIntegerField;
    CdsFuncionariosNome: TStringField;
    CdsFuncionariosSalario: TCurrencyField;
    RLLabel5: TRLLabel;
    RLBand5: TRLBand;
    RLLabel7: TRLLabel;
    edtValorIni: TEdit;
    edtValorFinal: TEdit;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure CkheckIgnorarSalarioClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorIniExit(Sender: TObject);
    procedure edtValorFinalExit(Sender: TObject);
    procedure edtValorIniKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorFinalKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_ViewRelFuncionarioSalario: TFr_ViewRelFuncionarioSalario;

implementation

uses Un_Funcionario, Un_ViewLogin, Un_Controller_Funcionario;


{$R *.dfm}

procedure TFr_ViewRelFuncionarioSalario.btnVisualizarClick(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;
    Wlista:Tlist;
    i: integer;
    wsalinicial,wsalfinal: Currency;
begin
  PesquisaFuncionario := TControleFuncionario.Create(conexao);
  Funcionario         := TFuncionario.Create();

  wsalinicial :=  StrToCurr(Stringreplace(Copy(edtValorIni.Text,0,Length(edtValorIni.Text)-3),'.','',[rfReplaceall]));
  wsalfinal   :=  StrToCurr(Stringreplace(Copy(edtValorFinal.Text,0,Length(edtValorFinal.Text)-3),'.','',[rfReplaceall]));

  if not (CkheckIgnorarSalario.Checked) then
  if (wsalinicial = 0) or (wsalfinal = 0) then
  begin
    ShowMessage('Informe um valor salarial!');
    edtValorIni.SetFocus;
    Exit;
  end;

  Wlista              := PesquisaFuncionario.ListarFuncionariosSalario(wsalinicial, wsalfinal);

  CdsFuncionarios.Close;
  CdsFuncionarios.CreateDataSet;
  //CdsFuncionarios.IndexFieldNames := 'Salario';

  if  Assigned(Wlista) then
  begin

    for I := 0 to Pred(Wlista.Count) do
    begin
      Funcionario                                            :=  Wlista[i];
      CdsFuncionarios.Insert;
      CdsFuncionarios.FieldByName('Codigo').AsInteger        := Funcionario.Codigo;
      CdsFuncionarios.FieldByName('Nome').AsString           := Funcionario.Nome;
      CdsFuncionarios.FieldByName('Salario').AsString        := FormatFloat('0.00',Funcionario.Salario);
      CdsFuncionarios.Post;
    end;
    Wlista.Free;
    RLReportFuncionariosalario.Preview();
  end else
  begin
    ShowMessage('Funcionario Não Localizado');
  end;
  FreeAndNil(Funcionario);
  FreeAndNil(PesquisaFuncionario);
end;

procedure TFr_ViewRelFuncionarioSalario.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFr_ViewRelFuncionarioSalario.CkheckIgnorarSalarioClick(Sender: TObject);
begin
  edtValorIni.Text      := '0,00';
  edtValorFinal.Text    := '0,00';
  edtValorIni.Enabled   := not CkheckIgnorarSalario.Checked;
  edtValorFinal.Enabled := not CkheckIgnorarSalario.Checked;
end;

procedure TFr_ViewRelFuncionarioSalario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end else if Key = #27 then  Close;
end;

procedure TFr_ViewRelFuncionarioSalario.edtValorIniExit(Sender: TObject);
begin
  if Trim(edtValorIni.Text) <> EmptyStr then
  try
    edtValorIni.Text := FormatCurr('###,###,##0.00',StrToCurr(edtValorIni.Text))
  except
    edtValorIni.Text := (Stringreplace(Copy(edtValorIni.Text,0,Length(edtValorIni.Text)-3),'.','',[rfReplaceall]));
    edtValorIni.Text := FormatCurr('###,###,##0.00',StrToCurr(edtValorIni.Text))
  end;
end;

procedure TFr_ViewRelFuncionarioSalario.edtValorFinalExit(Sender: TObject);
begin
  if Trim(edtValorFinal.Text) <> EmptyStr then
  try
    edtValorFinal.Text := FormatCurr('###,###,##0.00',StrToCurr(edtValorFinal.Text))
  except
    edtValorFinal.Text := (Stringreplace(Copy(edtValorFinal.Text,0,Length(edtValorFinal.Text)-3),'.','',[rfReplaceall]));
    edtValorIni.Text   := FormatCurr('###,###,##0.00',StrToCurr(edtValorIni.Text))
  end;
end;

procedure TFr_ViewRelFuncionarioSalario.edtValorIniKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '¬'])  then
    if not (key =  #8) then
    key :=  #0;
end;

procedure TFr_ViewRelFuncionarioSalario.edtValorFinalKeyPress(
  Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', '¬'])  then
    if not (key =  #8) then
    key :=  #0;
end;

end.
