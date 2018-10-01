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
  object cdsAbastecimento: TClientDataSet
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
    IndexFieldNames = 'data;tanque;bomba'
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
