unit untFmRegBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFmReg, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFmRegBomba = class(TFmReg)
    dbedtCODIGO: TDBEdit;
    dbedtDESCRICAO: TDBEdit;
    lblCODIGO: TLabel;
    lblDESCRICAO: TLabel;
    lblTANQUE: TLabel;
    dblkpcbbTANQUE: TDBLookupComboBox;
    qryRegID: TIntegerField;
    qryRegCODIGO: TStringField;
    qryRegDESCRICAO: TStringField;
    qryRegID_TANQUE: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private

  protected
    function GetObject: TObject; override;
    function Post: Boolean; override;

  public

  end;

var
  FmRegBomba: TFmRegBomba;

implementation

uses
  untEntity, untBR, untEnumerator, untDMConnection, untFmListBomba;

{$R *.dfm}
{ TFmRegBomba }

procedure TFmRegBomba.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmConnection.tbTanque.Close();
end;

procedure TFmRegBomba.FormShow(Sender: TObject);
begin
  inherited;
  DmConnection.tbTanque.Open();
end;

function TFmRegBomba.GetObject: TObject;
var
  loBRTanque: TBRTanque;
begin
  try
    Result := TBomba.Create;
    loBRTanque := TBRTanque.Create;

    with TBomba(Result) do
    begin
      id := qryRegID.Value;
      Codigo := qryRegCODIGO.Value;
      Descricao := qryRegDESCRICAO.Value;
      Tanque := TTanque(loBRTanque.select(qryRegID_TANQUE.Value));
    end;

  finally
    FreeAndNil(loBRTanque);
  end;
end;

function TFmRegBomba.Post: Boolean;
var
  loBRBomba: TBRBomba;
begin
  try
    loBRBomba := TBRBomba.Create;

    case typecrud of
      etcdInsert:
        loBRBomba.insert(GetObject);
      etcdUpdate:
        loBRBomba.update(GetObject);
    end;

  finally
    FreeAndNil(loBRBomba);
  end;

end;

end.
