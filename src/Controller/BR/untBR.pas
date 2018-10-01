unit untBR;

interface

uses
  System.Generics.Collections, untEnumerator, untDAO, untORM, System.Rtti;

type

  TBR = class
  private

  protected
    FDAO: TDAO;

  public
    function insert(AModel: TModel): boolean; virtual;
    function update(AModel: TModel): boolean; virtual;
    function delete(AId: TValue): boolean; virtual;

    function select(AIndex: Integer): TModel; virtual;
    function list: TList<TModel>; overload; virtual;
    function list(AProperty: String; AValue: TValue): TList<TModel>; overload; virtual;

    function validate(ATypeCrud: eTypeCrud; AModel: TModel): boolean; virtual;

    constructor Create(AModelClass: TModelClass); virtual;
    destructor Destroy; virtual;
  end;

  TBREmpresa = class(TBR)
  private
  public
    function validate(ATypeCrud: eTypeCrud; AModel: TModel): boolean; override;

    constructor Create; overload;
  end;

  TBRTanque = class(TBR)
  private
  public
    constructor Create; overload;
  end;

  TBRBomba = class(TBR)
  private
  public
    constructor Create; overload;
  end;

  TBRAbastecimento = class(TBR)
  private
  public
    constructor Create; overload;
  end;

implementation

uses
  System.SysUtils, untValidation, untEntity;

{ TBREmpresa }

constructor TBREmpresa.Create;
begin
  Create(TEmpresa);
end;

function TBREmpresa.validate(ATypeCrud: eTypeCrud; AModel: TModel): boolean;
begin
  Result := True;

  case ATypeCrud of
    etcdInsert, etcdUpdate:
      begin
        Result := TValidation.validaCNPJ(TEmpresa(AModel).Cnpj);
      end;
    etcdDelete:
      ;
  end;
end;

{ TBR }

constructor TBR.Create(AModelClass: TModelClass);
begin
  FDAO := TDAO.Create(AModelClass);
end;

function TBR.delete(AId: TValue): boolean;
begin
  Result := FDAO.delete(AId);
end;

destructor TBR.Destroy;
begin
  FreeAndNil(FDAO);
end;

function TBR.insert(AModel: TModel): boolean;
begin
  if not validate(etcdInsert, AModel) then
    exit(False);

  Result := FDAO.insert(AModel);
end;

function TBR.list: TList<TModel>;
begin
  Result := FDAO.list;
end;

function TBR.list(AProperty: String; AValue: TValue): TList<TModel>;
begin
  Result := FDAO.list(AProperty, AValue);
end;

function TBR.select(AIndex: Integer): TModel;
begin
  Result := FDAO.select(AIndex);
end;

function TBR.update(AModel: TModel): boolean;
begin
  if not validate(etcdUpdate, AModel) then
    exit(False);

  Result := FDAO.update(AModel);
end;

function TBR.validate(ATypeCrud: eTypeCrud; AModel: TModel): boolean;
begin
  Result := True;
end;

{ TBRTanque }

constructor TBRTanque.Create;
begin
  Create(TTanque);
end;

{ TBRBomba }

constructor TBRBomba.Create;
begin
  Create(TBomba);
end;

{ TBRAbastecimento }

constructor TBRAbastecimento.Create;
begin
  Create(TAbastecimento);
end;

end.
