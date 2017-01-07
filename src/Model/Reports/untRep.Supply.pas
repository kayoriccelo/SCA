unit untRep.Supply;

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

  TReportSupply = class(TReport)
  private

  protected
    FValorTotal, FTotalLitros: Currency;
  public
    function Load: boolean; override;
    function Print: boolean; override;

  end;

implementation

uses
  System.SysUtils, untBR, untFmReport.Supply;

{ TReportSupply }

function TReportSupply.Load: boolean;
var
  loBRAbast: TBRAbastecimento;
  loAbast: TAbastecimento;
begin

  try
    loBRAbast := TBRAbastecimento.Create;

    FmReportSupply.cdsAbastecimento.CreateDataSet;

    for loAbast in TList<TAbastecimento>(loBRAbast.list) do
    begin
      FmReportSupply.cdsAbastecimento.insert;
      FmReportSupply.cdsAbastecimentotanque.Value := loAbast.Bomba.Tanque.Descricao;
      FmReportSupply.cdsAbastecimentobomba.Value := loAbast.Bomba.Descricao;
      FmReportSupply.cdsAbastecimentovalor.Value := loAbast.Valor;
      FmReportSupply.cdsAbastecimentodata.Value := loAbast.Data;
      FmReportSupply.cdsAbastecimentolitros.Value := loAbast.QuantidadeLitros.ToString.ToInteger;
      FmReportSupply.cdsAbastecimento.Post;

      FValorTotal := FValorTotal + loAbast.Valor;
      FTotalLitros := FTotalLitros + loAbast.QuantidadeLitros;
    end;

  finally
    FreeAndNil(loBRAbast);
  end;

end;

function TReportSupply.Print: boolean;
begin
  FmReportSupply.RLlblTotalLitros.Caption := FloatToStr(FTotalLitros);
  FmReportSupply.RLlblValotTotal.Caption := FloatToStr(FValorTotal);
  FmReportSupply.RLReportSupply.Preview;
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
