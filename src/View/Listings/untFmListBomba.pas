unit untFmListBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untFmList, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TFmListBomba = class(TFmList)
    qryListID: TIntegerField;
    qryListCODIGO: TStringField;
    qryListDESCRICAO: TStringField;
    qryListID_TANQUE: TIntegerField;
    qryListTANQUE: TStringField;
    procedure edtSearchChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdtClick(Sender: TObject);
  private
    procedure refresh;
  public

  end;

var
  FmListBomba: TFmListBomba;

implementation

{$R *.dfm}

uses untDMConnection, untControl.Forms, untEnumerator;

procedure TFmListBomba.btnDeleteClick(Sender: TObject);
begin
  ControlForms.RunReg(eregBomba, etcdDelete, qryListID.Value);
  refresh;
end;

procedure TFmListBomba.btnInsertClick(Sender: TObject);
begin
  ControlForms.RunReg(eregBomba, etcdInsert, 0);
  refresh;
end;

procedure TFmListBomba.btnUpdtClick(Sender: TObject);
begin
  ControlForms.RunReg(eregBomba, etcdUpdate, qryListID.Value);
  refresh;
end;

procedure TFmListBomba.edtSearchChange(Sender: TObject);
begin
  qryList.Filtered := False;

  case rdgrpFilter.ItemIndex of
    0:
      qryList.Filter := ' CODIGO LIKE ' + QuotedStr(edtSearch.Text + '%');
    1:
      qryList.Filter := ' DESCRICAO LIKE ' + QuotedStr('%' + edtSearch.Text + '%');
    2:
      qryList.Filter := ' TANQUE LIKE ' + QuotedStr('%' + edtSearch.Text + '%');
  end;

  qryList.Filtered := True;
end;

procedure TFmListBomba.refresh;
begin
  qryList.Close;
  qryList.Open;
end;

end.
