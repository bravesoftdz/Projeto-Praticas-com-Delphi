object frm_ConsultaDizimo: Tfrm_ConsultaDizimo
  Left = 0
  Top = 0
  Caption = 'Consulta Dizimo por data de lan'#231'amento'
  ClientHeight = 487
  ClientWidth = 981
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 294
    Height = 19
    Caption = 'Entre com a Data de Abertura do Dizimo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 167
    Width = 981
    Height = 249
    Align = alBottom
    DataSource = ds_TabelaConsulta
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'CDFICHA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOMEDIZ'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VLRDOACAO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTLANCAMENTO'
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 416
    Width = 981
    Height = 71
    Align = alBottom
    TabOrder = 1
    object lbl_Totaliza: TLabel
      Left = 464
      Top = 42
      Width = 53
      Height = 13
      Caption = 'lbl_Totaliza'
    end
    object Label2: TLabel
      Left = 355
      Top = 42
      Width = 86
      Height = 13
      Caption = 'Total arrecadado:'
    end
    object Label3: TLabel
      Left = 349
      Top = 19
      Width = 92
      Height = 13
      Caption = 'Total de Dizimistas:'
    end
    object lbl_TotalDizimistas: TLabel
      Left = 464
      Top = 19
      Width = 86
      Height = 13
      Caption = 'lbl_TotalDizimistas'
    end
    object Button1: TButton
      Left = 856
      Top = 26
      Width = 113
      Height = 33
      Caption = 'Soma'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object edt_DataAbertura: TEdit
    Left = 355
    Top = 37
    Width = 121
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object ds_TabelaConsulta: TDataSource
    DataSet = DM_Dados.cds_Lancamento
    Left = 728
    Top = 40
  end
end