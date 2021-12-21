unit Un_Principal;

interface
uses IBDatabase, DB, StdCtrls, Grids, DBGrids, IBCustomDataSet,
  IBQuery, Classes, Controls, ExtCtrls,
  Windows, Messages, SysUtils, Variants, Graphics, Forms,
  Dialogs, jpeg, Buttons, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

  type
    TClimaTempoThread = class(TThread)
    protected
      procedure Execute; override;
    public
      constructor Create;
      destructor Destroy; override;
  end;

type
  TFr_Principal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PanelCentral: TPanel;
    Panel3: TPanel;
    PanelRelatrio: TPanel;
    Image1: TImage;
    PanelMenuRelatorio: TPanel;
    Panel6: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    IdHTTP1: TIdHTTP;
    Panel4: TPanel;
    LabelClima: TLabel;
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure PanelRelatrioClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LabelClimaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ControlaBtnRelatorio;
    procedure ClimaTempo;

  end;

var
  Fr_Principal: TFr_Principal;

implementation

uses Un_ViewFucionario, Un_ViewFuncao, Un_ViewUsuario, Un_ViewLogin,
  Un_ViewListarFuncoes, Un_ViewRelFuncoes, uJSON, Un_ViewRelfuncionarios,
  Un_ViewRelFuncionarioAniversario, Un_ViewRelFuncionarioSalario,
  Un_ViewRelFuncionarioFuncao;

{$R *.dfm}

procedure TFr_Principal.ControlaBtnRelatorio;
begin
  PanelMenuRelatorio.Visible := not PanelMenuRelatorio.Visible;
end;

procedure TFr_Principal.Panel2Click(Sender: TObject);
begin
  Application.CreateForm(TFr_ViewCadastroFuncionario,Fr_ViewCadastroFuncionario);
  Fr_ViewCadastroFuncionario.ShowModal;
  FreeAndNil(Fr_ViewCadastroFuncionario);
end;

procedure TFr_Principal.Panel3Click(Sender: TObject);
begin
  Application.CreateForm(TFr_ViewFuncao,Fr_ViewFuncao);
  Fr_ViewFuncao.ShowModal;
  FreeAndNil(Fr_ViewFuncao);
end;

procedure TFr_Principal.Panel6Click(Sender: TObject);
begin
  Application.CreateForm(TFr_ViewUsuario,Fr_ViewUsuario);
  Fr_ViewUsuario.ShowModal;
  FreeAndNil(Fr_ViewUsuario);
end;

procedure TFr_Principal.PanelRelatrioClick(Sender: TObject);
begin
  ControlaBtnRelatorio;
end;

procedure TFr_Principal.Button1Click(Sender: TObject);
begin
  ControlaBtnRelatorio;
  Application.CreateForm(TFr_ViewRelFuncoes,Fr_ViewRelFuncoes);
  Fr_ViewRelFuncoes.ShowModal;
  FreeAndNil(Fr_ViewRelFuncoes);
end;

procedure TFr_Principal.Button2Click(Sender: TObject);
begin
  ControlaBtnRelatorio;
  Application.CreateForm(TFr_ViewRelFuncionario,Fr_ViewRelFuncionario);
  Fr_ViewRelFuncionario.ShowModal;
  FreeAndNil(Fr_ViewRelFuncionario)
end;

procedure TFr_Principal.Button3Click(Sender: TObject);
begin
  ControlaBtnRelatorio;
  Application.CreateForm(TFr_ViewRelFuncaionarioFuncao,Fr_ViewRelFuncaionarioFuncao);
  Fr_ViewRelFuncaionarioFuncao.ShowModal;
  FreeAndNil(Fr_ViewRelFuncaionarioFuncao);
end;

procedure TFr_Principal.Button4Click(Sender: TObject);
begin
  ControlaBtnRelatorio;
  Application.CreateForm(TFr_ViewRelFuncionarioSalario,Fr_ViewRelFuncionarioSalario);
  Fr_ViewRelFuncionarioSalario.ShowModal;
  FreeAndNil(Fr_ViewRelFuncionarioSalario);
end;

procedure TFr_Principal.Button5Click(Sender: TObject);
begin
  ControlaBtnRelatorio;
  Application.CreateForm(TFr_ViewRelFuncionarioAniversario,Fr_ViewRelFuncionarioAniversario);
  Fr_ViewRelFuncionarioAniversario.ShowModal;
  FreeAndNil(Fr_ViewRelFuncionarioAniversario)
end;

procedure TFr_Principal.ClimaTempo;
var config : myJSONItem;
    list : TStringList;
    i:integer;
    wdt,wcidade,wTempo,wvento: String;
     MyMemo: TMemo;
begin
try
   MyMemo:= TMemo.Create(Self);

  IdHTTP1.HandleRedirects := True;
  IdHTTP1.ReadTimeout     := 5000;
  IdHTTP1.Request.Accept  := 'application/json';
  IdHTTP1.Request.AcceptCharSet  := 'UTF-8';
  IdHTTP1.Request.AcceptLanguage := 'sv';
  IdHTTP1.Request.ContentType    := 'application/json';
  MyMemo.Text :=  UTF8ToAnsi(IdHTTP1.get('http://api.hgbrasil.com/weather?woeid=455824'));

  config := myJSONItem.Create;
  config.Code := MyMemo.Text;
     //('conf.json');
  ///wnd.Width := config['window']['width'].getInt(DEFAULT_WIDTH);
  for i := 0 to config['results'].Count - 1 do
  begin
    case i of
        2: wdt     := (config['results'].Value[i].getStr);
        7: wcidade := (config['results'].Value[i].getStr);
        4: wTempo  := (config['results'].Value[i].getStr);
       10: wvento  := (config['results'].Value[i].getStr);
     end;
  end;
  config.Free;
  LabelClima.Caption := wcidade+', '+wTempo+', Vento: '+wvento+' em: '+wdt;
except
  LabelClima.Caption := 'Clique aqui para atualizar!';
end;
end;


procedure TFr_Principal.FormShow(Sender: TObject);
var RodaClimaTempo :TClimaTempoThread;
begin
  RodaClimaTempo := TClimaTempoThread.Create;
  RodaClimaTempo.Execute;
  RodaClimaTempo.Destroy;
end;

procedure TFr_Principal.LabelClimaClick(Sender: TObject);
begin
  ClimaTempo;
  ShowMessage('Atualizado');
end;

{ TClimaTempoThread }

constructor TClimaTempoThread.Create;
begin
inherited Create(True);
end;

destructor TClimaTempoThread.Destroy;
begin

  inherited;
end;

procedure TClimaTempoThread.Execute;
begin
  Fr_Principal.ClimaTempo;
end;

end.
