unit Un_conexao;

interface
uses
  SqlExpr, inifiles, SysUtils,IBDatabase,  Windows, Messages, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, StdCtrls;
type
  TConexaoBanco = class
  private
    FConexaoBanco : TIBDatabase;
  public
    constructor Create;
    destructor  Destroy; override;
    function GetConexao: TIBDatabase;
    property ConexaoBanco: TIBDatabase   read GetConexao;
  end;

implementation

{ TConexaoBanco }

constructor TConexaoBanco.Create;
var ArquivoINI, Servidor, Caminho, DriverName, UserName, PassWord : string;
    LocalServer : Integer;
    Configuracoes : TIniFile;
    transacao:TIBTransaction;
begin
   ArquivoINI := ExtractFilePath(Application.ExeName) + 'conexao.ini';

   // Carregando as informações do arquivo de configurações
   Configuracoes := TIniFile.Create(ArquivoINI);
   Try
     Servidor   := Configuracoes.ReadString('Dados', 'Servidor',   Servidor);
     Caminho    := Configuracoes.ReadString('Dados', 'DataBase',   Caminho);
     UserName   := Configuracoes.ReadString('Dados', 'UserName',   UserName);
     PassWord   := Configuracoes.ReadString('Dados', 'PassWord',   PassWord);
   Finally
     Configuracoes.Free;
   end;

   try
     transacao               := TIBTransaction.Create(nil);
     transacao.DefaultAction := TACommitRetaining;
     transacao.Params.Add('read_committed');
     transacao.Params.Add('rec_version');
     transacao.Params.Add('nowait');

     FConexaoBanco := TIBDatabase.Create(NIL);
     FConexaoBanco.LoginPrompt   := False;
     FConexaoBanco.Connected     := False;
     FConexaoBanco.DatabaseName  := Servidor + ':' + Caminho;
     FConexaoBanco.Params.Values['User_Name'] := UserName;
     FConexaoBanco.Params.Values['Password']  := PassWord;
     FConexaoBanco.DefaultTransaction         := transacao;
     FConexaoBanco.Connected                  := True;
   except
     raise Exception.Create('Erro ao Conectar o Banco de dados. Verifique as CONFIGURAÇOES!');
   end;
end;

destructor TConexaoBanco.Destroy;
begin
  FConexaoBanco.Free;
  inherited;
end;

function TConexaoBanco.GetConexao: TIBDatabase;
begin
   Result := FConexaoBanco;
end;
end.
