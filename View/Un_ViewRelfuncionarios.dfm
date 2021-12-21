object Fr_ViewRelFuncionario: TFr_ViewRelFuncionario
  Left = 415
  Top = 136
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 125
  ClientWidth = 284
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
  object rgOrdemDados: TRadioGroup
    Left = 11
    Top = 6
    Width = 265
    Height = 73
    Caption = 'Ordenar por: '
    Columns = 2
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Nome')
    ParentFont = False
    TabOrder = 0
  end
  object btnImprimir: TBitBtn
    Left = 9
    Top = 84
    Width = 83
    Height = 33
    Caption = 'Vizualizar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object btnCancelar: TBitBtn
    Left = 194
    Top = 84
    Width = 83
    Height = 33
    Caption = 'Fechar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object Panel1: TPanel
    Left = 15
    Top = 210
    Width = 976
    Height = 321
    TabOrder = 3
    Visible = False
    object RLReport1: TRLReport
      Left = 32
      Top = 13
      Width = 794
      Height = 1123
      DataSource = DataSource1
      ParentFont = True
      Visible = False
      object RLBand1: TRLBand
        Left = 38
        Top = 38
        Width = 718
        Height = 68
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 718
          Height = 23
          Align = faTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'RELAT'#211'RIO DE FUNCION'#193'RIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 475
          Top = 50
          Width = 241
          Height = 15
          Alignment = taRightJustify
          AutoSize = False
          Info = itFullDate
        end
      end
      object RLBand2: TRLBand
        Left = 38
        Top = 106
        Width = 718
        Height = 23
        BandType = btColumnHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        Borders.FixedBottom = True
        object RLLabel2: TRLLabel
          Left = 4
          Top = 4
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
        object RLLabel3: TRLLabel
          Left = 351
          Top = 4
          Width = 57
          Height = 16
          Caption = 'Fun'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 538
          Top = 4
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
          Left = 641
          Top = 4
          Width = 64
          Height = 16
          Caption = 'Dt Nasc.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 69
          Top = 6
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
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 129
        Width = 718
        Height = 23
        object RLDBText1: TRLDBText
          Left = 7
          Top = 5
          Width = 54
          Height = 14
          AutoSize = False
          DataField = 'CODIGO'
          DataSource = DataSource1
        end
        object RLDBText2: TRLDBText
          Left = 68
          Top = 5
          Width = 283
          Height = 14
          AutoSize = False
          DataField = 'Nome'
          DataSource = DataSource1
        end
        object RLDBText3: TRLDBText
          Left = 355
          Top = 5
          Width = 186
          Height = 14
          AutoSize = False
          DataField = 'Funcao'
          DataSource = DataSource1
        end
        object RLDBText4: TRLDBText
          Left = 539
          Top = 5
          Width = 102
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          DataField = 'Salario'
          DataSource = DataSource1
          BeforePrint = RLDBText4BeforePrint
        end
        object RLDBText5: TRLDBText
          Left = 644
          Top = 5
          Width = 72
          Height = 14
          AutoSize = False
          DataField = 'dataNascimento'
          DataSource = DataSource1
          BeforePrint = RLDBText5BeforePrint
        end
      end
      object RLBand4: TRLBand
        Left = 38
        Top = 152
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
    Left = 455
    Top = 88
  end
  object CdsFuncionarios: TClientDataSet
    Aggregates = <>
    FileName = 'Funcionarios.cds'
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
        Name = 'Funcao'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'dataNascimento'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Salario'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 480
    Top = 55
    object CdsFuncionariosCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object CdsFuncionariosFuncao: TStringField
      DisplayWidth = 200
      FieldName = 'Funcao'
    end
    object CdsFuncionariosdataNascimento: TStringField
      FieldName = 'dataNascimento'
    end
    object CdsFuncionariosSalario: TStringField
      FieldName = 'Salario'
    end
    object CdsFuncionariosNome: TStringField
      FieldName = 'Nome'
      Size = 200
    end
  end
end
