object Frm_ApagaItem: TFrm_ApagaItem
  Left = 0
  Top = 0
  Caption = 'ApagarItem'
  ClientHeight = 64
  ClientWidth = 247
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 247
    Height = 64
    Align = alClient
    Color = 2763429
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 56
    ExplicitTop = 32
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 1
      Top = 38
      Width = 245
      Height = 25
      Align = alBottom
      Alignment = taCenter
      Caption = 'DIGITE O C'#211'DIGO DO ITEM'
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      ExplicitTop = 53
      ExplicitWidth = 229
    end
    object edt_Item: TEdit
      Left = 1
      Top = 1
      Width = 245
      Height = 38
      Align = alTop
      Color = 9234160
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyDown = edt_ItemKeyDown
      OnKeyPress = edt_ItemKeyPress
      ExplicitWidth = 290
    end
  end
end
