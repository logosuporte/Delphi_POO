unit Un_ViewRelFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, DB, RLReport,IBQuery, DBClient,
  Grids, DBGrids ;

type
  TFr_ViewRelFuncoes = class(TForm)
    BtnImprimir: TBitBtn;
    rgOrdemDados: TRadioGroup;
    btnFechar: TBitBtn;
    dsRelatorio: TDataSource;
    Panel1: TPanel;
    RLReportFuncoes: TRLReport;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand3: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLBand4: TRLBand;
    RLLabel4: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    DBGrid1: TDBGrid;
    ListaFuncao: TClientDataSet;
    ListaFuncaocodigo: TIntegerField;
    ListaFuncaoDescricao: TStringField;
    procedure BtnImprimirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fr_ViewRelFuncoes: TFr_ViewRelFuncoes;

implementation

uses Un_Controller_Funcao, Un_Funcao,
  Un_ViewLogin;



{$R *.dfm}

procedure TFr_ViewRelFuncoes.BtnImprimirClick(Sender: TObject);
var PesquisaFuncao :TControleFuncao;
    wfuncao :TFuncao;
    Wlista:Tlist;
    i: integer;
begin
  inherited;

  PesquisaFuncao  := TControleFuncao.Create(conexao);

  Wlista          := TList.Create;
  Wlista          := PesquisaFuncao.ListaFuncoes();

  LISTAFUNCAO.Close;
  LISTAFUNCAO.CreateDataSet;

  if rgOrdemDados.ItemIndex = 0 then
     LISTAFUNCAO.IndexFieldNames := 'Codigo'
  else
    LISTAFUNCAO.IndexFieldNames := 'Descricao';

  wfuncao         := TFuncao.Create();
  if  Assigned(Wlista) then
  begin
    for I := 0 to Pred(Wlista.Count) do
    begin
      wfuncao         :=  Wlista[i];
      LISTAFUNCAO.Insert;
      LISTAFUNCAO.FieldByName('Codigo').AsInteger   := wfuncao.Codigo;
      LISTAFUNCAO.FieldByName('Descricao').AsString := wfuncao.Descricao;
      LISTAFUNCAO.Post;
    end;
    Wlista.Free;
    RLReportFuncoes.Preview();
   end else
  begin
    ShowMessage('Função Não Localizada');
    Exit;
  end;
  FreeAndNil(wfuncao);
  FreeAndNil(PesquisaFuncao);
end;

procedure TFr_ViewRelFuncoes.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFr_ViewRelFuncoes.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #27 then  Close;
end;

end.
