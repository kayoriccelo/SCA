program SCATest;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  untTestBR in 'C:\SCA\tst\untTestBR.pas',
  untBR in 'C:\SCA\src\Controller\BR\untBR.pas',
  untDAO in 'C:\SCA\src\Model\DAO\untDAO.pas',
  untEnumerator in 'C:\SCA\src\Model\Utility\untEnumerator.pas',
  untEntity in 'C:\SCA\src\Model\Entity\untEntity.pas',
  untDMConnection in 'C:\SCA\src\Connection\untDMConnection.pas' {DmConnection: TDataModule},
  untValidation in 'C:\SCA\src\Controller\Validation\untValidation.pas';

{R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

