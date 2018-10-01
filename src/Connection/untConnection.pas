unit untConnection;

interface

uses
  untEnumerator;

type

  TConnection = class
  private

  protected

  public

    function Connected(ATypeConnection: eTypeConnection): Boolean;

  published

  end;

implementation

uses
  untDMConnection, Winapi.Windows, System.SysUtils;

{ TConnection }

function TConnection.Connected(ATypeConnection: eTypeConnection): Boolean;
begin
  try

    with DmConnection.Connection do
    begin
      case ATypeConnection of
        etcFireBird:
          begin
            DriverName := 'FB';
            Params.Database := 'localhost:C:\SCA\bd\SCA.FDB';
            Params.UserName := 'SYSDBA';
            Params.Password := 'masterkey';
            Connected := True;
          end;
      end;

    end;

  except
    on E: Exception do
      raise Exception.create('Error ao conectar banco de dados.' + #13 + E.message);
  end;
end;

end.
