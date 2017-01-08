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
    object RLBandTit: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btColumnHeader
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
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
      Top = 121
      Width = 718
      Height = 53
      BandType = btColumnFooter
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = False
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
      object RLlblValotTotal: TRLLabel
        Left = 610
        Top = 32
        Width = 84
        Height = 13
        AutoSize = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 83
      Width = 718
      Height = 38
      DataFields = 'tanque'
      object RLBandDetail: TRLBand
        Left = 0
        Top = 18
        Width = 718
        Height = 22
        object RLDBText1: TRLDBText
          Left = 111
          Top = 4
          Width = 202
          Height = 13
          AutoSize = False
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
          Left = 319
          Top = 4
          Width = 202
          Height = 13
          AutoSize = False
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
        object RLDBText4: TRLDBText
          Left = 6
          Top = 4
          Width = 99
          Height = 13
          AutoSize = False
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
        object RLDBResult1: TRLDBResult
          Left = 527
          Top = 3
          Width = 69
          Height = 16
          DataField = 'valor'
          DataSource = dsAbastecimento
          Info = riSum
          ResetAfterPrint = True
          Text = ''
        end
      end
      object RLBandCapt: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 18
        BandType = btColumnHeader
        object RLPanel1: TRLPanel
          Left = 0
          Top = 0
          Width = 718
          Height = 17
          Color = cl3DDkShadow
          ParentColor = False
          Transparent = False
        end
        object RLLabel2: TRLLabel
          Left = 111
          Top = 3
          Width = 56
          Height = 12
          Alignment = taCenter
          Caption = 'TANQUE'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel3: TRLLabel
          Left = 319
          Top = 2
          Width = 48
          Height = 13
          Alignment = taCenter
          Caption = 'BOMBA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel4: TRLLabel
          Left = 527
          Top = 2
          Width = 46
          Height = 13
          Alignment = taCenter
          Caption = 'VALOR'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel1: TRLLabel
          Left = 6
          Top = 3
          Width = 40
          Height = 13
          Alignment = taCenter
          Caption = 'DATA'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = [fsBold]
          ParentFont = False
        end
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
    FieldDefs = <
      item
        Name = 'tanque'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'bomba'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'valor'
        DataType = ftCurrency
      end
      item
        Name = 'data'
        DataType = ftDateTime
      end
      item
        Name = 'litros'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
        Fields = 'data;tanque;bomba'
        Options = [ixDescending]
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
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
