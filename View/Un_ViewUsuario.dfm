inherited Fr_ViewUsuario: TFr_ViewUsuario
  Width = 378
  Height = 391
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 370
    Caption = 'Cadastro de Usu'#225'rios'
  end
  inherited Panel2: TPanel
    Top = 302
    Width = 370
    inherited Button3: TButton
      Caption = 'Delete'
    end
  end
  inherited Panel3: TPanel
    Width = 370
    Height = 231
    object Label1: TLabel
      Left = 65
      Top = 45
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 65
      Top = 107
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 65
      Top = 169
      Width = 31
      Height = 13
      Caption = 'Senha'
    end
    object EditCodigo: TEdit
      Left = 65
      Top = 61
      Width = 61
      Height = 21
      BorderStyle = bsNone
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
    end
    object EditNome: TEdit
      Left = 65
      Top = 123
      Width = 271
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object EditSenha: TEdit
      Left = 65
      Top = 185
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      PasswordChar = '#'
      TabOrder = 2
    end
  end
  inherited Panel4: TPanel
    Width = 370
  end
  inherited StatusBar1: TStatusBar
    Top = 341
    Width = 370
  end
  object IdEncoderMIME1: TIdEncoderMIME
    FillChar = '='
    Left = 745
    Top = 141
  end
  object IdDecoderMIME1: TIdDecoderMIME
    FillChar = '='
    Left = 730
    Top = 81
  end
end
