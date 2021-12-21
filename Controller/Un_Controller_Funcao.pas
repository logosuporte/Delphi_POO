unit Un_Controller_Funcao;
interface
uses Un_controller_conexao, SysUtils, DB, Un_Funcao,Classes,IBQuery;

Type TControleFuncao = class
  private
    Fcontrole :TControle;
  public
    constructor Create(pConexaoControle:TControle);
    destructor Destroy; override;
    function Inseri(pfuncao:TFuncao):Boolean;
    function Altera(pfuncao:TFuncao):Boolean;
    function Exclui(pcodigo:integer):Boolean;
    function Pesquisa(pCodigo:string):TFuncao;
    function ListaFuncoes():TList;
    function QueryFuncoes(pOrdem:Integer):TIBQuery;
end;
implementation

{ TControleFuncionarip }

function TControleFuncao.Altera(pfuncao:TFuncao): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('UPDATE FUNCAO  ');
  FControle.sqqGeral.SQL.Add('SET DESCRICAO = :DESCRICAO WHERE CODIGO = :CODIGO ');

  FControle.sqqGeral.ParamByName('CODIGO').AsInteger    := pFuncao.Codigo ;
  FControle.sqqGeral.ParamByName('DESCRICAO').AsString  := pFuncao.Descricao ;

  try
    FControle.sqqGeral.ExecSQL;
    FControle.Commit(FControle.sqqGeral);
    Result := True;
  except
    Result := False;
  end;
end;

constructor TControleFuncao.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TControleFuncao.Destroy;
begin
  inherited;
end;

function TControleFuncao.Exclui(pcodigo:integer): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('DELETE FROM FUNCAO WHERE CODIGO = :CODIGO ');
  FControle.sqqGeral.ParamByName('CODIGO').AsInteger    := pcodigo;

  try
    FControle.sqqGeral.ExecSQL;
    FControle.Commit(FControle.sqqGeral);
    Result := True;
  except
    Result := False;
  end;
end;

function TControleFuncao.Inseri(pfuncao:TFuncao): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('INSERT INTO FUNCAO  ( DESCRICAO ) VALUES (:DESCRICAO)');
  FControle.sqqGeral.ParamByName('DESCRICAO').AsString       := pfuncao.Descricao;

  try
    FControle.sqqGeral.ExecSQL;
    FControle.sqqGeral.Close;
    FControle.Commit(FControle.sqqGeral);
    Result := True;
  except
    Result := False;
  end;
end;

function TControleFuncao.ListaFuncoes: Tlist;
var wFuncao :TFuncao;
    wListaFuncao:Tlist;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM FUNCAO ');
  FControle.sqqGeral.Open;

  if FControle.sqqGeral.IsEmpty then
  begin
    Result := nil;
  end else
  begin
    wListaFuncao :=  TList.Create;

    while not FControle.sqqGeral.Eof do
    begin
      wFuncao              := TFuncao.Create;
      wFuncao.Codigo       := FControle.sqqGeral.fieldByname('CODIGO').AsInteger;
      wFuncao.Descricao    := FControle.sqqGeral.fieldByname('DESCRICAO').AsString;
      wListaFuncao.Add(wFuncao);
      //FreeAndNil(wFuncao);
      FControle.sqqGeral.Next;
    end;

    Result := wListaFuncao;
  end;
end;

function TControleFuncao.QueryFuncoes(pOrdem: Integer): TIBQuery; 
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM FUNCAO ');
  if pOrdem = 0 then
    FControle.sqqGeral.SQL.Add('ORDER BY CODIGO')
  else
    FControle.sqqGeral.SQL.Add('ORDER BY DESCRICAO');
  FControle.sqqGeral.Open;
  Result :=  FControle.sqqGeral;
end;

function TControleFuncao.Pesquisa(pCodigo: string): TFuncao;
var wFuncao :TFuncao;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM FUNCAO   WHERE  CODIGO =:CODIGO');
  FControle.sqqGeral.ParamByName('CODIGO').AsString := pCodigo;
  FControle.sqqGeral.Open;

  if FControle.sqqGeral.IsEmpty then
  begin
    Result := nil;
  end else
  begin
    wFuncao              := TFuncao.Create;
    wFuncao.Codigo       := FControle.sqqGeral.fieldByname('CODIGO').AsInteger;
    wFuncao.Descricao    := FControle.sqqGeral.fieldByname('DESCRICAO').AsString;
    Result := wFuncao;
  end;
end;

end.
