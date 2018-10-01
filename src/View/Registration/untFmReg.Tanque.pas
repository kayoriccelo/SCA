unit untFmReg.Tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFmReg, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, untEntity, untORM;

type
  TFmRegTanque = class(TFmReg)
    dbedtCODIGO: TDBEdit;
    dbedtDESCRICAO: TDBEdit;
    lblCNPJ: TLabel;
    lblCONTATO: TLabel;
    lblDESCRICAO: TLabel;
    lblEMPRESA: TLabel;
    dbcbbTIPO: TDBComboBox;
    dblkpcbbEMPRESA: TDBLookupComboBox;
    qryRegID: TIntegerField;
    qryRegCODIGO: TStringField;
    qryRegDESCRICAO: TStringField;
    qryRegTIPO: TIntegerField;
    qryRegID_EMPRESA: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryRegTIPOSetText(Sender: TField; const Text: string);
    procedure qryRegTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
  private

  protected
    function GetObject: TModel; override;
    function Post: Boolean; override;

  public

  end;

var
  FmRegTanque: TFmRegTanque;

implementation

{$R *.dfm}

uses untDMConnection, untBR, untEnumerator, untFmList.Tanque;

procedure TFmRegTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmConnection.tbEmpresa.Close;
end;

procedure TFmRegTanque.FormShow(Sender: TObject);
begin
  inherited;
  DmConnection.tbEmpresa.Open();
end;

function TFmRegTanque.GetObject: TModel;
var
  loBREmpresa: TBREmpresa;
begin
  try
    Result := TTanque.Create;
    loBREmpresa := TBREmpresa.Create(TEmpresa);

    with TTanque(Result) do
    begin
      id := qryRegID.Value;
      Codigo := qryRegCODIGO.Value;
      Descricao := qryRegDESCRICAO.Value;
      Tipo := qryRegTIPO.Value;
      Empresa := TEmpresa(loBREmpresa.select(qryRegID_EMPRESA.Value));
    end;

  finally
    FreeAndNil(loBREmpresa);
  end;
end;

function TFmRegTanque.Post: Boolean;
var
  loBRTanque: TBRTanque;
begin
  try
    loBRTanque := TBRTanque.Create(TTanque);

    case typecrud of
      etcdInsert:
        loBRTanque.insert(GetObject);
      etcdUpdate:
        loBRTanque.update(GetObject);
    end;

  finally
    FreeAndNil(loBRTanque);
  end;
end;

procedure TFmRegTanque.qryRegTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if Sender.Value = 0 then
    Text := 'Gasolina'
  else if Sender.Value = 1 then
    Text := 'Óleo diesel';
end;

procedure TFmRegTanque.qryRegTIPOSetText(Sender: TField; const Text: string);
begin
  if Text = 'Gasolina' then
    Sender.Value := 0
  else if Text = 'Óleo diesel' then
    Sender.Value := 1
end;

end.
