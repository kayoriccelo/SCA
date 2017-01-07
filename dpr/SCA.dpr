program SCA;

uses
  Vcl.Forms,
  untConnection in '..\src\Connection\untConnection.pas',
  untBR in '..\src\Controller\BR\untBR.pas',
  untValidation in '..\src\Controller\Validation\untValidation.pas',
  untDAO in '..\src\Model\DAO\untDAO.pas',
  untEntity in '..\src\Model\Entity\untEntity.pas',
  untFmMain in '..\src\View\untFmMain.pas' {FmMain},
  untDMConnection in '..\src\Connection\untDMConnection.pas' {DmConnection: TDataModule},
  untEnumerator in '..\src\Model\Utility\untEnumerator.pas',
  untHelper.Abastecimento in '..\src\Model\Helper\untHelper.Abastecimento.pas',
  untFmList in '..\src\View\Listings\untFmList.pas' {FmList},
  untFmReg in '..\src\View\Registration\untFmReg.pas' {FmReg},
  untFmListEmpresa in '..\src\View\Listings\untFmListEmpresa.pas' {FmListEmpresa},
  untFmListTanque in '..\src\View\Listings\untFmListTanque.pas' {FmListTanque},
  untFmListBomba in '..\src\View\Listings\untFmListBomba.pas' {FmListBomba},
  untFmRegEmpresa in '..\src\View\Registration\untFmRegEmpresa.pas' {FmRegEmpresa},
  untFmRegTanque in '..\src\View\Registration\untFmRegTanque.pas' {FmRegTanque},
  untFmRegBomba in '..\src\View\Registration\untFmRegBomba.pas' {FmRegBomba},
  untFmSupply in '..\src\View\untFmSupply.pas' {FmSupply},
  untControl.Forms in '..\src\Controller\Controls\untControl.Forms.pas',
  untControl.Reports in '..\src\Controller\Controls\untControl.Reports.pas',
  untRep.Supply in '..\src\Model\Reports\untRep.Supply.pas',
  untFmReport.Supply in '..\src\View\Reports\untFmReport.Supply.pas' {FMReportSupply};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConnection, DmConnection);
  Application.CreateForm(TFmMain, FmMain);
  Application.CreateForm(TFmSupply, FmSupply);
  Application.CreateForm(TFMReportSupply, FMReportSupply);
  Application.Run;
end.
