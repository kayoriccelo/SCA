unit untEntity;

interface

type

  TEmpresa = class
  private
    FId: Integer;
    FCnpj: String;
    FDescricao: String;
    FContato: String;
    FEndereco: String;

  public
    property Id: Integer read FId write FId;
    property Cnpj: String read FCnpj write FCnpj;
    property Descricao: String read FDescricao write FDescricao;
    property Contato: String read FContato write FContato;
    property Endereco: String read FEndereco write FEndereco;

  end;

  TTanque = class
  private
    FId: Integer;
    FCodigo: String;
    FDescricao: String;
    FTipo: Integer;
    FEmpresa: TEmpresa;

    function GetEmpresa: TEmpresa;
    procedure SetEmpresa(const Value: TEmpresa);

  public
    property Id: Integer read FId write FId;
    property Codigo: String read FCodigo write FCodigo;
    property Descricao: String read FDescricao write FDescricao;
    property Tipo: Integer read FTipo write FTipo;
    property Empresa: TEmpresa read GetEmpresa write SetEmpresa;

  end;

  TBomba = class
  private
    FId: Integer;
    FCodigo: String;
    FDescricao: String;
    FTanque: TTanque;

    function GetTanque: TTanque;
    procedure SetTanque(const Value: TTanque);

  public
    property Id: Integer read FId write FId;
    property Codigo: String read FCodigo write FCodigo;
    property Descricao: String read FDescricao write FDescricao;
    property Tanque: TTanque read GetTanque write SetTanque;

  end;

  TAbastecimento = class
  private
    FId: Integer;
    FCodigo: String;
    FQuantidadeLitros: Double;
    FValor: Currency;
    FData: TDateTime;
    FBomba: TBomba;

    function GetBomba: TBomba;
    procedure SetBomba(const Value: TBomba);

  public
    property Id: Integer read FId write FId;
    property Codigo: String read FCodigo write FCodigo;
    property QuantidadeLitros: Double read FQuantidadeLitros write FQuantidadeLitros;
    property Valor: Currency read FValor write FValor;
    property Data: TDateTime read FData write FData;
    property Bomba: TBomba read GetBomba write SetBomba;

  end;

implementation

uses
  System.SysUtils;

{ TAbastecimento }

function TAbastecimento.GetBomba: TBomba;
begin
  Result := FBomba;
end;

procedure TAbastecimento.SetBomba(const Value: TBomba);
begin
  FBomba := Value;
end;

{ TBomba }

function TBomba.GetTanque: TTanque;
begin
  Result := FTanque;
end;

procedure TBomba.SetTanque(const Value: TTanque);
begin
  FTanque := Value;
end;

{ TTanque }

function TTanque.GetEmpresa: TEmpresa;
begin
  Result := FEmpresa;
end;

procedure TTanque.SetEmpresa(const Value: TEmpresa);
begin
  FEmpresa := Value;
end;

end.
