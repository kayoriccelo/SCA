unit untFmSupply;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFmSupply = class(TForm)
    qryAbast: TFDQuery;
    dsAbast: TDataSource;
    qryAbastID: TIntegerField;
    qryAbastCODIGO: TStringField;
    qryAbastQUANTIDADE_LITROS: TBCDField;
    qryAbastVALOR: TBCDField;
    qryAbastID_BOMBA: TIntegerField;
    pnlAbast: TPanel;
    dbgrdList: TDBGrid;
    Panel1: TPanel;
    pnlCrud: TPanel;
    btnFinalizar: TButton;
    btnCancelar: TButton;
    btnLancar: TButton;
    edtCODIGO: TEdit;
    edtLITROS: TEdit;
    edtVALOR: TEdit;
    cbbBOMBA: TComboBox;
    lblCodigo: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qryAbastBOMBA: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnLancarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnFinalizarClick(Sender: TObject);
  private
    procedure refresh;
  public
    { Public declarations }
  end;

var
  FmSupply: TFmSupply;

implementation

{$R *.dfm}

uses untDMConnection, untEntity, System.Generics.Collections, untBR;

procedure TFmSupply.btnCancelarClick(Sender: TObject);
var
  loBRAbast: TBRAbastecimento;

begin
  try
    loBRAbast := TBRAbastecimento.Create;

    loBRAbast.delete(qryAbastID.Value);

    refresh;

  finally
    FreeAndNil(loBRAbast);
  end;
end;

procedure TFmSupply.btnFinalizarClick(Sender: TObject);
begin
  Close;
end;

procedure TFmSupply.btnLancarClick(Sender: TObject);
var
  loBRAbast: TBRAbastecimento;
  loAbast: TAbastecimento;
  loBRBomba: TBRBomba;

begin
  try
    loBRAbast := TBRAbastecimento.Create;
    loBRBomba := TBRBomba.Create;

    loAbast := TAbastecimento.Create;
    loAbast.Codigo := edtCODIGO.Text;
    loAbast.QuantidadeLitros := StrToFloat(edtLITROS.Text);
    loAbast.Valor := StrToFloat(edtVALOR.Text);
    loAbast.Data := Now;
    loAbast.Bomba := TBomba(loBRBomba.select(cbbBOMBA.ItemIndex + 1));

    loBRAbast.insert(loAbast);

    refresh;

  finally
    FreeAndNil(loBRAbast);
    FreeAndNil(loBRBomba);
  end;
end;

procedure TFmSupply.FormShow(Sender: TObject);
var
  loBomba: TBomba;
  loBRBomb: TBRBomba;

begin
  try

    loBRBomb := TBRBomba.Create;

    for loBomba in TList<TBomba>(loBRBomb.list) do
    begin
      cbbBOMBA.Items.Add(loBomba.Descricao);
    end;

  finally
    FreeAndNil(loBRBomb);
  end;
end;

procedure TFmSupply.refresh;
begin
  qryAbast.Close;
  qryAbast.Open();
end;

end.
