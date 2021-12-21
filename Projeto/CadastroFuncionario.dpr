program CadastroFuncionario;

uses
  Forms,
  Un_Principal in '..\scr\Un_Principal.pas' {Fr_Principal},
  Un_ViewCadastro in '..\View\Un_ViewCadastro.pas' {Fr_ViewCadastro},
  Un_Funcao in '..\Model\Un_Funcao.pas',
  Un_Funcionario in '..\Model\Un_Funcionario.pas',
  Un_Usuario in '..\Model\Un_Usuario.pas',
  Un_Controller_Funcionario in '..\Controller\Un_Controller_Funcionario.pas',
  Un_controller_conexao in '..\Controller\Un_controller_conexao.pas',
  Un_conexao in '..\Model\Un_conexao.pas',
  Un_ViewFucionario in '..\View\Un_ViewFucionario.pas' {Fr_ViewCadastroFuncionario},
  Un_Controller_Funcao in '..\Controller\Un_Controller_Funcao.pas',
  Un_ViewFuncao in '..\View\Un_ViewFuncao.pas' {Fr_ViewFuncao},
  Un_Controller_Usuario in '..\Controller\Un_Controller_Usuario.pas',
  Un_ViewUsuario in '..\View\Un_ViewUsuario.pas' {Fr_ViewUsuario},
  Un_ViewLogin in '..\View\Un_ViewLogin.pas' {Fr_Login},
  Un_ViewListarFuncoes in '..\View\Un_ViewListarFuncoes.pas' {Fr_ViewListaFuncoes},
  Un_ViewRelFuncoes in '..\View\Un_ViewRelFuncoes.pas' {Fr_ViewRelFuncoes},
  uJSON in '..\Controller\uJSON.pas',
  Un_ViewRelfuncionarios in '..\View\Un_ViewRelfuncionarios.pas' {Fr_ViewRelFuncionario},
  Un_ViewRelFuncionarioAniversario in '..\View\Un_ViewRelFuncionarioAniversario.pas' {Fr_ViewRelFuncionarioAniversario},
  Un_ViewRelFuncionarioSalario in '..\View\Un_ViewRelFuncionarioSalario.pas' {Fr_ViewRelFuncionarioSalario},
  Un_ViewRelFuncionarioFuncao in '..\View\Un_ViewRelFuncionarioFuncao.pas' {Fr_ViewRelFuncaionarioFuncao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFr_Login, Fr_Login);
  Application.CreateForm(TFr_ViewRelFuncaionarioFuncao, Fr_ViewRelFuncaionarioFuncao);
  Application.Run;
end.
