unit untRep.Abastecimento;

interface

uses
  System.Generics.Collections, untEntity;

type

  TReport = class
  private
    FObjects: TList<TObject>;

  protected

  public
    function Load: boolean; virtual; abstract;
    function Print: boolean; virtual; abstract;

    constructor Create;
    destructor Destroy;
  published
    { published declarations }
  end;

  TReportAbasteccimento = class(TReport)
  private

  protected
    FValorTotal: Currency;
  public
    function Load: boolean; override;
    function Print: boolean; override;

  end;

implementation

uses
  System.SysUtils, untBR, untFmReport.Abastecimento, untHelper.Abastecimento;

{ TReportSupply }

function TReportAbasteccimento.Load: boolean;
var
  loBRAbast: TBRAbastecimento;
  loAbast: TAbastecimento;
begin

  try
    loBRAbast := TBRAbastecimento.Create;

    FmReportAbastecimento.cdsAbastecimento.Open;

    FmReportAbastecimento.cdsAbastecimento.EmptyDataSet;

    for loAbast in TList<TAbastecimento>(loBRAbast.list) do
    begin
      FmReportAbastecimento.cdsAbastecimento.insert;
      FmReportAbastecimento.cdsAbastecimentotanque.Value := loAbast.Bomba.Tanque.Descricao;
      FmReportAbastecimento.cdsAbastecimentobomba.Value := loAbast.Bomba.Descricao;
      FmReportAbastecimento.cdsAbastecimentovalor.Value := loAbast.Valor + loAbast.Imposto;
      FmReportAbastecimento.cdsAbastecimentodata.Value := loAbast.Data;
      FmReportAbastecimento.cdsAbastecimentolitros.Value := loAbast.QuantidadeLitros.ToString.ToInteger;
      FmReportAbastecimento.cdsAbastecimento.Post;

      FValorTotal := FValorTotal + loAbast.Valor;
    end;

  finally
    FreeAndNil(loBRAbast);

  end;

end;

function TReportAbasteccimento.Print: boolean;
begin
  FmReportAbastecimento.RLlblValotTotal.Caption := 'R$ ' + FloatToStr(FValorTotal);
  FmReportAbastecimento.RLReportAbastecimento.Preview;
end;

{ TReport }

constructor TReport.Create;
begin
  FObjects := TList<TObject>.Create;
end;

destructor TReport.Destroy;
begin
  FreeAndNil(FObjects);
end;

end.
