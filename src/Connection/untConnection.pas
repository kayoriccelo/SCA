unit untConnection;

interface

uses
  untEnumerator;

type

  TConnection = class
  private

  protected

  public

    function Connected(ATipo: eTipoConnection): Boolean;

  published

  end;

implementation

uses
  untDMConnection, Winapi.Windows, System.SysUtils;

{ TConnection }

function TConnection.Connected(ATipo: eTipoConnection): Boolean;
begin
  try
    with DmConnection.ConnectionSCA do
    begin
      Connected := False;
      Params.Database := 'K:\SCA\bd\SCA.FDB';
      Params.UserName := 'SYSDBA';
      Params.Password := 'masterkey';
      Connected := True;
    end;

  except
    on E: Exception do
      raise Exception.Create('Error ao conectar banco de dados.' + #13 + E.message);
  end;
end;

end.
