inherited Fr_ViewFuncao: TFr_ViewFuncao
  Width = 377
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 369
    Caption = 'Cadastro de Fun'#231#245'es'
  end
  inherited Panel2: TPanel
    Width = 369
    inherited Button3: TButton
      Caption = 'Deletar'
    end
  end
  inherited Panel3: TPanel
    Width = 369
    object Label1: TLabel
      Left = 25
      Top = 32
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Label2: TLabel
      Left = 25
      Top = 81
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object EditCodigo: TEdit
      Left = 25
      Top = 50
      Width = 51
      Height = 21
      BorderStyle = bsNone
      Color = cl3DLight
      ReadOnly = True
      TabOrder = 0
    end
    object EditDescricao: TEdit
      Left = 25
      Top = 100
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  inherited Panel4: TPanel
    Width = 369
  end
end
