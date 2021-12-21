unit Un_Funcionario;

interface
uses DateUtils;

Type
  TFuncionario = class
  private

    FCODIGO: integer;
    FNOME: String;
    FSALARIO: Currency;
    FDTNASCIMENTO :TDateTime;
    FFUNCAO: Integer;
    FCEP    :INTEGER;
    FNUMERO        :INTEGER;
    FCOMPLEMENTO   :String;
    FBAIRRO        :String;
    FUF            :String;
    FLAGRADOURO    :String;
    FCIDADE        :String;
    FDESCRICAOFUNCAO: String;

  public
    property Codigo :integer read fCodigo write fCodigo;
    property Nome :String read fNome write fNome;
    property Salario :Currency read fSalario write fSalario;
    property DtNascimento :TDateTime read fDtNascimento write fDtNascimento;
    property Funcao :Integer read fFuncao write fFuncao;
    property CEP :Integer read FCEP write fCEP;
    property NUMERO :Integer read FNUMERO write fNUMERO;
    property COMPLEMENTO :String read FCOMPLEMENTO write fCOMPLEMENTO;
    property BAIRRO :String read FBAIRRO write fBAIRRO;
    property UF :String read FUF write fUF;
    property LAGRADOURO :String read FLAGRADOURO write fLAGRADOURO;
    property CIDADE :String read FCIDADE write fCIDADE;
    property DESCRICAOFUNCAO :String read FDESCRICAOFUNCAO write fDESCRICAOFUNCAO;
  end;

implementation


end.
