object FmList: TFmList
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Listagem'
  ClientHeight = 471
  ClientWidth = 649
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
    Width = 643
    Height = 313
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
    Top = 433
    Width = 643
    Height = 35
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 423
    ExplicitWidth = 633
    object btnInsert: TBitBtn
      AlignWithMargins = True
      Left = 321
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Novo'
      TabOrder = 0
      ExplicitLeft = 311
    end
    object btnDelete: TBitBtn
      AlignWithMargins = True
      Left = 483
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Excluir'
      TabOrder = 1
      ExplicitLeft = 473
    end
    object btnClose: TBitBtn
      AlignWithMargins = True
      Left = 564
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = btnCloseClick
      ExplicitLeft = 554
    end
    object btnUpdt: TButton
      AlignWithMargins = True
      Left = 402
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Alterar'
      TabOrder = 3
      ExplicitLeft = 392
    end
  end
  object edtSearch: TEdit
    AlignWithMargins = True
    Left = 3
    Top = 87
    Width = 643
    Height = 21
    Align = alTop
    TabOrder = 2
    ExplicitWidth = 633
  end
  object rdgrpFilter: TRadioGroup
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 643
    Height = 78
    Align = alTop
    Caption = ' Filtro '
    TabOrder = 3
    ExplicitWidth = 633
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
