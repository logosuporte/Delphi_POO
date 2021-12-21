unit Un_ViewRelFuncionarioAniversario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, RLReport, DB, DBClient, ExtCtrls;

type
  TFr_ViewRelFuncionarioAniversario = class(TForm)
    btnImprimir: TBitBtn;
    btnCancelar: TBitBtn;
    DataSource1: TDataSource;
    Bevel1: TBevel;
    edtDataIni: TMaskEdit;
    edtDataFim: TMaskEdit;
    Label1: TLabel;
    CheckIgnorarData: TCheckBox;
    Label2: TLabel;
    Panel1: TPanel;
    RLReportFuncionarioAniversariantes: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLBand2: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    v: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLBand4: TRLBand;
    RLSystemInfo3: TRLSystemInfo;
    CdsFuncionarios: TClientDataSet;
    RLLabel3: TRLLabel;
    RLBand3: TRLBand;
    RLLabel7: TRLLabel;
    CdsFuncionariosCODIGO: TIntegerField;
    CdsFuncionariosNOME: TStringField;
    CdsFuncionariosANIVERSARIO: TStringField;
    CdsFuncionariosSALARIO: TCurrencyField;
    procedure btnCancelarClick(Sender: TObject);
    procedure RLDBText3BeforePrint(Sender: TObject; var Text: String;
      var PrintIt: Boolean);
    procedure btnImprimirClick(Sender: TObject);
    procedure CheckIgnorarDataClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtDataIniExit(Sender: TObject);
    procedure edtDataFimExit(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function Checadatavalida(pdata:String):Boolean;
  end;

var
  Fr_ViewRelFuncionarioAniversario: TFr_ViewRelFuncionarioAniversario;

implementation

uses  Un_Controller_Funcionario,
  Un_Funcionario, Un_ViewLogin;



{$R *.dfm}

procedure TFr_ViewRelFuncionarioAniversario.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TFr_ViewRelFuncionarioAniversario.RLDBText3BeforePrint(Sender: TObject;
  var Text: String; var PrintIt: Boolean);
begin
 //  Text := 'R$'+formatcurr('##,##0.00', strtocurr(text));
end;

procedure TFr_ViewRelFuncionarioAniversario.btnImprimirClick(Sender: TObject);
var PesquisaFuncionario :TControleFuncionario;
    Funcionario :TFuncionario;
    Wlista:Tlist;
    i: integer;
    wdatainicial, wdatafinal :String;
begin

  PesquisaFuncionario := TControleFuncionario.Create(conexao);
  Funcionario         := TFuncionario.Create();

  if CheckIgnorarData.Checked then
  begin
    wdatainicial  := '01/01';
    wdatafinal    := '30/12';
  end else
  begin
    wdatainicial := edtDataIni.Text;
    wdatafinal   := edtDataFim.Text;
  end;

  Wlista              := PesquisaFuncionario.ListarFuncionariosAniversario(wdatainicial, wdatafinal);

  CdsFuncionarios.Close;
  CdsFuncionarios.CreateDataSet;


  if  Assigned(Wlista) then
  begin
    for I := 0 to Pred(Wlista.Count) do
    begin
      Funcionario                                            :=  Wlista[i];
      CdsFuncionarios.Insert;
      CdsFuncionarios.FieldByName('Codigo').AsInteger        := Funcionario.Codigo;
      CdsFuncionarios.FieldByName('Nome').AsString           := Funcionario.Nome;
      CdsFuncionarios.FieldByName('Salario').AsString        := FormatFloat('0.00',Funcionario.Salario);
      CdsFuncionarios.FieldByName('ANIVERSARIO').AsString    := FormatDateTime('dd/mm',Funcionario.DtNascimento);
      CdsFuncionarios.Post;
    end;
    Wlista.Free;
    RLReportFuncionarioAniversariantes.Preview();
  end else
  begin
    ShowMessage('Funcionario Não Localizado');
  end;
  FreeAndNil(Funcionario);
  FreeAndNil(PesquisaFuncionario);
end;

procedure TFr_ViewRelFuncionarioAniversario.CheckIgnorarDataClick(Sender: TObject);
begin
  edtDataIni.Enabled := not CheckIgnorarData.Checked;
  edtDataFim.Enabled := not CheckIgnorarData.Checked;
end;

procedure TFr_ViewRelFuncionarioAniversario.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end else if Key = #27 then  Close;
end;

function TFr_ViewRelFuncionarioAniversario.Checadatavalida(pdata:String): Boolean;
var wdata:TDate;
begin
  try
    wdata := StrToDate(pdata+'/2000');
    Result := True;
  except
    Result := False;
  end
end;

procedure TFr_ViewRelFuncionarioAniversario.edtDataIniExit(Sender: TObject);
begin
  if not Checadatavalida(edtDataIni.Text) then
  begin
    ShowMessage('Data invalida');
    Self.SetFocus;
  end;
end;

procedure TFr_ViewRelFuncionarioAniversario.edtDataFimExit(Sender: TObject);
begin
  if not Checadatavalida(edtDataFim.Text) then
  begin
    ShowMessage('Data invalida');
    Self.SetFocus;
  end;
end;

end.
