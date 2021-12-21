unit Un_Usuario;

interface
type
  TUsuario = class

  private
    FCODIGO: Integer;
    FNOME: String;
    FSENHA :String;


  public
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: String read FNome write FNome;
    property Senha :String  read FSenha write fSenha;
  end;

implementation

end.

