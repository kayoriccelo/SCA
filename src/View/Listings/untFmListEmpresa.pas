unit untFmListEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFmList, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFmListEmpresa = class(TFmList)
    qryListID: TIntegerField;
    qryListCNPJ: TStringField;
    qryListDESCRICAO: TStringField;
    qryListCONTATO: TStringField;
    qryListENDERECO: TStringField;
    procedure edtSearchChange(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUpdtClick(Sender: TObject);
  private
    procedure refresh;
  public

  end;

var
  FmListEmpresa: TFmListEmpresa;

implementation

{$R *.dfm}

uses untDMConnection, untControl.Forms, untEnumerator;

procedure TFmListEmpresa.btnDeleteClick(Sender: TObject);
begin
  ControlForms.RunReg(eregEmpresa, etcdDelete, qryListID.Value);
  refresh;
end;

procedure TFmListEmpresa.btnInsertClick(Sender: TObject);
begin
  ControlForms.RunReg(eregEmpresa, etcdInsert, 0);
  refresh;
end;

procedure TFmListEmpresa.btnUpdtClick(Sender: TObject);
begin
  ControlForms.RunReg(eregEmpresa, etcdUpdate, qryListID.Value);
  refresh;
end;

procedure TFmListEmpresa.edtSearchChange(Sender: TObject);
begin
  qryList.Filtered := False;

  case rdgrpFilter.ItemIndex of
    0:
      qryList.Filter := ' CNPJ LIKE ' + QuotedStr(edtSearch.Text + '%');
    1:
      qryList.Filter := ' DESCRICAO LIKE ' + QuotedStr('%' + edtSearch.Text + '%');
  end;

  qryList.Filtered := True;
end;

procedure TFmListEmpresa.refresh;
begin
  qryList.Close;
  qryList.Open;
end;

end.
