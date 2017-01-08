inherited FmRegTanque: TFmRegTanque
  Caption = 'Cadastro de tanques'
  PixelsPerInch = 96
  TextHeight = 13
  object lblCNPJ: TLabel [0]
    Left = 16
    Top = 51
    Width = 41
    Height = 13
    Caption = 'C'#211'DIGO'
  end
  object lblCONTATO: TLabel [1]
    Left = 16
    Top = 119
    Width = 24
    Height = 13
    Caption = 'TIPO'
  end
  object lblDESCRICAO: TLabel [2]
    Left = 16
    Top = 85
    Width = 59
    Height = 13
    Caption = 'DESCRI'#199#195'O'
  end
  object lblEMPRESA: TLabel [3]
    Left = 16
    Top = 155
    Width = 46
    Height = 13
    Caption = 'EMPRESA'
  end
  object dbedtCODIGO: TDBEdit [5]
    Left = 84
    Top = 48
    Width = 121
    Height = 21
    DataField = 'CODIGO'
    DataSource = dsReg
    TabOrder = 1
  end
  object dbedtDESCRICAO: TDBEdit [6]
    Left = 84
    Top = 81
    Width = 437
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsReg
    TabOrder = 2
  end
  object dbcbbTIPO: TDBComboBox [7]
    Left = 84
    Top = 116
    Width = 213
    Height = 21
    DataField = 'TIPO'
    DataSource = dsReg
    Items.Strings = (
      'Gasolina'
      #211'leo diesel')
    TabOrder = 3
  end
  object dblkpcbbEMPRESA: TDBLookupComboBox [8]
    Left = 84
    Top = 152
    Width = 437
    Height = 21
    DataField = 'ID_EMPRESA'
    DataSource = dsReg
    KeyField = 'ID'
    ListField = 'DESCRICAO'
    ListSource = DmConnection.dsEmpresa
    TabOrder = 4
  end
  inherited qryReg: TFDQuery
    SQL.Strings = (
      'select * from tb_tanque')
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
    object qryRegTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      OnGetText = qryRegTIPOGetText
      OnSetText = qryRegTIPOSetText
    end
    object qryRegID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
    end
  end
end
