object Fr_ViewRelFuncaionarioFuncao: TFr_ViewRelFuncaionarioFuncao
  Left = 424
  Top = 188
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 121
  ClientWidth = 215
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
    Left = 16
    Top = 6
    Width = 185
    Height = 65
    Caption = 'Ordenar por:'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Nome')
    TabOrder = 0
  end
  object btnImprimir: TBitBtn
    Left = 14
    Top = 79
    Width = 83
    Height = 33
    Caption = 'Vizualizar'
    TabOrder = 1
    OnClick = btnImprimirClick
  end
  object btnCancelar: TBitBtn
    Left = 124
    Top = 79
    Width = 83
    Height = 33
    Caption = 'Fechar'
    TabOrder = 2
    OnClick = btnCancelarClick
  end
  object Panel1: TPanel
    Left = 10
    Top = 150
    Width = 926
    Height = 251
    TabOrder = 3
    Visible = False
    object RLReport1: TRLReport
      Left = 20
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
        Height = 58
        BandType = btHeader
        object RLLabel1: TRLLabel
          Left = 0
          Top = 0
          Width = 718
          Height = 23
          Align = faTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Relat'#243'rio de Funcion'#225'ros por Cargo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLSystemInfo1: TRLSystemInfo
          Left = 485
          Top = 31
          Width = 225
          Height = 14
          Alignment = taRightJustify
          AutoSize = False
          Info = itFullDate
        end
      end
      object RLGroup1: TRLGroup
        Left = 38
        Top = 96
        Width = 718
        Height = 90
        Borders.Sides = sdAll
        DataFields = 'Funcao'
        object RLBand3: TRLBand
          Left = 1
          Top = 43
          Width = 716
          Height = 17
          object RLDBText1: TRLDBText
            Left = 62
            Top = 0
            Width = 54
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'Codigo'
            DataSource = DataSource1
          end
          object RLDBText2: TRLDBText
            Left = 125
            Top = 0
            Width = 331
            Height = 14
            AutoSize = False
            DataField = 'Nome'
            DataSource = DataSource1
          end
          object RLDBText4: TRLDBText
            Left = 464
            Top = 0
            Width = 102
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'Salario'
            DataSource = DataSource1
            BeforePrint = RLDBText4BeforePrint
          end
          object RLDBText5: TRLDBText
            Left = 584
            Top = 0
            Width = 112
            Height = 14
            Alignment = taCenter
            AutoSize = False
            DataField = 'dataNascimento'
            DataSource = DataSource1
            BeforePrint = RLDBText5BeforePrint
          end
        end
        object v: TRLBand
          Left = 1
          Top = 1
          Width = 716
          Height = 42
          BandType = btHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          Borders.Color = clNone
          object RLLabel3: TRLLabel
            Left = 3
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
          object RLDBText3: TRLDBText
            Left = 62
            Top = 4
            Width = 279
            Height = 16
            AutoSize = False
            DataField = 'Funcao'
            DataSource = DataSource1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold, fsUnderline]
            ParentFont = False
          end
          object RLLabel6: TRLLabel
            Left = 127
            Top = 23
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
          object RLLabel8: TRLLabel
            Left = 462
            Top = 23
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
          object RLLabel9: TRLLabel
            Left = 584
            Top = 23
            Width = 110
            Height = 16
            Caption = 'Dt Nascimento'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Verdana'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object RLLabel4: TRLLabel
            Left = 62
            Top = 23
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
          Left = 1
          Top = 60
          Width = 716
          Height = 24
          BandType = btColumnFooter
          Borders.Sides = sdAll
        end
      end
      object RLBand2: TRLBand
        Left = 38
        Top = 186
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
    Left = 253
    Top = 62
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
