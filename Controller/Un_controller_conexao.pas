unit Un_controller_conexao;
interface

uses
   Windows, Messages, SysUtils, Classes,  Controls, Forms, Dialogs,
   Variants, Contnrs,  SqlExpr,  StrUtils, inifiles,IBCustomDataSet,Un_conexao,IBQuery;
type
  TControle = class
  private
    FConexao  : TConexaoBanco;
    FSqqGeral : TIBQuery;
  public
    constructor Create;
    destructor  Destroy; override;
    function Commit(sql:TIBQuery):boolean;
    property SqqGeral : TIBQuery read FSqqGeral write FSqqGeral;
  end;
implementation

uses Un_Controller_Funcionario;




function TControle.Commit(sql: TIBQuery): boolean;
begin
  sql.Close;
  sql.SQL.Clear;
  sql.SQL.Add('COMMIT WORK');
  sql.ExecSQL;
end;

constructor TControle.Create;
begin
   FConexao  := TConexaoBanco.Create;
   FSqqGeral := TIBQuery.Create(Application);
   FSqqGeral.Database := FConexao.ConexaoBanco;
end;

destructor TControle.Destroy;
begin
  inherited;
end;
end.
