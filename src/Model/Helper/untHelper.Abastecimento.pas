unit untHelper.Abastecimento;

interface

uses untEntity;

type

  THelperAbastecimento = class Helper for TAbastecimento
  private
    function GetImposto: Currency;
  public
    property Imposto: Currency read GetImposto;
  end;

implementation

{ THelperAbastecimento }

function THelperAbastecimento.GetImposto: Currency;
begin
  Result := ((Valor * 13) / 100);
end;

end.
