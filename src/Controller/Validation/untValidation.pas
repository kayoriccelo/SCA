unit untValidation;

interface

type

  TValidation = class
  private

  public

    class function validaCNPJ(ACNPJ: Variant): boolean;

  end;

implementation

uses
  System.Variants, System.SysUtils;

{ TValidation }

class function TValidation.validaCNPJ(ACNPJ: Variant): boolean;
var
  n: array [1 .. 14] of integer;
  loStrCNPJ: String;
  d1, d2: integer;
  i: integer;
begin
  try
    if ACNPJ = Null then
    begin
      raise Exception.Create('CNPJ - N�mero n�o informado');
      exit(False);
    end;

    loStrCNPJ := VarToStr(ACNPJ);
    if length(Trim(loStrCNPJ)) < 14 then
    begin
      raise Exception.Create('CNPJ - N�mero incompleto');
      exit(False);
    end;

    if ACNPJ = '00000000000000' then
    begin
      raise Exception.Create('CNPJ - n�mero zerado');
      exit(False);
    end;

    for i := 1 to 14 do
      n[i] := StrToInt(loStrCNPJ[i]);

    // Nota: Calcula o primeiro d�gito de verifica��o.
    d1 := 5 * n[1] + 4 * n[2] + 3 * n[3] + 2 * n[4];
    d1 := d1 + 9 * n[5] + 8 * n[6] + 7 * n[7] + 6 * n[8];
    d1 := d1 + 5 * n[9] + 4 * n[10] + 3 * n[11] + 2 * n[12];
    d1 := 11 - d1 mod 11;
    if d1 >= 10 then
      d1 := 0;

    // Nota: Calcula o segundo d�gito de verifica��o.
    d2 := 6 * n[1] + 5 * n[2] + 4 * n[3] + 3 * n[4];
    d2 := d2 + 2 * n[5] + 9 * n[6] + 8 * n[7] + 7 * n[8];
    d2 := d2 + 6 * n[9] + 5 * n[10] + 4 * n[11] + 3 * n[12];
    d2 := d2 + 2 * n[13];
    d2 := 11 - d2 mod 11;
    if d2 >= 10 then
      d2 := 0;

    // Nota: Verdadeiro se os d�gitos de verifica��o s�o os esperados.
    Result := (d1 = n[13]) and (d2 = n[14]);

  finally
    if not Result then
      raise Exception.Create('CNPJ - n�mero inv�lido');
  end;
end;

end.
