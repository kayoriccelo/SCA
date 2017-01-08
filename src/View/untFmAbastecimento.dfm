object FmAbastecimento: TFmAbastecimento
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Abastecimento'
  ClientHeight = 453
  ClientWidth = 676
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlAbast: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 543
    Height = 447
    Align = alClient
    TabOrder = 0
    object dbgrdList: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 155
      Width = 535
      Height = 288
      Align = alClient
      DataSource = dsAbast
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'CODIGO'
          Title.Caption = 'C'#211'DIGO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QUANTIDADE_LITROS'
          Title.Caption = 'LITROS'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPOSTO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORFINAL'
          Title.Caption = 'TOTAL'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BOMBA'
          Width = 195
          Visible = True
        end>
    end
    object Panel1: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 535
      Height = 145
      Align = alTop
      TabOrder = 1
      object lblCodigo: TLabel
        Left = 16
        Top = 19
        Width = 41
        Height = 13
        Caption = 'C'#211'DIGO'
      end
      object Label2: TLabel
        Left = 16
        Top = 84
        Width = 33
        Height = 13
        Caption = 'VALOR'
      end
      object Label3: TLabel
        Left = 16
        Top = 52
        Width = 36
        Height = 13
        Caption = 'LITROS'
      end
      object Label4: TLabel
        Left = 17
        Top = 116
        Width = 35
        Height = 13
        Caption = 'BOMBA'
      end
      object edtCODIGO: TEdit
        Left = 80
        Top = 16
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object edtLITROS: TEdit
        Left = 80
        Top = 49
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object edtVALOR: TEdit
        Left = 80
        Top = 81
        Width = 121
        Height = 21
        TabOrder = 2
      end
      object cbbBOMBA: TComboBox
        Left = 80
        Top = 113
        Width = 417
        Height = 21
        TabOrder = 3
      end
    end
  end
  object pnlCrud: TPanel
    AlignWithMargins = True
    Left = 552
    Top = 3
    Width = 121
    Height = 447
    Align = alRight
    TabOrder = 1
    object btnFinalizar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 66
      Width = 113
      Height = 25
      Align = alTop
      Caption = 'Finalizar'
      TabOrder = 0
      OnClick = btnFinalizarClick
    end
    object btnCancelar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 35
      Width = 113
      Height = 25
      Align = alTop
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnLancar: TButton
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 113
      Height = 25
      Align = alTop
      Caption = 'Lan'#231'ar'
      TabOrder = 2
      OnClick = btnLancarClick
    end
  end
  object qryAbast: TFDQuery
    Connection = DmConnection.ConnectionSCA
    SQL.Strings = (
      
        'select a.*, (a.valor +((a.valor * 30) / 100)) as valorfinal, ((a' +
        '.valor * 30) / 100) as imposto, b.descricao as bomba from tb_aba' +
        'stecimento a'
      'left join tb_bomba b on b.id = a.id_bomba')
    Left = 68
    Top = 336
    object qryAbastID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryAbastCODIGO: TStringField
      FieldName = 'CODIGO'
      Origin = 'CODIGO'
      Size = 10
    end
    object qryAbastQUANTIDADE_LITROS: TBCDField
      FieldName = 'QUANTIDADE_LITROS'
      Origin = 'QUANTIDADE_LITROS'
      Precision = 18
    end
    object qryAbastVALOR: TBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      Precision = 18
    end
    object qryAbastID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
    end
    object qryAbastBOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'BOMBA'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 200
    end
    object qryAbastDATA: TDateField
      FieldName = 'DATA'
      Origin = '"DATA"'
    end
    object qryAbastVALORFINAL: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'VALORFINAL'
      Origin = 'VALORFINAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
    object qryAbastIMPOSTO: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'IMPOSTO'
      Origin = 'IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
  end
  object dsAbast: TDataSource
    AutoEdit = False
    DataSet = qryAbast
    Left = 68
    Top = 384
  end
end
