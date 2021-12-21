unit Un_Funcao;

interface
type
  TFuncao = class

  private
    FCODIGO: Integer;
    FDESCRICAO: String;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: String read FDescricao  write FDescricao;
  end;

implementation

end.
