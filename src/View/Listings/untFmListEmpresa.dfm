inherited FmListEmpresa: TFmListEmpresa
  Caption = 'Listagem de empresas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrdList: TDBGrid
    Top = 82
    Height = 335
    Columns = <
      item
        Expanded = False
        FieldName = 'CNPJ'
        Title.Caption = 'Cnpj'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Width = 440
        Visible = True
      end>
  end
  inherited pnlButtons: TPanel
    inherited btnInsert: TBitBtn
      OnClick = btnInsertClick
    end
    inherited btnDelete: TBitBtn
      OnClick = btnDeleteClick
    end
    inherited btnUpdt: TButton
      OnClick = btnUpdtClick
      ExplicitLeft = 392
      ExplicitTop = 4
    end
  end
  inherited edtSearch: TEdit
    Top = 55
    OnChange = edtSearchChange
    ExplicitTop = 55
  end
  inherited rdgrpFilter: TRadioGroup
    Height = 46
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Cnpj'
      'Descri'#231#227'o')
    ExplicitHeight = 46
  end
  inherited qryList: TFDQuery
    Connection = DmConnection.ConnectionSCA
    SQL.Strings = (
      'select * from tb_empresa')
    object qryListID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object qryListDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryListCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      Size = 40
    end
    object qryListENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 200
    end
  end
end
