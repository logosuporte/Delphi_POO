unit Un_ViewListarFuncoes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Buttons;

type
  TFr_ViewListaFuncoes = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    StaticText1: TStaticText;
    Edt_Pesquisa: TEdit;
    ListViewExemplo: TListView;
    procedure ListViewExemploDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
    //function ListaFuncoes(PLista:TList):TList ;
     CodigoFuncao:Integer;
    procedure LimparGrid;
    procedure BuscarTudo;
  end;

var
  Fr_ViewListaFuncoes: TFr_ViewListaFuncoes;

implementation

uses Un_ViewFuncao, Un_conexao, Un_controller_conexao,
  Un_Controller_Funcao, Un_Funcao, Un_ViewLogin;

{$R *.dfm}

procedure TFr_ViewListaFuncoes.BuscarTudo;
var PesquisaFuncao :TControleFuncao;
    wfuncao :TFuncao;
    Item: TListItem;
    Wlista:Tlist;
    i: integer;
begin
  inherited;
  PesquisaFuncao  := TControleFuncao.Create(conexao);
  wfuncao         := TFuncao.Create();
  Wlista          := TList.Create;
  Wlista          := PesquisaFuncao.ListaFuncoes();
  LimparGrid;
  if  Assigned(Wlista) then
  begin
    for I := 0 to Pred(Wlista.Count) do
    begin
      Item := ListViewExemplo.Items.Add;
      wfuncao         :=  Wlista[i];

      Item.Caption := inttostr(wfuncao.Codigo);

      Item.SubItems.Add(wfuncao.Descricao);
    end;
   end else
  begin
    ShowMessage('Função Não Localizada');
    Edt_Pesquisa.SetFocus;
  end;

end;

procedure TFr_ViewListaFuncoes.LimparGrid;
var I, wvalor:integer;
begin
  while ListViewExemplo.Items.Count >= 1  do
    ListViewExemplo.Items.Delete(0);
end;

procedure TFr_ViewListaFuncoes.ListViewExemploDblClick(Sender: TObject);
begin
  CodigoFuncao := StrToInt(ListViewExemplo.ItemFocused.Caption);
  Close;
end;

procedure TFr_ViewListaFuncoes.FormShow(Sender: TObject);
begin
  BuscarTudo;
end;

procedure TFr_ViewListaFuncoes.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #27 then  Close;
end;

end.

