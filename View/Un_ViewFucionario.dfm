inherited Fr_ViewCadastroFuncionario: TFr_ViewCadastroFuncionario
  Left = 492
  Top = 111
  Width = 506
  Height = 565
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 498
    Caption = 'Cadastro de  Funcion'#225'rios'
  end
  inherited Panel2: TPanel
    Top = 495
    Width = 498
    inherited Button3: TButton
      Caption = 'Deletar'
    end
  end
  inherited Panel3: TPanel
    Width = 498
    Height = 454
    object Label1: TLabel
      Left = 55
      Top = 30
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 110
      Top = 31
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 55
      Top = 87
      Width = 32
      Height = 13
      Caption = 'Sal'#225'rio'
    end
    object Label4: TLabel
      Left = 180
      Top = 87
      Width = 97
      Height = 13
      Caption = 'Data de Nascimento'
    end
    object Label5: TLabel
      Left = 55
      Top = 139
      Width = 36
      Height = 13
      Caption = 'Fun'#231#227'o'
    end
    object Label6: TLabel
      Left = 55
      Top = 185
      Width = 21
      Height = 13
      Caption = 'CEP'
    end
    object Label7: TLabel
      Left = 55
      Top = 270
      Width = 54
      Height = 13
      Caption = 'Lagradouro'
    end
    object Label8: TLabel
      Left = 265
      Top = 185
      Width = 37
      Height = 13
      Caption = 'Numero'
    end
    object Label9: TLabel
      Left = 55
      Top = 313
      Width = 27
      Height = 13
      Caption = 'Bairro'
    end
    object Label10: TLabel
      Left = 55
      Top = 227
      Width = 64
      Height = 13
      Caption = 'Complemento'
    end
    object Label11: TLabel
      Left = 55
      Top = 355
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label12: TLabel
      Left = 330
      Top = 353
      Width = 14
      Height = 13
      Caption = 'UF'
    end
    object EditCodigo: TEdit
      Left = 55
      Top = 50
      Width = 41
      Height = 21
      BorderStyle = bsNone
      ReadOnly = True
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 110
      Top = 51
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object Edit4: TEdit
      Left = 55
      Top = 107
      Width = 121
      Height = 21
      TabOrder = 2
      OnExit = Edit4Exit
    end
    object Edit6: TEdit
      Left = 55
      Top = 160
      Width = 36
      Height = 21
      TabOrder = 4
      OnExit = Edit6Exit
    end
    object EdtdtaNascimento: TMaskEdit
      Left = 185
      Top = 107
      Width = 96
      Height = 21
      TabOrder = 3
    end
    object Button5: TButton
      Left = 180
      Top = 205
      Width = 71
      Height = 25
      Caption = 'Buscar CEP'
      TabOrder = 6
      OnClick = Button5Click
    end
    object EditCep: TEdit
      Left = 55
      Top = 206
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object EditComplemento: TEdit
      Left = 55
      Top = 249
      Width = 381
      Height = 21
      TabOrder = 8
    end
    object EditNumero: TEdit
      Left = 260
      Top = 206
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object EditLagradouro: TEdit
      Left = 55
      Top = 291
      Width = 371
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 9
    end
    object EditBairro: TEdit
      Left = 55
      Top = 334
      Width = 366
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 10
    end
    object EditCidade: TEdit
      Left = 55
      Top = 377
      Width = 271
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 11
    end
    object EditUF: TEdit
      Left = 330
      Top = 375
      Width = 91
      Height = 21
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 12
    end
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 530
    Top = 26
  end
end
