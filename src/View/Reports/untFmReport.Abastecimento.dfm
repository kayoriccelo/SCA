object FMReportAbastecimento: TFMReportAbastecimento
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio'
  ClientHeight = 632
  ClientWidth = 794
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object RLReportAbastecimento: TRLReport
    AlignWithMargins = True
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    AdjustableMargins = True
    DataSource = dsAbastecimento
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBandCapt: TRLBand
      Left = 38
      Top = 83
      Width = 718
      Height = 35
      BandType = btColumnHeader
      object RLLabel2: TRLLabel
        Left = 6
        Top = 13
        Width = 56
        Height = 13
        Alignment = taCenter
        Caption = 'TANQUE'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel3: TRLLabel
        Left = 214
        Top = 13
        Width = 48
        Height = 13
        Alignment = taCenter
        Caption = 'BOMBA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel4: TRLLabel
        Left = 491
        Top = 13
        Width = 46
        Height = 13
        Alignment = taCenter
        Caption = 'VALOR'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel1: TRLLabel
        Left = 603
        Top = 13
        Width = 40
        Height = 13
        Alignment = taCenter
        Caption = 'DATA'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 0
        Top = 32
        Width = 719
        Height = 1
      end
      object RLLabel6: TRLLabel
        Left = 421
        Top = 13
        Width = 50
        Height = 13
        Alignment = taCenter
        Caption = 'LITROS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBandDetail: TRLBand
      Left = 38
      Top = 118
      Width = 718
      Height = 38
      object RLDBText1: TRLDBText
        Left = 6
        Top = 16
        Width = 202
        Height = 13
        DataField = 'TANQUE'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 214
        Top = 16
        Width = 202
        Height = 13
        DataField = 'BOMBA'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 491
        Top = 16
        Width = 97
        Height = 13
        Alignment = taCenter
        DataField = 'VALOR'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 606
        Top = 16
        Width = 99
        Height = 13
        DataField = 'DATA'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 421
        Top = 16
        Width = 59
        Height = 13
        Alignment = taCenter
        DataField = 'litros'
        DataSource = dsAbastecimento
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
        Text = ''
      end
    end
    object RLBandTit: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btHeader
      object RLLabel5: TRLLabel
        Left = 227
        Top = 11
        Width = 318
        Height = 23
        Caption = 'Relat'#243'rio de Abastecimentos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 156
      Width = 718
      Height = 53
      BandType = btFooter
      object RLlblTotalLitros: TRLLabel
        Left = 412
        Top = 32
        Width = 84
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
      object RLLabel8: TRLLabel
        Left = 514
        Top = 32
        Width = 90
        Height = 13
        Alignment = taCenter
        Caption = 'VALOR TOTAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLLabel9: TRLLabel
        Left = 290
        Top = 32
        Width = 116
        Height = 13
        Alignment = taCenter
        Caption = 'TOTAL DE LITROS'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLlblValotTotal: TRLLabel
        Left = 615
        Top = 32
        Width = 84
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object cdsAbastecimento: TClientDataSet
    PersistDataPacket.Data = {
      8D0000009619E0BD0100000018000000050000000000030000008D000674616E
      717565010049000000010005574944544802000200C80005626F6D6261010049
      000000010005574944544802000200C8000576616C6F72080004000000010007
      535542545950450200490006004D6F6E65790004646174610800080000000000
      066C6974726F7304000100000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 128
    Top = 248
    object cdsAbastecimentotanque: TStringField
      FieldName = 'tanque'
      Size = 200
    end
    object cdsAbastecimentobomba: TStringField
      FieldName = 'bomba'
      Size = 200
    end
    object cdsAbastecimentovalor: TCurrencyField
      FieldName = 'valor'
    end
    object cdsAbastecimentodata: TDateTimeField
      FieldName = 'data'
    end
    object cdsAbastecimentolitros: TIntegerField
      FieldName = 'litros'
    end
  end
  object dsAbastecimento: TDataSource
    AutoEdit = False
    DataSet = cdsAbastecimento
    Left = 128
    Top = 304
  end
end
