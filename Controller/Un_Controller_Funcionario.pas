unit Un_Controller_Funcionario;

interface
uses Un_Funcionario,Un_controller_conexao,Classes;

Type TControleFuncionario = Class
  private
    Fcontrole :TControle;
  public
    constructor Create(pConexaoControle:TControle);
    destructor Destroy; override;
    function Inseri(pFuncionraio:TFuncionario) : Boolean;
    function Altera(pFuncionraio:TFuncionario) : Boolean;
    function Exclui(pcodigo:integer) : Boolean;
    function Pesquisa (pCodigo:string):TFuncionario;
    function ListarFuncionarios():TList;
    function ListarFuncionariosAniversario(pdainicial,pdafinal:string):TList;
    function ListarFuncionariosSalario(psalinicial,psalfinal:Currency):TList;
  end;
implementation

uses SysUtils, DB, Math;



{ TControleFuncionarip }

function TControleFuncionario.Altera(pFuncionraio:TFuncionario): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('UPDATE FUNCIONARIOS ');
  FControle.sqqGeral.SQL.Add('SET NOME  =:NOME, SALARIO= :SALARIO, DTNASCIMENTO = :DTNASCIMENTO, FK_FUNCAO = :FK_FUNCAO, ');
  FControle.sqqGeral.SQL.Add('CEP=:CEP, NUMERO=:NUMERO, COMPLEMENTO=:COMPLEMENTO, BAIRRO=:BAIRRO, UF=:UF, LAGRADOURO=:LAGRADOURO, CIDADE=:CIDADE ');
  FControle.sqqGeral.SQL.Add('WHERE CODIGO = :CODIGO');


  FControle.sqqGeral.ParamByName('CODIGO').AsInteger    := pFuncionraio.Codigo ;
  FControle.sqqGeral.ParamByName('NOME').AsString       := pFuncionraio.Nome;
  FControle.sqqGeral.ParamByName('SALARIO').AsCurrency  := pFuncionraio.Salario;
  FControle.sqqGeral.ParamByName('DTNASCIMENTO').AsDate := pFuncionraio.DtNascimento;
  FControle.sqqGeral.ParamByName('FK_FUNCAO').AsInteger := pFuncionraio.Funcao;

  FControle.sqqGeral.ParamByName('CEP').AsInteger        := pFuncionraio.CEP;
  FControle.sqqGeral.ParamByName('NUMERO').AsInteger     := pFuncionraio.NUMERO;
  FControle.sqqGeral.ParamByName('COMPLEMENTO').AsString := pFuncionraio.COMPLEMENTO;
  FControle.sqqGeral.ParamByName('BAIRRO').AsString      := pFuncionraio.BAIRRO;
  FControle.sqqGeral.ParamByName('UF').AsString          := pFuncionraio.UF;
  FControle.sqqGeral.ParamByName('LAGRADOURO').AsString  := pFuncionraio.LAGRADOURO;
  FControle.sqqGeral.ParamByName('CIDADE').AsString      := pFuncionraio.CIDADE;
  try
    FControle.sqqGeral.ExecSQL;
    
    FControle.Commit(FControle.sqqGeral);

    Result := True;
  except
    Result := False;
  end;
end;

constructor TControleFuncionario.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TControleFuncionario.Destroy;
begin
  inherited;
end;

function TControleFuncionario.Exclui(pcodigo:integer): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('DELETE FROM FUNCIONARIOS WHERE CODIGO = :CODIGO ');
  FControle.sqqGeral.ParamByName('CODIGO').AsInteger    := pcodigo;
  try
    FControle.sqqGeral.ExecSQL;
    FControle.Commit(FControle.sqqGeral);

    Result := True;
  except
    Result := False;
  end;

end;

function TControleFuncionario.Inseri(pFuncionraio:TFuncionario): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('INSERT INTO FUNCIONARIOS (NOME, SALARIO, DTNASCIMENTO, FK_FUNCAO,CEP, NUMERO, COMPLEMENTO, BAIRRO, UF, LAGRADOURO, CIDADE ) VALUES (:NOME, :SALARIO, :DTNASCIMENTO, :FK_FUNCAO,');
  FControle.sqqGeral.SQL.Add(':CEP, :NUMERO, :COMPLEMENTO, :BAIRRO, :UF, :LAGRADOURO, :CIDADE)');
  //FControle.sqqGeral.ParamByName('CODIGO').AsInteger    := ;
  FControle.sqqGeral.ParamByName('NOME').AsString       := pFuncionraio.Nome;
  FControle.sqqGeral.ParamByName('SALARIO').AsCurrency  := pFuncionraio.Salario;
  FControle.sqqGeral.ParamByName('DTNASCIMENTO').AsDate := pFuncionraio.DtNascimento;
  FControle.sqqGeral.ParamByName('FK_FUNCAO').AsInteger := pFuncionraio.Funcao;
  FControle.sqqGeral.ParamByName('CEP').AsInteger        := pFuncionraio.CEP;
  FControle.sqqGeral.ParamByName('NUMERO').AsInteger     := pFuncionraio.NUMERO;
  FControle.sqqGeral.ParamByName('COMPLEMENTO').AsString := pFuncionraio.COMPLEMENTO;
  FControle.sqqGeral.ParamByName('BAIRRO').AsString      := pFuncionraio.BAIRRO;
  FControle.sqqGeral.ParamByName('UF').AsString          := pFuncionraio.UF;
  FControle.sqqGeral.ParamByName('LAGRADOURO').AsString  := pFuncionraio.LAGRADOURO;
  FControle.sqqGeral.ParamByName('CIDADE').AsString      := pFuncionraio.CIDADE;

  try
    FControle.sqqGeral.ExecSQL;
    FControle.sqqGeral.Close;
    FControle.Commit(FControle.sqqGeral);

    Result := True;
  except
    Result := False;
  end;

end;

function TControleFuncionario.ListarFuncionarios: TList;
var Funcionarios :TFuncionario;
    wListaFuncionarios:Tlist;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM FUNCIONARIOS A ,FUNCAO B WHERE A.FK_FUNCAO = B.CODIGO ');
  FControle.sqqGeral.Open;

  if FControle.sqqGeral.IsEmpty then
  begin
    Result := nil;
  end else
  begin
    wListaFuncionarios :=  TList.Create;

    while not FControle.sqqGeral.Eof do
    begin
      Funcionarios                 := TFuncionario.Create;
      Funcionarios.Codigo          := FControle.sqqGeral.fieldByname('CODIGO').AsInteger;
      Funcionarios.Nome            := FControle.sqqGeral.fieldByname('NOME').AsString;
      Funcionarios.Salario         := FControle.sqqGeral.fieldByname('SALARIO').AsCurrency;
      Funcionarios.DtNascimento    := FControle.sqqGeral.fieldByname('DTNASCIMENTO').AsDateTime;
      Funcionarios.Funcao          := FControle.sqqGeral.fieldByname('FK_FUNCAO').AsInteger;
      Funcionarios.DESCRICAOFUNCAO := FControle.sqqGeral.fieldByname('DESCRICAO').AsString;

      wListaFuncionarios.Add(Funcionarios);

      FControle.sqqGeral.Next;
    end;

    Result := wListaFuncionarios;
  end;
end;
function TControleFuncionario.ListarFuncionariosAniversario(pdainicial,
  pdafinal: string): TList;
  var Funcionarios :TFuncionario;
    wListaFuncionarios:Tlist;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * ');
  FControle.sqqGeral.SQL.Add('FROM FUNCIONARIOS ');
  FControle.sqqGeral.SQL.Add('WHERE (EXTRACT(DAY FROM  FUNCIONARIOS.dtnascimento) BETWEEN  :DIAINICIAL  AND :DIAFINAL ) AND ');
  FControle.sqqGeral.SQL.Add('(EXTRACT(MONTH FROM  FUNCIONARIOS.dtnascimento) BETWEEN  :MESINICIAL  AND :MESFINAL) ');

  FControle.SqqGeral.ParamByName('DIAINICIAL').AsInteger := StrToInt(Copy(pdainicial,1,2));
  FControle.SqqGeral.ParamByName('DIAFINAL').AsInteger   := StrToInt(Copy(pdafinal,1,2));
  FControle.SqqGeral.ParamByName('MESINICIAL').AsInteger := StrToInt(Copy(pdainicial,4,2));
  FControle.SqqGeral.ParamByName('MESFINAL').AsInteger   := StrToInt(Copy(pdafinal,4,2));

  FControle.sqqGeral.Open;

  if FControle.sqqGeral.IsEmpty then
  begin
    Result := nil;
  end else
  begin
    wListaFuncionarios :=  TList.Create;

    while not FControle.sqqGeral.Eof do
    begin
      Funcionarios                 := TFuncionario.Create;
      Funcionarios.Codigo          := FControle.sqqGeral.fieldByname('CODIGO').AsInteger;
      Funcionarios.Nome            := FControle.sqqGeral.fieldByname('NOME').AsString;
      Funcionarios.Salario         := FControle.sqqGeral.fieldByname('SALARIO').AsCurrency;
      Funcionarios.DtNascimento    := FControle.sqqGeral.fieldByname('DTNASCIMENTO').AsDateTime;
      wListaFuncionarios.Add(Funcionarios);

      FControle.sqqGeral.Next;
    end;

    Result := wListaFuncionarios;
  end;
end;

function TControleFuncionario.ListarFuncionariosSalario(psalinicial,
  psalfinal: Currency): TList;
  var Funcionarios :TFuncionario;
    wListaFuncionarios:Tlist;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM FUNCIONARIOS');

  if (psalinicial > 0) and (psalfinal > 0) then
  begin
    FControle.sqqGeral.SQL.Add('WHERE FUNCIONARIOS.SALARIO BETWEEN :INICAL AND :FINAL ');
    FControle.sqqGeral.ParamByName('INICAL').AsCurrency := psalinicial;
    FControle.sqqGeral.ParamByName('FINAL').AsCurrency  := psalfinal;
  end;
  FControle.sqqGeral.Open;

  if FControle.sqqGeral.IsEmpty then
  begin
    Result := nil;
  end else
  begin
    wListaFuncionarios :=  TList.Create;

    while not FControle.sqqGeral.Eof do
    begin
      Funcionarios                 := TFuncionario.Create;
      Funcionarios.Codigo          := FControle.sqqGeral.fieldByname('CODIGO').AsInteger;
      Funcionarios.Nome            := FControle.sqqGeral.fieldByname('NOME').AsString;
      Funcionarios.Salario         := FControle.sqqGeral.fieldByname('SALARIO').AsCurrency;

      wListaFuncionarios.Add(Funcionarios);

      FControle.sqqGeral.Next;
    end;

    Result := wListaFuncionarios;
  end;
end;

function TControleFuncionario.Pesquisa(pCodigo: string): TFuncionario;
var wFuncionario :TFuncionario;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM FUNCIONARIOS WHERE  CODIGO =:CODIGO');
  FControle.sqqGeral.ParamByName('CODIGO').AsString := pCodigo;
  FControle.sqqGeral.Open;

  if FControle.sqqGeral.IsEmpty then
  begin
    Result := nil;
  end else
  begin
    wFuncionario              := TFuncionario.Create;
    wFuncionario.Codigo       := FControle.sqqGeral.fieldByname('CODIGO').AsInteger;
    wFuncionario.Nome         := FControle.sqqGeral.fieldByname('NOME').AsString;
    wFuncionario.DtNascimento := FControle.sqqGeral.fieldByname('DTNASCIMENTO').AsDateTime;
    wFuncionario.Salario      := FControle.sqqGeral.fieldByname('SALARIO').AsCurrency;
    wFuncionario.Funcao       := FControle.sqqGeral.fieldByname('FK_FUNCAO').AsInteger;
    wFuncionario.CEP          := FControle.sqqGeral.fieldByname('CEP').AsInteger;
    wFuncionario.NUMERO       := FControle.sqqGeral.fieldByname('NUMERO').AsInteger;
    wFuncionario.COMPLEMENTO  := FControle.sqqGeral.fieldByname('COMPLEMENTO').AsString;
    wFuncionario.BAIRRO       := FControle.sqqGeral.fieldByname('BAIRRO').AsString;
    wFuncionario.UF           := FControle.sqqGeral.fieldByname('UF').AsString;
    wFuncionario.LAGRADOURO   := FControle.sqqGeral.fieldByname('LAGRADOURO').AsString;
    wFuncionario.CIDADE       := FControle.sqqGeral.fieldByname('CIDADE').AsString;

    Result := wFuncionario;
  end;
end;

end.
