object Frm_ImprimeCupom: TFrm_ImprimeCupom
  Left = 0
  Top = 0
  Caption = 'Cupom'
  ClientHeight = 175
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 80
    Top = 112
    Width = 161
    Height = 41
    Caption = 'Imprime Cupum'
    TabOrder = 0
  end
  object Cupom: TfrxReport
    Version = '6.3.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43976.902180486100000000
    ReportOptions.LastChange = 43977.833733321800000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    Left = 80
    Top = 32
  end
  object frxDs_Cupom: TfrxDBDataset
    UserName = 'frxDs_Cupom'
    CloseDataSource = False
    DataSet = Frm_PDV.cds_Itens
    BCDToCurrency = False
    Left = 168
    Top = 32
  end
end
