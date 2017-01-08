inherited FmRegEmpresa: TFmRegEmpresa
  Caption = 'Cadastro de empresa'
  PixelsPerInch = 96
  TextHeight = 13
  object lblCNPJ: TLabel [0]
    Left = 16
    Top = 49
    Width = 25
    Height = 13
    Caption = 'CNPJ'
  end
  object lblCONTATO: TLabel [1]
    Left = 16
    Top = 123
    Width = 49
    Height = 13
    Caption = 'CONTATO'
  end
  object lblDESCRICAO: TLabel [2]
    Left = 16
    Top = 85
    Width = 59
    Height = 13
    Caption = 'DESCRI'#199#195'O'
  end
  object lblENDERECO: TLabel [3]
    Left = 16
    Top = 160
    Width = 54
    Height = 13
    Caption = 'ENDERE'#199'O'
  end
  object dbedtCNPJ: TDBEdit [5]
    Left = 84
    Top = 46
    Width = 121
    Height = 21
    DataField = 'CNPJ'
    DataSource = dsReg
    TabOrder = 1
  end
  object dbedtCONTATO: TDBEdit [6]
    Left = 84
    Top = 120
    Width = 253
    Height = 21
    DataField = 'CONTATO'
    DataSource = dsReg
    TabOrder = 2
  end
  object dbedtDESCRICAO: TDBEdit [7]
    Left = 84
    Top = 82
    Width = 437
    Height = 21
    DataField = 'DESCRICAO'
    DataSource = dsReg
    TabOrder = 3
  end
  object dbedtENDERECO: TDBEdit [8]
    Left = 84
    Top = 157
    Width = 437
    Height = 21
    DataField = 'ENDERECO'
    DataSource = dsReg
    TabOrder = 4
  end
  inherited qryReg: TFDQuery
    SQL.Strings = (
      'select * from tb_empresa')
    object qryRegID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRegCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object qryRegDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryRegCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 40
    end
    object qryRegENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
  end
end
