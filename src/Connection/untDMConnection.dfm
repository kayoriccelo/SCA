object DmConnection: TDmConnection
  OldCreateOrder = False
  Height = 239
  Width = 342
  object ConnectionSCA: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'Database=K:\SCA\bd\SCA.FDB'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 16
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 168
    Top = 16
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 256
    Top = 32
  end
  object tbEmpresa: TFDTable
    IndexFieldNames = 'ID'
    Connection = ConnectionSCA
    UpdateOptions.UpdateTableName = 'TB_EMPRESA'
    TableName = 'TB_EMPRESA'
    Left = 96
    Top = 104
    object tbEmpresaID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbEmpresaCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object tbEmpresaDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object tbEmpresaCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 40
    end
    object tbEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
  end
  object tbTanque: TFDTable
    IndexFieldNames = 'ID'
    Connection = ConnectionSCA
    UpdateOptions.UpdateTableName = 'TB_TANQUE'
    TableName = 'TB_TANQUE'
    Left = 176
    Top = 104
    object tbTanqueID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object tbTanqueCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object tbTanqueDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object tbTanqueTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object tbTanqueID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
    end
  end
  object dsEmpresa: TDataSource
    DataSet = tbEmpresa
    Left = 88
    Top = 168
  end
  object dsTanque: TDataSource
    DataSet = tbTanque
    Left = 176
    Top = 176
  end
end
