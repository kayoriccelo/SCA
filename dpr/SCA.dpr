program SCA;

uses
  Vcl.Forms,
  untConnection in '..\src\Connection\untConnection.pas',
  untBR in '..\src\Controller\BR\untBR.pas',
  untValidation in '..\src\Controller\Validation\untValidation.pas',
  untDAO in '..\src\Model\DAO\untDAO.pas',
  untEntity in '..\src\Model\Entity\untEntity.pas',
  untFmPrincipal in '..\src\View\untFmPrincipal.pas' {FmMain},
  untDMConnection in '..\src\Connection\untDMConnection.pas' {DmConnection: TDataModule},
  untEnumerator in '..\src\Model\Utility\untEnumerator.pas',
  untHelper.Abastecimento in '..\src\Model\Helper\untHelper.Abastecimento.pas',
  untFmList in '..\src\View\Listings\untFmList.pas' {FmList},
  untFmReg in '..\src\View\Registration\untFmReg.pas' {FmReg},
  untFmList.Empresa in '..\src\View\Listings\untFmList.Empresa.pas' {FmListEmpresa},
  untFmList.Tanque in '..\src\View\Listings\untFmList.Tanque.pas' {FmListTanque},
  untFmList.Bomba in '..\src\View\Listings\untFmList.Bomba.pas' {FmListBomba},
  untFmReg.Empresa in '..\src\View\Registration\untFmReg.Empresa.pas' {FmRegEmpresa},
  untFmReg.Tanque in '..\src\View\Registration\untFmReg.Tanque.pas' {FmRegTanque},
  untFmReg.Bomba in '..\src\View\Registration\untFmReg.Bomba.pas' {FmRegBomba},
  untFmAbastecimento in '..\src\View\untFmAbastecimento.pas' {FmAbastecimento},
  untControl.Forms in '..\src\Controller\Controls\untControl.Forms.pas',
  untControl.Reports in '..\src\Controller\Controls\untControl.Reports.pas',
  untRep.Abastecimento in '..\src\Model\Reports\untRep.Abastecimento.pas',
  untFmReport.Abastecimento in '..\src\View\Reports\untFmReport.Abastecimento.pas' {FMReportAbastecimento};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConnection, DmConnection);
  Application.CreateForm(TFmMain, FmMain);
  Application.CreateForm(TFmAbastecimento, FmAbastecimento);
  Application.CreateForm(TFMReportAbastecimento, FMReportAbastecimento);
  Application.Run;
end.
