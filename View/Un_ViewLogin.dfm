object Fr_Login: TFr_Login
  Left = 642
  Top = 333
  Width = 380
  Height = 159
  ActiveControl = EditNome
  BorderIcons = []
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 55
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object Label2: TLabel
    Left = 140
    Top = 55
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 372
    Height = 41
    Align = alTop
    Caption = 'Login'
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object EditNome: TEdit
    Left = 10
    Top = 78
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
  end
  object EditSenha: TEdit
    Left = 140
    Top = 78
    Width = 121
    Height = 21
    PasswordChar = '#'
    TabOrder = 2
  end
  object Button1: TButton
    Left = 270
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 109
    Width = 372
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = 'Usuario: MASTER Senha: 123'
        Width = 200
      end
      item
        Alignment = taCenter
        Text = '<Esc> Sair'
        Width = 100
      end>
  end
  object IdEncoderMIME1: TIdEncoderMIME
    FillChar = '='
    Left = 745
    Top = 141
  end
end
