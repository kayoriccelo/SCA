unit untControl.Reports;

interface

uses
  untEnumerator;

type

  TControlReports = class
  private

  public
    function RunReport(AReport: eReport): boolean;
  end;

var
  ControlReports: TControlReports;

implementation

uses
  untRep.Abastecimento, System.SysUtils;

{ TControlReports }

function TControlReports.RunReport(AReport: eReport): boolean;
var
  loReport: TReport;
begin

  case AReport of
    erptAbastecimento:
      begin
        loReport := TReportAbasteccimento.Create;
        loReport.Load;
        loReport.Print;
        FreeAndNil(loReport);
      end;
  end;

end;

end.
