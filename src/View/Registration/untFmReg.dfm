object FmReg: TFmReg
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro'
  ClientHeight = 358
  ClientWidth = 538
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 320
    Width = 532
    Height = 35
    Align = alBottom
    TabOrder = 0
    object btnPost: TBitBtn
      AlignWithMargins = True
      Left = 372
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnPostClick
    end
    object btnCancel: TBitBtn
      AlignWithMargins = True
      Left = 453
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object qryReg: TFDQuery
    Connection = DmConnection.Connection
    Left = 472
    Top = 192
  end
  object dsReg: TDataSource
    AutoEdit = False
    DataSet = qryReg
    Left = 472
    Top = 248
  end
end
