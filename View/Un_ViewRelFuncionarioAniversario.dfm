object Fr_ViewRelFuncionarioAniversario: TFr_ViewRelFuncionarioAniversario
  Left = 413
  Top = 273
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 138
  ClientWidth = 209
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
    Width = 181
    Height = 86
  end
  object Label1: TLabel
    Left = 20
    Top = 13
    Width = 36
    Height = 14
    Caption = 'Inicial'
  end
  object Label2: TLabel
    Left = 100
    Top = 13
    Width = 29
    Height = 14
    Caption = 'Final'
  end
  object btnImprimir: TBitBtn
    Left = 11
    Top = 97
    Width = 83
    Height = 33
    Caption = 'Vizualizar'
    TabOrder = 0
    OnClick = btnImprimirClick
  end
  object btnCancelar: TBitBtn
    Left = 113
    Top = 97
    Width = 83
    Height = 33
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object edtDataIni: TMaskEdit
    Left = 20
    Top = 32
    Width = 69
    Height = 22
    EditMask = '!99/99;1;_'
    MaxLength = 5
    TabOrder = 2
    Text = '01/01'
    OnExit = edtDataIniExit
  end
  object edtDataFim: TMaskEdit
    Left = 98
    Top = 32
    Width = 71
    Height = 22
    EditMask = '!99/99;1;_'
    MaxLength = 5
    TabOrder = 3
    Text = '30/12'
    OnExit = edtDataFimExit
  end
  object CheckIgnorarData: TCheckBox
    Left = 79
    Top = 66
    Width = 112
    Height = 17
    Caption = 'Ignorar datas'
    TabOrder = 4
    OnClick = CheckIgnorarDataClick
  end
  object Panel1: TPanel
    Left = 10
    Top = 165
    Width = 836
    Height = 251
    TabOrder = 5
    Visible = False
    object RLReportFuncionarioAniversariantes: TRLReport
      Left = 22
      Top = 18
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
          Caption = 'Relat'#243'rio de Funcionarios Aniversariantes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 470
          Top = 56
          Width = 246
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
        Height = 22
        object RLDBText1: TRLDBText
          Left = 2
          Top = 5
          Width = 54
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'CODIGO'
          DataSource = DataSource1
        end
        object RLDBText2: TRLDBText
          Left = 60
          Top = 5
          Width = 386
          Height = 14
          AutoSize = False
          DataField = 'NOME'
          DataSource = DataSource1
        end
        object RLDBText3: TRLDBText
          Left = 608
          Top = 5
          Width = 103
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'SALARIO'
          DataSource = DataSource1
          BeforePrint = RLDBText3BeforePrint
        end
        object RLDBText4: TRLDBText
          Left = 449
          Top = 5
          Width = 92
          Height = 14
          Alignment = taCenter
          AutoSize = False
          DataField = 'ANIVERSARIO'
          DataSource = DataSource1
        end
      end
      object v: TRLBand
        Left = 38
        Top = 113
        Width = 718
        Height = 22
        BandType = btColumnHeader
        Borders.Sides = sdAll
        object RLLabel2: TRLLabel
          Left = 62
          Top = 5
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
          Left = 606
          Top = 5
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
          Left = 450
          Top = 5
          Width = 87
          Height = 16
          Caption = 'Anivers'#225'rio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 2
          Top = 5
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
        Top = 157
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
          Left = 460
          Top = 3
          Width = 247
          Height = 14
          AutoSize = False
          Info = itDetailCount
          Text = 'Quantidade de Funcionarios => '
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 177
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
  object DataSource1: TDataSource
    DataSet = CdsFuncionarios
    Left = 440
    Top = 49
  end
  object CdsFuncionarios: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CODIGO'
        DataType = ftInteger
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'ANIVERSARIO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SALARIO'
        DataType = ftCurrency
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    IndexFieldNames = 'ANIVERSARIO;Salario'
    Params = <>
    StoreDefs = True
    Left = 530
    Top = 55
    Data = {
      860000009619E0BD010000001800000004000000000003000000860006434F44
      49474F0400010000000000044E4F4D4501004900000001000557494454480200
      0200C8000B414E49564552534152494F01004900000001000557494454480200
      020014000753414C4152494F0800040000000100075355425459504502004900
      06004D6F6E6579000000}
    object CdsFuncionariosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object CdsFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object CdsFuncionariosANIVERSARIO: TStringField
      FieldName = 'ANIVERSARIO'
    end
    object CdsFuncionariosSALARIO: TCurrencyField
      FieldName = 'SALARIO'
    end
  end
end
