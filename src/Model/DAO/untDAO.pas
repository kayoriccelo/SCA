unit untDAO;

interface

uses
  System.Generics.Collections, FireDAC.Comp.Client;

type

  TDAO = class
  private

  protected
    FQry: TFDQuery;

  public
    function insert(AObject: TObject): boolean; virtual; abstract;
    function update(AObject: TObject): boolean; virtual; abstract;
    function delete(AIndex: Integer): boolean; virtual; abstract;
    function select(AIndex: Integer): TObject; virtual; abstract;
    function list: TList<TObject>; overload; virtual; abstract;
    function list(AProperty: String; AValue: Variant): TList<TObject>; overload; virtual; abstract;

    constructor Create;
    destructor Destroy;

  end;

  TDAOEmpresa = class(TDAO)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;
    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

  end;

  TDAOTanque = class(TDAO)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;
    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

  end;

  TDAOBomba = class(TDAO)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;
    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

  end;

  TDAOAbastecimento = class(TDAO)
  private

  public
    function insert(AObject: TObject): boolean; override;
    function update(AObject: TObject): boolean; override;
    function delete(AIndex: Integer): boolean; override;
    function select(AIndex: Integer): TObject; override;
    function list: TList<TObject>; override;
    function list(AProperty: String; AValue: Variant): TList<TObject>; override;

  end;

implementation

uses
  System.SysUtils, untEntity, untDMConnection;

{ TDAOEmpresa }

function TDAOEmpresa.delete(AIndex: Integer): boolean;
begin
  try
    Result := True;

    FQry.SQL.Text := 'delete from tb_empresa where id = ' + AIndex.ToString;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao deletar empresa.' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOEmpresa.insert(AObject: TObject): boolean;
begin
  try
    Result := True;

    with TEmpresa(AObject) do
    begin
      FQry.SQL.Text := 'insert into tb_empresa (CNPJ, DESCRICAO, CONTATO, ENDERECO) values (:CNPJ, :DESCRICAO, :CONTATO, :ENDERECO)';
      FQry.ParamByName('CNPJ').Value := Cnpj;
      FQry.ParamByName('DESCRICAO').Value := Descricao;
      FQry.ParamByName('CONTATO').Value := Contato;
      FQry.ParamByName('ENDERECO').Value := Endereco;
    end;

    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao inserir empresa.' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOEmpresa.list: TList<TObject>;
var
  loEmpresa: TEmpresa;
begin
  try
    FQry.open('select * from tb_empresa');

    Result := TList<TObject>.Create;

    FQry.First;
    While not(FQry.Eof) do
    begin
      loEmpresa := TEmpresa.Create;

      loEmpresa.Id := FQry.FieldByName('ID').Value;
      loEmpresa.Cnpj := FQry.FieldByName('CNPJ').Value;
      loEmpresa.Descricao := FQry.FieldByName('DESCRICAO').Value;
      loEmpresa.Contato := FQry.FieldByName('CONTATO').Value;
      loEmpresa.Endereco := FQry.FieldByName('ENDERECO').Value;

      Result.Add(loEmpresa);
      FQry.Next;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error ao listar empresa.' + #13 + E.message);
  end;
end;

function TDAOEmpresa.list(AProperty: String; AValue: Variant): TList<TObject>;
var
  loEmpresa: TEmpresa;
begin
  try
    FQry.open('select * from tb_empresa where ' + AProperty + ' = ' + AValue);

    Result := TList<TObject>.Create;

    FQry.First;
    While not(FQry.Eof) do
    begin
      loEmpresa := TEmpresa.Create;

      loEmpresa.Id := FQry.FieldByName('ID').Value;
      loEmpresa.Cnpj := FQry.FieldByName('CNPJ').Value;
      loEmpresa.Descricao := FQry.FieldByName('DESCRICAO').Value;
      loEmpresa.Contato := FQry.FieldByName('CONTATO').Value;
      loEmpresa.Endereco := FQry.FieldByName('ENDERECO').Value;

      Result.Add(loEmpresa);
      FQry.Next;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error ao listar empresa' + #13 + E.message);
  end;
end;

function TDAOEmpresa.select(AIndex: Integer): TObject;
begin
  try
    FQry.open('select * from tb_empresa where id = ' + AIndex.ToString);

    Result := TEmpresa.Create;

    with TEmpresa(Result) do
    begin
      Id := FQry.FieldByName('ID').Value;
      Cnpj := FQry.FieldByName('CNPJ').Value;
      Descricao := FQry.FieldByName('DESCRICAO').Value;
      Contato := FQry.FieldByName('CONTATO').Value;
      Endereco := FQry.FieldByName('ENDERECO').Value;
    end;
  except
    on E: Exception do
      raise Exception.Create('Error ao selecionar empresa' + #13 + E.message);
  end;
end;

function TDAOEmpresa.update(AObject: TObject): boolean;
begin
  try
    Result := True;

    with TEmpresa(AObject) do
    begin
      FQry.SQL.Text := 'update tb_empresa set CNPJ = :CNPJ, DESCRICAO = :DESCRICAO, CONTATO = :CONTATO , ENDERECO = :ENDERECO where id = ' + Id.ToString;
      FQry.ParamByName('CNPJ').Value := Cnpj;
      FQry.ParamByName('DESCRICAO').Value := Descricao;
      FQry.ParamByName('CONTATO').Value := Contato;
      FQry.ParamByName('ENDERECO').Value := Endereco;
    end;
    FQry.ExecSQL;
  except

    on E: Exception do
    begin
      raise Exception.Create('Error ao alterar empresa' + #13 + E.message);
      Result := False;
    end;
  end;
end;

{ TDAOTanque }

function TDAOTanque.delete(AIndex: Integer): boolean;
begin
  try
    Result := True;

    FQry.SQL.Text := 'delete from tb_tanque where id = ' + AIndex.ToString;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao deletar tanque' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOTanque.insert(AObject: TObject): boolean;
begin
  try
    Result := True;

    with TTanque(AObject) do
    begin
      FQry.SQL.Text := 'insert into tb_tanque (CODIGO, DESCRICAO, TIPO, ID_EMPRESA) values (:CODIGO, :DESCRICAO, :TIPO, :ID_EMPRESA)';
      FQry.ParamByName('CODIGO').Value := Codigo;
      FQry.ParamByName('DESCRICAO').Value := Descricao;
      FQry.ParamByName('TIPO').Value := Tipo;
      FQry.ParamByName('ID_EMPRESA').Value := Empresa.Id;
    end;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao inserir tanque' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOTanque.list: TList<TObject>;
var
  loTanque: TTanque;
  loDAOEmpresa: TDAOEmpresa;
begin
  try
    try
      loDAOEmpresa := TDAOEmpresa.Create;

      FQry.open('select * from tb_tanque');

      Result := TList<TObject>.Create;

      FQry.First;
      While not(FQry.Eof) do
      begin
        loTanque := TTanque.Create;

        loTanque.Id := FQry.FieldByName('ID').Value;
        loTanque.Codigo := FQry.FieldByName('CODIGO').Value;
        loTanque.Descricao := FQry.FieldByName('DESCRICAO').Value;
        loTanque.Tipo := FQry.FieldByName('TIPO').Value;
        loTanque.Empresa := TEmpresa(loDAOEmpresa.select(FQry.FieldByName('ID_EMPRESA').Value));

        Result.Add(loTanque);
        FQry.Next;
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao listar tanque' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOEmpresa);
  end;
end;

function TDAOTanque.list(AProperty: String; AValue: Variant): TList<TObject>;
var
  loTanque: TTanque;
  loDAOEmpresa: TDAOEmpresa;
begin
  try
    try
      loDAOEmpresa := TDAOEmpresa.Create;

      FQry.open('select * from tb_tanque where ' + AProperty + ' = ' + AValue);

      Result := TList<TObject>.Create;

      FQry.First;
      While not(FQry.Eof) do
      begin
        loTanque := TTanque.Create;

        loTanque.Id := FQry.FieldByName('ID').Value;
        loTanque.Codigo := FQry.FieldByName('CODIGO').Value;
        loTanque.Descricao := FQry.FieldByName('DESCRICAO').Value;
        loTanque.Tipo := FQry.FieldByName('TIPO').Value;
        loTanque.Empresa := TEmpresa(loDAOEmpresa.select(FQry.FieldByName('ID_EMPRESA').Value));

        Result.Add(loTanque);
        FQry.Next;
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao listar tanque' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOEmpresa);
  end;
end;

function TDAOTanque.select(AIndex: Integer): TObject;
var
  loDAOEmpresa: TDAOEmpresa;
begin
  try
    try
      loDAOEmpresa := TDAOEmpresa.Create;

      FQry.open('select * from tb_tanque where id = ' + AIndex.ToString);

      Result := TTanque.Create;
      with TTanque(Result) do
      begin
        Id := FQry.FieldByName('ID').Value;
        Codigo := FQry.FieldByName('CODIGO').Value;
        Descricao := FQry.FieldByName('DESCRICAO').Value;
        Tipo := FQry.FieldByName('TIPO').Value;
        Empresa := TEmpresa(loDAOEmpresa.select(FQry.FieldByName('ID_EMPRESA').Value));
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao selecionar tanque' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOEmpresa);
  end;
end;

function TDAOTanque.update(AObject: TObject): boolean;
begin
  try
    Result := True;

    with TTanque(AObject) do
    begin
      FQry.SQL.Text := 'update tb_tanque set CODIGO = :CODIGO, DESCRICAO = :, TIPO = :DESCRICAO, ID_EMPRESA = :ID_EMPRESA where id = ' + Id.ToString;
      FQry.ParamByName('CODIGO').Value := Codigo;
      FQry.ParamByName('DESCRICAO').Value := Descricao;
      FQry.ParamByName('TIPO').Value := Tipo;
      FQry.ParamByName('ID_EMPRESA').Value := Empresa.Id;
    end;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao alterar tanque' + #13 + E.message);
      Result := False;
    end;
  end;
end;

{ TDAOBomba }

function TDAOBomba.delete(AIndex: Integer): boolean;
begin
  try
    Result := True;

    FQry.SQL.Text := 'delete from tb_bomba where id = ' + AIndex.ToString;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao deletar bomba' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOBomba.insert(AObject: TObject): boolean;
begin
  try
    Result := True;

    with TBomba(AObject) do
    begin
      FQry.SQL.Text := 'insert into tb_bomba (CODIGO, DESCRICAO, ID_TANQUE) values (:CODIGO,:DESCRICAO,:ID_TANQUE)';
      FQry.ParamByName('CODIGO').Value := Codigo;
      FQry.ParamByName('DESCRICAO').Value := Descricao;
      FQry.ParamByName('ID_TANQUE').Value := Tanque.Id;
    end;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao inserir bomba' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOBomba.list: TList<TObject>;
var
  loBomba: TBomba;
  loDAOTanque: TDAOTanque;
begin
  try
    try
      loDAOTanque := TDAOTanque.Create;

      FQry.open('select * from tb_bomba');

      Result := TList<TObject>.Create;

      FQry.First;
      While not(FQry.Eof) do
      begin
        loBomba := TBomba.Create;

        loBomba.Id := FQry.FieldByName('ID').Value;
        loBomba.Codigo := FQry.FieldByName('CODIGO').Value;
        loBomba.Descricao := FQry.FieldByName('DESCRICAO').Value;
        loBomba.Tanque := TTanque(loDAOTanque.select(FQry.FieldByName('ID_TANQUE').Value));

        Result.Add(loBomba);
        FQry.Next;
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao listar bomba' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOTanque);
  end;
end;

function TDAOBomba.list(AProperty: String; AValue: Variant): TList<TObject>;
var
  loBomba: TBomba;
  loDAOTanque: TDAOTanque;
begin
  try
    try
      loDAOTanque := TDAOTanque.Create;

      FQry.open('select * from tb_bomba where ' + AProperty + ' = ' + AValue);

      Result := TList<TObject>.Create;

      FQry.First;
      While not(FQry.Eof) do
      begin
        loBomba := TBomba.Create;

        loBomba.Id := FQry.FieldByName('ID').Value;
        loBomba.Codigo := FQry.FieldByName('CODIGO').Value;
        loBomba.Descricao := FQry.FieldByName('DESCRICAO').Value;
        loBomba.Tanque := TTanque(loDAOTanque.select(FQry.FieldByName('ID_TANQUE').Value));

        Result.Add(loBomba);
        FQry.Next;
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao listar bomba' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOTanque);
  end;
end;

function TDAOBomba.select(AIndex: Integer): TObject;
var
  loDAOTanque: TDAOTanque;
begin
  try
    try
      loDAOTanque := TDAOTanque.Create;

      FQry.open('select * from tb_bomba where id = ' + AIndex.ToString);

      Result := TBomba.Create;
      with TBomba(Result) do
      begin
        Id := FQry.FieldByName('ID').AsInteger;
        Codigo := FQry.FieldByName('CODIGO').Value;
        Descricao := FQry.FieldByName('DESCRICAO').Value;
        Tanque := TTanque(loDAOTanque.select(FQry.FieldByName('ID_TANQUE').AsInteger));
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao selecionar bomba' + #13 + E.message);
    end;

  finally
    FreeAndNil(loDAOTanque);
  end;
end;

function TDAOBomba.update(AObject: TObject): boolean;
begin
  try
    Result := True;

    with TBomba(AObject) do
    begin
      FQry.SQL.Text := 'update tb_bomba set CODIGO = :CODIGO, DESCRICAO = :DESCRICAO, ID_TANQUE = :ID_TANQUE where id = ' + Id.ToString;
      FQry.ParamByName('CODIGO').Value := Codigo;
      FQry.ParamByName('DESCRICAO').Value := Descricao;
      FQry.ParamByName('ID_TANQUE').Value := Tanque.Id;
    end;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao alterar bomba' + #13 + E.message);
      Result := False;
    end;
  end;
end;

{ TDAOAbastecimento }

function TDAOAbastecimento.delete(AIndex: Integer): boolean;
begin
  try
    Result := True;

    FQry.SQL.Text := 'delete from tb_abastecimento where id = ' + AIndex.ToString;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao deletar abastecimento' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOAbastecimento.insert(AObject: TObject): boolean;
begin
  try
    Result := True;

    with TAbastecimento(AObject) do
    begin
      FQry.SQL.Text := 'insert into tb_abastecimento (CODIGO, QUANTIDADE_LITROS, VALOR, DATA, ID_BOMBA) values (:CODIGO, :QUANTIDADE_LITROS, :VALOR, :DATA, :ID_BOMBA)';
      FQry.ParamByName('CODIGO').Value := Codigo;
      FQry.ParamByName('QUANTIDADE_LITROS').Value := QuantidadeLitros;
      FQry.ParamByName('VALOR').Value :=Valor;
      FQry.ParamByName('DATA').Value := Data;
      FQry.ParamByName('ID_BOMBA').Value := Bomba.Id;
    end;
    FQry.ExecSQL;
  except
    on E: Exception do
    begin
      raise Exception.Create('Error ao inserir abastecimento' + #13 + E.message);
      Result := False;
    end;
  end;
end;

function TDAOAbastecimento.list: TList<TObject>;
var
  loAbastecimento: TAbastecimento;
  loDAOBomba: TDAOBomba;
begin
  try
    try
      loDAOBomba := TDAOBomba.Create;

      FQry.open('select * from tb_abastecimento');

      Result := TList<TObject>.Create;

      FQry.First;
      while not(FQry.Eof) do
      begin
        loAbastecimento := TAbastecimento.Create;

        loAbastecimento.Id := FQry.FieldByName('ID').Value;
        loAbastecimento.Codigo := FQry.FieldByName('CODIGO').Value;
        loAbastecimento.QuantidadeLitros := FQry.FieldByName('QUANTIDADE_LITROS').Value;
        loAbastecimento.Valor := FQry.FieldByName('VALOR').Value;
        loAbastecimento.Data := FQry.FieldByName('Data').Value;
        loAbastecimento.Bomba := TBomba(loDAOBomba.select(FQry.FieldByName('ID_BOMBA').Value));

        Result.Add(loAbastecimento);
        FQry.Next;
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao listar abastecimento' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOBomba);
  end;
end;

function TDAOAbastecimento.list(AProperty: String; AValue: Variant): TList<TObject>;
var
  loAbastecimento: TAbastecimento;
  loDAOBomba: TDAOBomba;
begin
  try
    try
      loDAOBomba := TDAOBomba.Create;

      FQry.open('select * from tb_abastecimento where ' + AProperty + ' = ' + AValue);

      Result := TList<TObject>.Create;

      FQry.First;
      While not(FQry.Eof) do
      begin
        loAbastecimento := TAbastecimento.Create;

        loAbastecimento.Id := FQry.FieldByName('ID').Value;
        loAbastecimento.Codigo := FQry.FieldByName('CODIGO').Value;
        loAbastecimento.QuantidadeLitros := FQry.FieldByName('QUANTIDADE_LITROS').Value;
        loAbastecimento.Valor := FQry.FieldByName('VALOR').Value;
        loAbastecimento.Data := FQry.FieldByName('DATA').Value;
        loAbastecimento.Bomba := TBomba(loDAOBomba.select(FQry.FieldByName('ID_BOMBA').Value));

        Result.Add(loAbastecimento);
        FQry.Next;
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao listar abastecimento' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOBomba);
  end;
end;

function TDAOAbastecimento.select(AIndex: Integer): TObject;
var
  loDAOBomba: TDAOBomba;
begin
  try
    try
      loDAOBomba := TDAOBomba.Create;

      FQry.open('select * from tb_abastecimento where id = ' + AIndex.ToString);

      Result := TAbastecimento.Create;
      with TAbastecimento(Result) do
      begin
        Id := FQry.FieldByName('ID').Value;
        Codigo := FQry.FieldByName('CODIGO').Value;
        QuantidadeLitros := FQry.FieldByName('QUANTIDADE_LITROS').Value;
        Valor := FQry.FieldByName('VALOR').Value;
        Data := FQry.FieldByName('DATA').Value;
        Bomba := TBomba(loDAOBomba.select(FQry.FieldByName('ID_BOMBA').Value));
      end;
    except
      on E: Exception do
        raise Exception.Create('Error ao selecionar abastecimento' + #13 + E.message);
    end;
  finally
    FreeAndNil(loDAOBomba);
  end;
end;

function TDAOAbastecimento.update(AObject: TObject): boolean;
begin
  Result := True;
end;

{ TDAO }

constructor TDAO.Create;
begin
  FQry := TFDQuery.Create(nil);
  FQry.Connection := DmConnection.ConnectionSCA;
end;

destructor TDAO.Destroy;
begin
  FreeAndNil(FQry);
end;

end.
