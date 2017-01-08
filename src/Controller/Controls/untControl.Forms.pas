unit untControl.Forms;

interface

uses
  untEnumerator;

type

  TControlForms = class
  private

    function GetFmList(AList: eList): String;

    procedure InstanceList(AList: eList);

  public
    function RunList(AList: eList): boolean;
    function RunReg(AReg: eRegistration; ATypeCrud: eTypeCrud; AIndex: Integer): boolean;
    function RunSupply: boolean;
  end;

var
  ControlForms: TControlForms;

implementation

uses
  Vcl.Forms, untFmList, untFmList.Bomba, untFmList.Empresa, untFmList.Tanque,
  System.SysUtils, untFmReg.Empresa, untFmReg.Bomba, untFmReg.Tanque, untBR,
  untFmAbastecimento;

{ TControlForms }

function TControlForms.GetFmList(AList: eList): String;
begin
  case AList of
    elstEmpresa:
      result := 'FmListEmpresa';
    elstBomba:
      result := 'FmListBomba';
    elstTanque:
      result := 'FmListTanque';
  end;
end;

procedure TControlForms.InstanceList(AList: eList);
begin
  case AList of
    elstEmpresa:
      begin
        Application.CreateForm(TFmListEmpresa, FmListEmpresa);
        FmListEmpresa.Show;
      end;
    elstBomba:
      begin
        Application.CreateForm(TFmListBomba, FmListBomba);
        FmListBomba.Show;
      end;
    elstTanque:
      begin
        Application.CreateForm(TFmListTanque, FmListTanque);
        FmListTanque.Show;
      end;
  end;
end;

function TControlForms.RunList(AList: eList): boolean;
var
  i: Integer;
begin
  result := True;

  try
    for i := 0 to pred(Screen.FormCount) do
      if TFmList(Screen.Forms[i]).Name = GetFmList(AList) then
      begin
        TFmList(Screen.Forms[i]).BringToFront;

        exit();
      end;

    InstanceList(AList);
  except
    { TODO -oKayoRiccelo -cExceção : implementar exceção }
    result := False;
  end;
end;

function TControlForms.RunReg(AReg: eRegistration; ATypeCrud: eTypeCrud; AIndex: Integer): boolean;
var
  loBR: TBR;

begin
  result := True;

  try
    case ATypeCrud of
      etcdInsert, etcdUpdate:
        begin

          case AReg of
            eregEmpresa:
              begin
                try
                  Application.CreateForm(TFmRegEmpresa, FmRegEmpresa);
                  FmRegEmpresa.TypeCrud := ATypeCrud;
                  FmRegEmpresa.Index := AIndex;
                  FmRegEmpresa.ShowModal;
                finally
                  FreeAndNil(FmRegEmpresa);
                end;
              end;
            eregBomba:
              begin
                try
                  Application.CreateForm(TFmRegBomba, FmRegBomba);
                  FmRegBomba.TypeCrud := ATypeCrud;
                  FmRegBomba.Index := AIndex;
                  FmRegBomba.ShowModal;
                finally
                  FreeAndNil(FmRegBomba);
                end;
              end;
            eregTanque:
              begin
                try
                  Application.CreateForm(TFmRegTanque, FmRegTanque);
                  FmRegTanque.TypeCrud := ATypeCrud;
                  FmRegTanque.Index := AIndex;
                  FmRegTanque.ShowModal;
                finally
                  FreeAndNil(FmRegTanque);
                end;
              end;
          end;

        end;

      etcdDelete:
        begin

          case AReg of
            eregEmpresa:
              begin
                try
                  loBR := TBREmpresa.Create;
                  TBREmpresa(loBR).delete(AIndex);
                finally
                  FreeAndNil(loBR);
                end;
              end;

            eregBomba:
              begin
                try
                  loBR := TBRBomba.Create;
                  TBRBomba(loBR).delete(AIndex);
                finally
                  FreeAndNil(loBR);
                end;
              end;

            eregTanque:
              begin
                try
                  loBR := TBRBomba.Create;
                  TBRBomba(loBR).delete(AIndex);
                finally
                  FreeAndNil(loBR);
                end;
              end;

          end;

        end;
    end;

  except
    { TODO -oKayoRiccelo -cExceção : implementar exceção }
    result := False;
  end;
end;

function TControlForms.RunSupply: boolean;
begin
  try
    Application.CreateForm(TFmAbastecimento, FmAbastecimento);
    FmAbastecimento.ShowModal;
  finally
    FreeAndNil(FmAbastecimento);
  end;
end;

end.
