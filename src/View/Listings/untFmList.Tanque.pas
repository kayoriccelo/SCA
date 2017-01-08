unit untFmList.Tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFmList, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFmListTanque = class(TFmList)
    qryListID: TIntegerField;
    qryListCODIGO: TStringField;
    qryListDESCRICAO: TStringField;
    qryListTIPO: TIntegerField;
    qryListID_EMPRESA: TIntegerField;
    qryListEMPRESA: TStringField;
    procedure edtSearchChange(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnUpdtClick(Sender: TObject);
  private
    procedure refresh;
  public

  end;

var
  FmListTanque: TFmListTanque;

implementation

{$R *.dfm}

uses untDMConnection, untControl.Forms, untEnumerator;

procedure TFmListTanque.btnDeleteClick(Sender: TObject);
begin
  ControlForms.RunReg(eregTanque, etcdDelete, qryListID.Value);
  refresh;
end;

procedure TFmListTanque.btnInsertClick(Sender: TObject);
begin
  ControlForms.RunReg(eregTanque, etcdInsert, 0);
  refresh;
end;

procedure TFmListTanque.btnUpdtClick(Sender: TObject);
begin
  ControlForms.RunReg(eregTanque, etcdUpdate, qryListID.Value);
  refresh;
end;

procedure TFmListTanque.edtSearchChange(Sender: TObject);
begin
  qryList.Filtered := False;

  case rdgrpFilter.ItemIndex of
    0:
      qryList.Filter := ' CODIGO LIKE ' + QuotedStr(edtSearch.Text + '%');
    1:
      qryList.Filter := ' DESCRICAO LIKE ' + QuotedStr('%' + edtSearch.Text + '%');
    2:
      qryList.Filter := ' EMPRESA LIKE ' + QuotedStr('%' + edtSearch.Text + '%');
  end;

  qryList.Filtered := True;
end;

procedure TFmListTanque.refresh;
begin
  qryList.Close;
  qryList.Open;
end;

end.
