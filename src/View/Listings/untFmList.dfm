object FmList: TFmList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Listagem'
  ClientHeight = 461
  ClientWidth = 639
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdList: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 114
    Width = 633
    Height = 303
    Align = alClient
    DataSource = dsList
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object pnlButtons: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 423
    Width = 633
    Height = 35
    Align = alBottom
    TabOrder = 1
    object btnInsert: TBitBtn
      AlignWithMargins = True
      Left = 311
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Novo'
      TabOrder = 0
    end
    object btnDelete: TBitBtn
      AlignWithMargins = True
      Left = 473
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 1
    end
    object btnClose: TBitBtn
      AlignWithMargins = True
      Left = 554
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = btnCloseClick
    end
    object btnUpdt: TButton
      AlignWithMargins = True
      Left = 392
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Alterar'
      TabOrder = 3
      ExplicitLeft = 399
      ExplicitTop = 0
    end
  end
  object edtSearch: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 87
    Width = 633
    Height = 21
    Align = alTop
    TabOrder = 2
  end
  object rdgrpFilter: TRadioGroup
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 633
    Height = 78
    Align = alTop
    Caption = ' Filtro '
    TabOrder = 3
  end
  object qryList: TFDQuery
    Left = 464
    Top = 112
  end
  object dsList: TDataSource
    AutoEdit = False
    DataSet = qryList
    Left = 464
    Top = 160
  end
end
