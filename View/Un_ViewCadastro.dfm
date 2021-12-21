object Fr_ViewCadastro: TFr_ViewCadastro
  Left = 578
  Top = 188
  Width = 785
  Height = 534
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
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 777
    Height = 41
    Align = alTop
    Caption = 'Cadastro de :'
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 445
    Width = 777
    Height = 39
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'inserir'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 96
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 3
      OnClick = Button4Click
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 71
    Width = 777
    Height = 374
    Align = alClient
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 777
    Height = 30
    Align = alTop
    TabOrder = 3
    object Label13: TLabel
      Left = 255
      Top = 10
      Width = 66
      Height = 13
      Caption = '<Esc> Fechar'
    end
    object Button6: TButton
      Left = 172
      Top = 3
      Width = 75
      Height = 25
      Caption = 'Buscar'
      TabOrder = 2
      OnClick = Button6Click
    end
    object StaticText1: TStaticText
      Left = 20
      Top = 10
      Width = 82
      Height = 17
      Caption = 'Digite o Codigo: '
      TabOrder = 0
    end
    object Edt_Pesquisa: TEdit
      Left = 105
      Top = 5
      Width = 56
      Height = 21
      MaxLength = 2
      TabOrder = 1
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 484
    Width = 777
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = '<Esc> Sair'
        Width = 200
      end>
  end
end
