unit untFmList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFmList = class(TForm)
    dbgrdList: TDBGrid;
    pnlButtons: TPanel;
    edtSearch: TEdit;
    rdgrpFilter: TRadioGroup;
    btnInsert: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    qryList: TFDQuery;
    dsList: TDataSource;
    btnUpdt: TButton;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
  private

  public

  end;

var
  FmList: TFmList;

implementation

{$R *.dfm}

uses untDMConnection;

procedure TFmList.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TFmList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryList.Close();
  Action := caFree;
end;

procedure TFmList.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TFmList.FormShow(Sender: TObject);
begin
  qryList.Open();
  WindowState := wsMaximized;
end;

end.
