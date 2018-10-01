unit untFmReg.Empresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFmReg, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Mask, Vcl.DBCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, untORM;

type
  TFmRegEmpresa = class(TFmReg)
    dbedtCNPJ: TDBEdit;
    dbedtCONTATO: TDBEdit;
    dbedtDESCRICAO: TDBEdit;
    dbedtENDERECO: TDBEdit;
    lblCNPJ: TLabel;
    lblCONTATO: TLabel;
    lblDESCRICAO: TLabel;
    lblENDERECO: TLabel;
    qryRegID: TIntegerField;
    qryRegCNPJ: TStringField;
    qryRegDESCRICAO: TStringField;
    qryRegCONTATO: TStringField;
    qryRegENDERECO: TStringField;
  private

  protected
    function GetObject: TModel; override;
    function Post: Boolean; override;

  public

  end;

var
  FmRegEmpresa: TFmRegEmpresa;

implementation

uses
  untControl.Forms, untEnumerator, untBR, untEntity, untFmList.Empresa;

{$R *.dfm}

function TFmRegEmpresa.GetObject: TModel;
begin
  Result := TEmpresa.Create;
  with TEmpresa(Result) do
  begin
    id := qryRegID.Value;
    Cnpj := qryRegCNPJ.Value;
    Descricao := qryRegDESCRICAO.Value;
    Contato := qryRegCONTATO.Value;
    Endereco := qryRegENDERECO.Value;
  end;
end;

function TFmRegEmpresa.Post: Boolean;
var
  loBREmpresa: TBREmpresa;
begin
  try
    loBREmpresa := TBREmpresa.Create();

    case typecrud of
      etcdInsert:
        loBREmpresa.insert(GetObject);
      etcdUpdate:
        loBREmpresa.update(GetObject);
    end;

  finally
    FreeAndNil(loBREmpresa);
  end;

end;

end.
