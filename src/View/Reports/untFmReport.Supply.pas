unit untFmReport.Supply;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, RLConsts, Data.DB, Datasnap.DBClient;

type
  TFMReportSupply = class(TForm)
    RLReportSupply: TRLReport;
    RLBandCapt: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel1: TRLLabel;
    RLBandDetail: TRLBand;
    RLBandTit: TRLBand;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDraw1: TRLDraw;
    cdsAbastecimento: TClientDataSet;
    dsAbastecimento: TDataSource;
    cdsAbastecimentotanque: TStringField;
    cdsAbastecimentobomba: TStringField;
    cdsAbastecimentovalor: TCurrencyField;
    cdsAbastecimentodata: TDateTimeField;
    cdsAbastecimentolitros: TIntegerField;
    RLLabel6: TRLLabel;
    RLDBText5: TRLDBText;
    RLBand1: TRLBand;
    RLlblTotalLitros: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLlblValotTotal: TRLLabel;
  private
    { Private declarations }
  public
    
  end;

var
  FMReportSupply: TFMReportSupply;

implementation

{$R *.dfm}

end.
