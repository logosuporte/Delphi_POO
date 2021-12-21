unit Un_Controller_Usuario;

interface

uses Un_controller_conexao,  Un_Usuario;

Type TControleUsuario = Class
  private
    Fcontrole :TControle;
  public
    constructor Create(pConexaoControle:TControle);
    destructor Destroy; override;
    function Inseri(pUsuario: TUsuario) :Boolean;
    function Altera(pUsuario:TUsuario) :Boolean;
    function Exclui(pcodigo:integer) : Boolean;
    function Pesquisa (pCodigo:string):TUsuario;
    function Login(pNome,pSenha:String):Boolean;
  end;

implementation

{ TControleUsuario }

function TControleUsuario.Altera(pUsuario: TUsuario): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('UPDATE USUARIOS  ');
  FControle.sqqGeral.SQL.Add('SET NOME = :NOME , SENHA = :SENHA WHERE CODIGO = :CODIGO ');

  FControle.sqqGeral.ParamByName('CODIGO').AsInteger := pUsuario.Codigo ;
  FControle.sqqGeral.ParamByName('NOME').AsString    := pUsuario.Nome ;
  FControle.sqqGeral.ParamByName('SENHA').AsString   := pUsuario.Senha ;

  try
    FControle.sqqGeral.ExecSQL;
    FControle.Commit(FControle.sqqGeral);
    Result := True;
  except
    Result := False;
  end;
end;

constructor TControleUsuario.Create(pConexaoControle: TControle);
begin
  Fcontrole := pConexaoControle;
end;

destructor TControleUsuario.Destroy;
begin

  inherited;
end;

function TControleUsuario.Exclui(pcodigo:integer): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('DELETE FROM USUARIOS WHERE CODIGO = :CODIGO ');
  FControle.sqqGeral.ParamByName('CODIGO').AsInteger    := pcodigo;

  try
    FControle.sqqGeral.ExecSQL;
    FControle.Commit(FControle.sqqGeral);
    Result := True;
  except
    Result := False;
  end;
end;

function TControleUsuario.Inseri(pUsuario: TUsuario): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('INSERT INTO USUARIOS ( NOME,SENHA ) VALUES (:NOME, :SENHA)');
  FControle.sqqGeral.ParamByName('NOME').AsString   := pUsuario.NOME;
  FControle.sqqGeral.ParamByName('SENHA').AsString  := pUsuario.SENHA;

  try
    FControle.sqqGeral.ExecSQL;
    FControle.sqqGeral.Close;
    FControle.Commit(FControle.sqqGeral);
    Result := True;
  except
    Result := False;
  end;
end;

function TControleUsuario.Login(pNome, pSenha: String): Boolean;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM USUARIOS   WHERE NOME = :NOME AND SENHA =:SENHA');
  FControle.sqqGeral.ParamByName('NOME').AsString  := pNome;
  FControle.sqqGeral.ParamByName('SENHA').AsString := pSenha;
  FControle.sqqGeral.Open;

  Result := FControle.sqqGeral.IsEmpty;
end;

function TControleUsuario.Pesquisa(pCodigo: string): TUsuario;
var wUsuario :TUsuario;
begin
  FControle.sqqGeral.Close;
  FControle.sqqGeral.SQL.Clear;
  FControle.sqqGeral.SQL.Add('SELECT * FROM USUARIOS   WHERE  CODIGO =:CODIGO');
  FControle.sqqGeral.ParamByName('CODIGO').AsString := pCodigo;
  FControle.sqqGeral.Open;

  if FControle.sqqGeral.IsEmpty then
  begin
    Result := nil;
  end else
  begin
    wUsuario        := TUsuario.Create;
    wUsuario.Codigo := FControle.sqqGeral.fieldByname('CODIGO').AsInteger;
    wUsuario.NOME   := FControle.sqqGeral.fieldByname('NOME').AsString;
    wUsuario.SENHA  := FControle.sqqGeral.fieldByname('SENHA').AsString;
    Result := wUsuario;
  end;
end;

end.
