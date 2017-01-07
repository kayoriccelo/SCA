inherited FmRegBomba: TFmRegBomba
  Caption = 'Cadastro de bombas'
  PixelsPerInch = 96
  TextHeight = 13
  object lblCODIGO: TLabel [0]
    Left = 16
    Top = 51
    Width = 41
    Height = 13
    Caption = 'C'#211'DIGO'
  end
  object lblDESCRICAO: TLabel [1]
    Left = 16
    Top = 85
    Width = 59
    Height = 13
    Caption = 'DESCRI'#199#195'O'
  end
  object lblTANQUE: TLabel [2]
    Left = 16
    Top = 120
    Width = 41
    Height = 13
    Caption = 'TANQUE'
  end
  object dbedtCODIGO: TDBEdit [4]
    Left = 84
    Top = 48
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = dsReg
    TabOrder = 1
  end
  object dbedtDESCRICAO: TDBEdit [5]
    Left = 84
    Top = 82
    Width = 437
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsReg
    TabOrder = 2
  end
  object dblkpcbbTANQUE: TDBLookupComboBox [6]
    Left = 84
    Top = 117
    Width = 437
    Height = 21
    DataField = 'ID_TANQUE'
    DataSource = dsReg
    KeyField = 'ID'
    ListField = 'DESCRICAO'
    ListSource = DmConnection.dsTanque
    TabOrder = 3
  end
  inherited qryReg: TFDQuery
    SQL.Strings = (
      'select * from tb_bomba')
    object qryRegID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRegCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object qryRegDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryRegID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
    end
  end
end
