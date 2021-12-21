object Fr_ViewListaFuncoes: TFr_ViewListaFuncoes
  Left = 571
  Top = 198
  Width = 393
  Height = 369
  BorderIcons = []
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 41
    Align = alTop
    Caption = 'Listagem de Fun'#231#245'es'
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel4: TPanel
    Left = 0
    Top = 41
    Width = 385
    Height = 30
    Align = alTop
    Caption = 'Listagem de Fun'#231#245'es'
    TabOrder = 1
    Visible = False
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
  object ListViewExemplo: TListView
    Left = 0
    Top = 71
    Width = 385
    Height = 267
    Align = alClient
    Columns = <
      item
        Caption = 'C'#243'digo'
        Width = 80
      end
      item
        Caption = 'Nome Fun'#231#227'o'
        Width = 300
      end>
    GridLines = True
    HideSelection = False
    Items.Data = {
      2D0000000100000000000000FFFFFFFFFFFFFFFF01000000000000000231300B
      50726F6772616D61646F72FFFF}
    MultiSelect = True
    RowSelect = True
    SortType = stText
    TabOrder = 2
    ViewStyle = vsReport
    OnDblClick = ListViewExemploDblClick
  end
end
