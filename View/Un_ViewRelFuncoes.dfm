object Fr_ViewRelFuncoes: TFr_ViewRelFuncoes
  Left = 629
  Top = 319
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 111
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 19
  object BtnImprimir: TBitBtn
    Left = 9
    Top = 69
    Width = 89
    Height = 33
    Caption = 'Vizualizar'
    TabOrder = 0
    OnClick = BtnImprimirClick
  end
  object rgOrdemDados: TRadioGroup
    Left = 7
    Top = 12
    Width = 274
    Height = 54
    Caption = 'Ordenar por:'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    TabOrder = 1
  end
  object btnFechar: TBitBtn
    Left = 190
    Top = 69
    Width = 89
    Height = 33
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btnFecharClick
  end
  object Panel1: TPanel
    Left = 5
    Top = 110
    Width = 951
    Height = 316
    TabOrder = 3
    Visible = False
    object RLReportFuncoes: TRLReport
      Left = 54
      Top = 78
      Width = 794
      Height = 1123
      DataSource = dsRelatorio
      ParentFont = True
      Visible = False
      object RLBand1: TRLBand
        Left = 38
        Top = 38
        Width = 718
        Height = 67
        BandType = btHeader
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = True
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 718
          Height = 30
          Align = faTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio de Fun'#231#245'es'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -24
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 429
          Top = 40
          Width = 282
          Height = 20
          Alignment = taRightJustify
          AutoSize = False
          Info = itFullDate
        end
      end
      object RLBand3: TRLBand
        Left = 38
        Top = 121
        Width = 718
        Height = 25
        object RLDBText1: TRLDBText
          Left = 12
          Top = 3
          Width = 52
          Height = 19
          Alignment = taCenter
          DataField = 'codigo'
          DataSource = dsRelatorio
        end
        object RLDBText2: TRLDBText
          Left = 84
          Top = 3
          Width = 72
          Height = 19
          DataField = 'Descricao'
          DataSource = dsRelatorio
        end
      end
      object RLBand2: TRLBand
        Left = 38
        Top = 105
        Width = 718
        Height = 16
        BandType = btHeader
        object RLLabel2: TRLLabel
          Left = 7
          Top = 0
          Width = 48
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'C'#243'digo'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 81
          Top = 0
          Width = 58
          Height = 16
          Alignment = taCenter
          AutoSize = False
          Caption = 'Fun'#231#227'o'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand4: TRLBand
        Left = 38
        Top = 146
        Width = 718
        Height = 25
        BandType = btFooter
        object RLLabel4: TRLLabel
          Left = 485
          Top = 0
          Width = 233
          Height = 19
          Caption = 'Francisco Carlos Pereira da Silva'
        end
      end
    end
  end
  object DBGrid1: TDBGrid
    Left = 15
    Top = 120
    Width = 320
    Height = 120
    DataSource = dsRelatorio
    TabOrder = 4
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object dsRelatorio: TDataSource
    DataSet = ListaFuncao
    Left = 384
    Top = 40
  end
  object ListaFuncao: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'codigo'
        DataType = ftInteger
      end
      item
        Name = 'Descricao'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 500
    Top = 50
    object ListaFuncaocodigo: TIntegerField
      FieldName = 'codigo'
    end
    object ListaFuncaoDescricao: TStringField
      FieldName = 'Descricao'
    end
  end
end
