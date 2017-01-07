unit untDMConnection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FBDef, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDmConnection = class(TDataModule)
    ConnectionSCA: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    tbEmpresa: TFDTable;
    tbTanque: TFDTable;
    tbEmpresaID: TIntegerField;
    tbEmpresaCNPJ: TStringField;
    tbEmpresaDESCRICAO: TStringField;
    tbEmpresaCONTATO: TStringField;
    tbEmpresaENDERECO: TStringField;
    tbTanqueID: TIntegerField;
    tbTanqueCODIGO: TStringField;
    tbTanqueDESCRICAO: TStringField;
    tbTanqueTIPO: TIntegerField;
    tbTanqueID_EMPRESA: TIntegerField;
    dsEmpresa: TDataSource;
    dsTanque: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConnection: TDmConnection;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
