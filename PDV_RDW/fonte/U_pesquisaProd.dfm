object Frm_Pesquisa: TFrm_Pesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 419
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 532
    Height = 65
    Align = alTop
    Color = clMenuHighlight
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 136
      Top = 17
      Width = 254
      Height = 33
      Caption = 'Pesquisa de Produtos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object pnl_Pesquisa: TPanel
    Left = 0
    Top = 65
    Width = 532
    Height = 41
    Align = alTop
    TabOrder = 1
    object edt_Descricao: TEdit
      Left = 1
      Top = 1
      Width = 530
      Height = 39
      Hint = 'Digite o nome do produto para pesquisa!'
      Align = alClient
      Color = clInfoBk
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = edt_DescricaoChange
      OnKeyDown = edt_DescricaoKeyDown
      OnKeyPress = edt_DescricaoKeyPress
      ExplicitHeight = 40
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 106
    Width = 532
    Height = 313
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    object dbg_Produtos: TDBGrid
      Left = 1
      Top = 1
      Width = 530
      Height = 311
      Align = alClient
      DataSource = dsProdutos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyPress = dbg_ProdutosKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO_PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_PRODUTO'
          Width = 319
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_PRODUTO'
          Title.Caption = 'PRE'#199'O UNIT.'
          Visible = True
        end>
    end
  end
  object dsProdutos: TDataSource
    DataSet = DM.FDProdutos
    Left = 432
    Top = 10
  end
end
