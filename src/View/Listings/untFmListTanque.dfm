inherited FmListTanque: TFmListTanque
  Caption = 'Listagem de tanques'
  PixelsPerInch = 96
  TextHeight = 13
  inherited dbgrdList: TDBGrid
    Top = 82
    Height = 335
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Title.Caption = 'C'#243'digo'
        Width = 40
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 275
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Caption = 'Empresa'
        Width = 275
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
    Columns = 3
    ItemIndex = 1
    Items.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o'
      'Empresa')
    ExplicitHeight = 46
  end
  inherited qryList: TFDQuery
    Connection = DmConnection.ConnectionSCA
    SQL.Strings = (
      'select t.*,e.descricao as empresa from tb_tanque t '
      'left join tb_empresa e on e.id = t.id_empresa'
      '')
    object qryListID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryListCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object qryListDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 200
    end
    object qryListTIPO: TIntegerField
      FieldName = 'TIPO'
      Origin = 'TIPO'
    end
    object qryListID_EMPRESA: TIntegerField
      FieldName = 'ID_EMPRESA'
      Origin = 'ID_EMPRESA'
    end
    object qryListEMPRESA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'EMPRESA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
  end
end
