unit Un_ViewRelfuncionarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, RLReport, DBClient;

type
  TFr_ViewRelFuncionario = class(TForm)
    rgOrdemDados: TRadioGroup;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    DataSource1: TDataSource;
    CdsFuncionarios: TClientDataSet;
    CdsFuncionariosCodigo: TIntegerField;
    CdsFuncionariosFuncao: TStringField;
    CdsFuncionariosdataNascimento: TStringField;
    CdsFuncionariosSalario: TStringField;
    Panel1: TPanel;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    CdsFuncionariosNome: TStringField;
    RLBand4: TRLBand;
    RLLabel7: TRLLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLDBText4BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBText5BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_ViewRelFuncionario: TFr_ViewRelFuncionario;

implementation

uses Un_ViewFucionario,
  Un_Controller_Funcionario, Un_Funcionario, Un_ViewLogin;


{$R *.dfm}

procedure TFr_ViewRelFuncionario.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFr_ViewRelFuncionario.btnImprimirClick(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;
    Wlista:Tlist;
    i: integer;
begin
  inherited;
  PesquisaFuncionario := TControleFuncionario.Create(conexao);
  Funcionario         := TFuncionario.Create();
  Wlista              := PesquisaFuncionario.ListarFuncionarios;

    CdsFuncionarios.Close;
  CdsFuncionarios.CreateDataSet;

   if rgOrdemDados.ItemIndex = 0 then
     CdsFuncionarios.IndexFieldNames := 'Codigo'
   else
     CdsFuncionarios.IndexFieldNames := 'Nome';

  if  Assigned(Wlista) then
  begin
    for I := 0 to Pred(Wlista.Count) do
    begin
      Funcionario                                            :=  Wlista[i];
      CdsFuncionarios.Insert;
      CdsFuncionarios.FieldByName('Codigo').AsInteger        := Funcionario.Codigo;
      CdsFuncionarios.FieldByName('Nome').AsString           := Funcionario.Nome;
      CdsFuncionarios.FieldByName('Funcao').AsString         := IntToStr(Funcionario.Funcao)+'-' +Funcionario.DESCRICAOFUNCAO;
      CdsFuncionarios.FieldByName('Salario').AsString        := FormatFloat('0.00',Funcionario.Salario);
      CdsFuncionarios.FieldByName('dataNascimento').AsString := FormatDateTime('dd/mm/yyy',Funcionario.DtNascimento);
      CdsFuncionarios.Post;
    end;
   Wlista.Free;
   RLReport1.Preview();
  end else
  begin
    ShowMessage('Funcionario Não Localizado');
  end;

  FreeAndNil(Funcionario);
  FreeAndNil(PesquisaFuncionario);
end;

procedure TFr_ViewRelFuncionario.RLDBText4BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Text := 'R$'+formatcurr('##,##0.00', strtocurr(text));
end;

procedure TFr_ViewRelFuncionario.RLDBText5BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  text := FormatDateTime('DD/MM',StrToDate(text));
end;

procedure TFr_ViewRelFuncionario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then  Close;
end;

end.
