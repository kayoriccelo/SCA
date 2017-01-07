unit untHelper.Abastecimento;

interface

uses untEntity;

type

  THelperAbastecimento = class Helper for TAbastecimento
  private
    function GetImposto: Currency;
    function GetValorFinal: Currency;
  public
    property Imposto: Currency read GetValorFinal;
    property ValorFinal: Currency read GetValorFinal;
  end;

implementation

{ THelperAbastecimento }

function THelperAbastecimento.GetImposto: Currency;
begin
  Result := ((Valor * 13) / 100);
end;

function THelperAbastecimento.GetValorFinal: Currency;
begin
  Result := Valor + Imposto;
end;

end.
