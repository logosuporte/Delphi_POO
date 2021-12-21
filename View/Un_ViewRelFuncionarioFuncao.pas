unit Un_ViewRelFuncionarioFuncao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, RLReport, DB, DBClient;

type
  TFr_ViewRelFuncaionarioFuncao = class(TForm)
    rgOrdemDados: TRadioGroup;
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    DataSource1: TDataSource;
    Panel1: TPanel;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLGroup1: TRLGroup;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    v: TRLBand;
    RLLabel3: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel6: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLBand2: TRLBand;
    RLLabel7: TRLLabel;
    CdsFuncionarios: TClientDataSet;
    CdsFuncionariosCodigo: TIntegerField;
    CdsFuncionariosFuncao: TStringField;
    CdsFuncionariosdataNascimento: TStringField;
    CdsFuncionariosSalario: TStringField;
    CdsFuncionariosNome: TStringField;
    procedure btnImprimirClick(Sender: TObject);
    procedure RLDBText4BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure RLDBText5BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_ViewRelFuncaionarioFuncao: TFr_ViewRelFuncaionarioFuncao;

implementation

uses Un_ViewLogin, Un_controller_conexao, Un_Controller_Funcionario,
  Un_Funcionario;


{$R *.dfm}

procedure TFr_ViewRelFuncaionarioFuncao.btnImprimirClick(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;
    Wlista:Tlist;
    i: integer;
begin
  PesquisaFuncionario := TControleFuncionario.Create(conexao);
  Funcionario         := TFuncionario.Create();
  Wlista              := PesquisaFuncionario.ListarFuncionarios;

    CdsFuncionarios.Close;
  CdsFuncionarios.CreateDataSet;

   if rgOrdemDados.ItemIndex = 0 then
     CdsFuncionarios.IndexFieldNames := 'Funcao;Codigo'
   else
     CdsFuncionarios.IndexFieldNames := 'Funcao;Nome';

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

procedure TFr_ViewRelFuncaionarioFuncao.RLDBText4BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  Text := 'R$'+formatcurr('##,##0.00', strtocurr(text));
end;

procedure TFr_ViewRelFuncaionarioFuncao.RLDBText5BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
  text := FormatDateTime('DD/MM',StrToDate(text));
end;

procedure TFr_ViewRelFuncaionarioFuncao.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TFr_ViewRelFuncaionarioFuncao.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then Close;  
end;

end.
