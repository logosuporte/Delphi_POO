object Fr_ViewRelFuncionarioSalario: TFr_ViewRelFuncionarioSalario
  Left = 530
  Top = 252
  ActiveControl = edtValorIni
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 164
  ClientWidth = 240
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel1: TBevel
    Left = 10
    Top = 5
    Width = 211
    Height = 101
  end
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 36
    Height = 14
    Caption = 'Inicial'
  end
  object Label2: TLabel
    Left = 120
    Top = 20
    Width = 29
    Height = 14
    Caption = 'Final'
  end
  object btnVisualizar: TBitBtn
    Left = 11
    Top = 114
    Width = 83
    Height = 33
    Caption = 'Visualizar'
    TabOrder = 3
    OnClick = btnVisualizarClick
  end
  object btnCancelar: TBitBtn
    Left = 143
    Top = 114
    Width = 83
    Height = 33
    Caption = 'Fechar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
  object CkheckIgnorarSalario: TCheckBox
    Left = 111
    Top = 76
    Width = 97
    Height = 17
    Caption = 'Ignorar Salario'
    TabOrder = 2
    OnClick = CkheckIgnorarSalarioClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 185
    Width = 971
    Height = 251
    Caption = 'Panel1'
    TabOrder = 5
    Visible = False
    object RLReportFuncionariosalario: TRLReport
      Left = 45
      Top = 38
      Width = 794
      Height = 1123
      DataSource = DataSource1
      ParentFont = True
      Visible = False
      object RLBand1: TRLBand
        Left = 38
        Top = 38
        Width = 718
        Height = 75
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 718
          Height = 23
          Align = faTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio de Funcion'#225'rios por Sal'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 440
          Top = 56
          Width = 276
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Info = itFullDate
        end
      end
      object RLBand2: TRLBand
        Left = 38
        Top = 135
        Width = 718
        Height = 18
        object RLDBText1: TRLDBText
          Left = 4
          Top = 0
          Width = 27
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Codigo'
          DataSource = DataSource1
        end
        object RLDBText2: TRLDBText
          Left = 60
          Top = 0
          Width = 481
          Height = 14
          AutoSize = False
          DataField = 'Nome'
          DataSource = DataSource1
        end
        object RLDBText3: TRLDBText
          Left = 567
          Top = 0
          Width = 144
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Salario'
          DataSource = DataSource1
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 113
        Width = 718
        Height = 22
        BandType = btColumnHeader
        Borders.Sides = sdAll
        object RLLabel2: TRLLabel
          Left = 60
          Top = 0
          Width = 80
          Height = 16
          Caption = 'Fucion'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 566
          Top = 0
          Width = 54
          Height = 16
          Caption = 'Sal'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 0
          Top = 0
          Width = 54
          Height = 16
          Caption = 'C'#243'digo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 38
        Top = 153
        Width = 718
        Height = 20
        BandType = btColumnFooter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = True
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Borders.FixedTop = True
        object RLSystemInfo3: TRLSystemInfo
          Left = 666
          Top = 3
          Width = 41
          Height = 14
          AutoSize = False
          Info = itDetailCount
        end
        object RLLabel3: TRLLabel
          Left = 414
          Top = 1
          Width = 221
          Height = 16
          Caption = 'Quantidade de Funcionarios =>  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
      end
      object RLBand5: TRLBand
        Left = 38
        Top = 173
        Width = 718
        Height = 25
        BandType = btFooter
        object RLLabel7: TRLLabel
          Left = 485
          Top = 5
          Width = 233
          Height = 19
          Caption = 'Francisco Carlos Pereira da Silva'
        end
      end
    end
  end
  object edtValorIni: TEdit
    Left = 15
    Top = 45
    Width = 91
    Height = 22
    TabOrder = 0
    OnExit = edtValorIniExit
    OnKeyPress = edtValorIniKeyPress
  end
  object edtValorFinal: TEdit
    Left = 120
    Top = 45
    Width = 91
    Height = 22
    TabOrder = 1
    OnExit = edtValorFinalExit
    OnKeyPress = edtValorFinalKeyPress
  end
  object DataSource1: TDataSource
    DataSet = CdsFuncionarios
    Left = 558
    Top = 68
  end
  object CdsFuncionarios: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'Codigo'
        DataType = ftInteger
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'Salario'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'salario'
        Options = [ixDescending]
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    Left = 380
    Top = 50
    Data = {
      660000009619E0BD010000001800000003000000000003000000660006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      0200C8000753616C6172696F0800040000000100075355425459504502004900
      06004D6F6E6579000000}
    object CdsFuncionariosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object CdsFuncionariosNome: TStringField
      FieldName = 'Nome'
      Size = 200
    end
    object CdsFuncionariosSalario: TCurrencyField
      FieldName = 'Salario'
    end
  end
end
