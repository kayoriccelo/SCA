unit untFmReport.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient
//  ,RLReport, RLConsts
  ;

type
  TFMReportAbastecimento = class(TForm)
//    RLReportAbastecimento: TRLReport;
//    RLBandTit: TRLBand;
//    RLLabel5: TRLLabel;
    cdsAbastecimento: TClientDataSet;
    dsAbastecimento: TDataSource;
    cdsAbastecimentotanque: TStringField;
    cdsAbastecimentobomba: TStringField;
    cdsAbastecimentovalor: TCurrencyField;
    cdsAbastecimentodata: TDateTimeField;
    cdsAbastecimentolitros: TIntegerField;
//    RLBand1: TRLBand;
//    RLLabel8: TRLLabel;
//    RLlblValotTotal: TRLLabel;
//    RLGroup1: TRLGroup;
//    RLBandDetail: TRLBand;
//    RLDBText1: TRLDBText;
//    RLDBText2: TRLDBText;
//    RLDBText4: TRLDBText;
//    RLDBResult1: TRLDBResult;
//    RLBandCapt: TRLBand;
//    RLPanel1: TRLPanel;
//    RLLabel2: TRLLabel;
//    RLLabel3: TRLLabel;
//    RLLabel4: TRLLabel;
//    RLLabel1: TRLLabel;
  private
    { Private declarations }
  public
    
  end;

var
  FMReportAbastecimento: TFMReportAbastecimento;

implementation

{$R *.dfm}

end.
