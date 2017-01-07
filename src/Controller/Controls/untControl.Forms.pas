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
  Vcl.Forms, untFmList, untFmListBomba, untFmListEmpresa, untFmListTanque,
  System.SysUtils, untFmRegEmpresa, untFmRegBomba, untFmRegTanque, untBR,
  untFmSupply;

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
        TFmList(Screen.Forms[i]).Show;
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
                Application.CreateForm(TFmRegEmpresa, FmRegEmpresa);
                FmRegEmpresa.TypeCrud := ATypeCrud;
                FmRegEmpresa.Index := AIndex;
                FmRegEmpresa.ShowModal;
                FreeAndNil(FmRegEmpresa);
              end;
            eregBomba:
              begin
                Application.CreateForm(TFmRegBomba, FmRegBomba);
                FmRegBomba.TypeCrud := ATypeCrud;
                FmRegBomba.Index := AIndex;
                FmRegBomba.ShowModal;
                FreeAndNil(FmRegBomba);
              end;
            eregTanque:
              begin
                Application.CreateForm(TFmRegTanque, FmRegTanque);
                FmRegTanque.TypeCrud := ATypeCrud;
                FmRegTanque.Index := AIndex;
                FmRegTanque.ShowModal;
                FreeAndNil(FmRegTanque);
              end;
          end;

        end;

      etcdDelete:
        begin

          case AReg of
            eregEmpresa:
              begin
                loBR := TBREmpresa.Create;
                TBREmpresa(loBR).delete(AIndex);
                FreeAndNil(loBR);
              end;

            eregBomba:
              begin
                loBR := TBRBomba.Create;
                TBRBomba(loBR).delete(AIndex);
                FreeAndNil(loBR);
              end;

            eregTanque:
              begin
                loBR := TBRBomba.Create;
                TBRBomba(loBR).delete(AIndex);
                FreeAndNil(loBR);
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
  Application.CreateForm(TFmSupply, FmSupply);
  FmSupply.ShowModal;
  FreeAndNil(FmSupply);
end;

end.
