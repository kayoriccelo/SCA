unit untBR;

interface

uses
  System.Generics.Collections, untEnumerator, untDAO;

type

  TBR = class
  private

  protected
    FDAO: TDAO;

  public
    function insert(AObject: TObject): boolean; virtual;
    function update(AObject: TObject): boolean; virtual;
    function delete(AIndex: Integer): boolean; virtual;

    function select(AIndex: Integer): TObject; virtual; abstract;
    function list: TList<TObject>; overload; virtual; abstract;
    function list(AProperty: String; AValue: Variant): TList<TObject>; overload; virtual; abstract;

    function validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean; virtual; abstract;

    destructor Destroy;
  end;

  TBREmpresa = class(TBR)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;

    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

    function validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean; override;

    constructor Create;

  end;

  TBRTanque = class(TBR)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;

    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

    function validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean; override;

    constructor Create;
  end;

  TBRBomba = class(TBR)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;

    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

    function validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean; override;

    constructor Create;
  end;

  TBRAbastecimento = class(TBR)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;

    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

    function validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean; override;

    constructor Create;
  end;

implementation

uses
  System.SysUtils, untValidation, untEntity;

{ TBREmpresa }

constructor TBREmpresa.Create;
begin
  FDAO := TDAOEmpresa.Create;
end;

function TBREmpresa.delete(AIndex: Integer): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOEmpresa(FDAO).delete(AIndex);
end;

function TBREmpresa.insert(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOEmpresa(FDAO).insert(AObject);
end;

function TBREmpresa.list: TList<TObject>;
begin
  Result := TDAOEmpresa(FDAO).list;
end;

function TBREmpresa.list(AProperty: String; AValue: Variant): TList<TObject>;
begin
  Result := TDAOEmpresa(FDAO).list(AProperty, AValue);
end;

function TBREmpresa.select(AIndex: Integer): TObject;
begin
  Result := TDAOEmpresa(FDAO).select(AIndex);
end;

function TBREmpresa.update(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOEmpresa(FDAO).update(AObject);
end;

function TBREmpresa.validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean;
begin
  Result := True;

  case ATypeCrud of
    etcdInsert, etcdUpdate:
      begin
        Result := TValidation.validaCNPJ(TEmpresa(AObject).Cnpj);
      end;
    etcdDelete:
      ;
  end;
end;

{ TBRTanque }

constructor TBRTanque.Create;
begin
  FDAO := TDAOTanque.Create;
end;

function TBRTanque.delete(AIndex: Integer): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOTanque(FDAO).delete(AIndex);
end;

function TBRTanque.insert(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOTanque(FDAO).insert(AObject);
end;

function TBRTanque.list: TList<TObject>;
begin
  Result := TDAOTanque(FDAO).list;
end;

function TBRTanque.list(AProperty: String; AValue: Variant): TList<TObject>;
begin
  Result := TDAOTanque(FDAO).list(AProperty, AValue);
end;

function TBRTanque.select(AIndex: Integer): TObject;
begin
  Result := TDAOTanque(FDAO).select(AIndex);
end;

function TBRTanque.update(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOTanque(FDAO).update(AObject);
end;

function TBRTanque.validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean;
begin
  Result := True;

  case ATypeCrud of
    etcdInsert, etcdUpdate:
      ;
    etcdDelete:
      ;
  end;
end;

{ TBRBomba }

constructor TBRBomba.Create;
begin
  FDAO := TDAOBomba.Create;
end;

function TBRBomba.delete(AIndex: Integer): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOBomba(FDAO).delete(AIndex);

end;

function TBRBomba.insert(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOBomba(FDAO).insert(AObject);
end;

function TBRBomba.list: TList<TObject>;
begin
  Result := TDAOBomba(FDAO).list;
end;

function TBRBomba.list(AProperty: String; AValue: Variant): TList<TObject>;
begin
  Result := TDAOBomba(FDAO).list(AProperty, AValue);
end;

function TBRBomba.select(AIndex: Integer): TObject;
begin
  Result := TDAOBomba(FDAO).select(AIndex);
end;

function TBRBomba.update(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOBomba(FDAO).update(AObject);
end;

function TBRBomba.validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean;
begin
  Result := True;

  case ATypeCrud of
    etcdInsert:
      ;
    etcdUpdate:
      ;
    etcdDelete:
      ;
  end;
end;

{ TBRAbastecimento }

constructor TBRAbastecimento.Create;
begin
  FDAO := TDAOAbastecimento.Create;
end;

function TBRAbastecimento.delete(AIndex: Integer): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOAbastecimento(FDAO).delete(AIndex);
end;

function TBRAbastecimento.insert(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOAbastecimento(FDAO).insert(AObject);
end;

function TBRAbastecimento.list: TList<TObject>;
begin
  Result := TDAOAbastecimento(FDAO).list;
end;

function TBRAbastecimento.list(AProperty: String; AValue: Variant): TList<TObject>;
begin
  Result := TDAOAbastecimento(FDAO).list(AProperty, AValue);
end;

function TBRAbastecimento.select(AIndex: Integer): TObject;
begin
  Result := TDAOAbastecimento(FDAO).select(AIndex);
end;

function TBRAbastecimento.update(AObject: TObject): boolean;
begin
  if not inherited then
    exit(False);

  Result := TDAOAbastecimento(FDAO).insert(AObject);
end;

function TBRAbastecimento.validate(ATypeCrud: eTypeCrud; AObject: TObject): boolean;
begin
  Result := True;

  case ATypeCrud of
    etcdInsert:
      ;
    etcdUpdate:
      ;
    etcdDelete:
      ;
  end;
end;

{ TBR }

function TBR.delete(AIndex: Integer): boolean;
begin
  Result := True;
  if not validate(etcdDelete, nil) then
    exit(False);
end;

destructor TBR.Destroy;
begin
  FreeAndNil(FDAO);
end;

function TBR.insert(AObject: TObject): boolean;
begin
  Result := True;
  if not validate(etcdInsert, AObject) then
    exit(False);
end;

function TBR.update(AObject: TObject): boolean;
begin
  Result := True;
  if not validate(etcdUpdate, AObject) then
    exit(False);
end;

end.
