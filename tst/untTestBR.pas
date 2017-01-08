unit untTestBR;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, untEnumerator, untBR, untDAO;

type

  // Test methods for class TBREmpresa

  TestTBREmpresa = class(TTestCase)
  strict private
    FBREmpresa: TBREmpresa;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Testinsert;
    procedure Testupdate;
    procedure Testselect;
    procedure Testlist;
    procedure TestlistProperty;
    procedure Testvalidate;
    procedure Testdelete;
  end;
  // Test methods for class TBRTanque

  TestTBRTanque = class(TTestCase)
  strict private
    FBRTanque: TBRTanque;
    FBREmpresa: TBREmpresa;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Testinsert;
    procedure Testupdate;
    procedure Testselect;
    procedure Testlist;
    procedure TestlistProperty;
    procedure Testvalidate;
    procedure Testdelete;
  end;
  // Test methods for class TBRBomba

  TestTBRBomba = class(TTestCase)
  strict private
    FBRBomba: TBRBomba;
    FBRTanque: TBRTanque;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Testinsert;
    procedure Testupdate;
    procedure Testselect;
    procedure Testlist;
    procedure TestlistProperty;
    procedure Testvalidate;
    procedure Testdelete;
  end;
  // Test methods for class TBRAbastecimento

  TestTBRAbastecimento = class(TTestCase)
  strict private
    FBRAbastecimento: TBRAbastecimento;
    FBRBomba: TBRBomba;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure Testinsert;
    procedure Testupdate;
    procedure Testselect;
    procedure Testlist;
    procedure TestlistProperty;
    procedure Testvalidate;
    procedure Testdelete;
  end;

implementation

uses
  System.Generics.Collections, untEntity, System.SysUtils;

procedure TestTBREmpresa.SetUp;
begin
  FBREmpresa := TBREmpresa.Create;
end;

procedure TestTBREmpresa.TearDown;
begin
  FreeAndNil(FBREmpresa);
end;

procedure TestTBREmpresa.Testinsert;
var
  loEmpresa: TEmpresa;
begin
  try
    loEmpresa := TEmpresa.Create;
    loEmpresa.Cnpj := '32116127000167';
    loEmpresa.Descricao := ' Empresa Insert Test Unity';
    loEmpresa.Contato := ' Contato Insert Test Unity';
    loEmpresa.Endereco := ' Endere�o Insert Test Unity';
    CheckTrue(FBREmpresa.insert(loEmpresa), 'Teste insert empresa falhou');
  finally
    FreeAndNil(loEmpresa);
  end;
end;

procedure TestTBREmpresa.Testupdate;
var
  loEmpresa: TEmpresa;
begin
  loEmpresa := TEmpresa(FBREmpresa.list.Last);
  loEmpresa.Cnpj := '32116127000167';
  loEmpresa.Descricao := ' Empresa Update Test Unity';
  loEmpresa.Contato := ' Contato Update Test Unity';
  loEmpresa.Endereco := ' Endere�o Update Test Unity';
  CheckTrue(FBREmpresa.update(loEmpresa), ' Teste update empresa falhou.');
end;

procedure TestTBREmpresa.Testvalidate;
begin
  CheckTrue((FBREmpresa.validate(etcdInsert, TEmpresa(FBREmpresa.list.Last))) and
    (FBREmpresa.validate(etcdUpdate, TEmpresa(FBREmpresa.list.Last))), 'Teste validate empresa falhou.');
end;

procedure TestTBREmpresa.Testdelete;
begin
  CheckTrue(FBREmpresa.delete(TEmpresa(FBREmpresa.list.Last).id), 'Teste delete empresa falhou.');
end;

procedure TestTBREmpresa.Testselect;
begin
  CheckNotNull(FBREmpresa.select(TEmpresa(FBREmpresa.list.Last).id), 'Teste select empresa falhou.');
end;

procedure TestTBREmpresa.Testlist;
begin
  CheckNotNull(FBREmpresa.list, 'Teste list falhou.');
end;

procedure TestTBREmpresa.TestlistProperty;
begin
  CheckNotNull(FBREmpresa.list('1', '1'), 'Teste listProperty empresa falhou.');
end;

procedure TestTBRTanque.SetUp;
begin
  FBRTanque := TBRTanque.Create;
  FBREmpresa := TBREmpresa.Create;
end;

procedure TestTBRTanque.TearDown;
begin
  FreeAndNil(FBRTanque);
  FreeAndNil(FBREmpresa);
end;

procedure TestTBRTanque.Testinsert;
var
  loTanque: TTanque;
begin
  try
    loTanque := TTanque.Create;
    loTanque.Codigo := '99';
    loTanque.Descricao := 'Tanque Insert Test Unity';
    loTanque.Tipo := 0;
    loTanque.Empresa := TEmpresa(FBREmpresa.list.Last);
    CheckTrue(FBRTanque.insert(loTanque), 'Teste insert tanque falhou');
  finally
    FreeAndNil(loTanque);
  end;
end;

procedure TestTBRTanque.Testupdate;
var
  loTanque: TTanque;
begin
  loTanque := TTanque(FBRTanque.list.Last);
  loTanque.Codigo := '99';
  loTanque.Descricao := 'Tanque Update Test Unity';
  loTanque.Tipo := 1;
  CheckTrue(FBRTanque.update(loTanque), 'Teste update tanque falhou.');
end;

procedure TestTBRTanque.Testdelete;
begin
  CheckTrue(FBRTanque.delete(TTanque(FBRTanque.list.Last).id), 'Teste delete tanque falhou.');
end;

procedure TestTBRTanque.Testselect;
begin
  CheckNotNull(FBRTanque.select(TTanque(FBRTanque.list.Last).id), 'Teste select tanque falhou.');
end;

procedure TestTBRTanque.Testlist;
begin
  CheckNotNull(FBRTanque.list, 'Teste list tanque falhou.');
end;

procedure TestTBRTanque.TestlistProperty;
begin
  CheckNotNull(FBRTanque.list('1', '1'), 'Teste listProperty tanque falhou.');
end;

procedure TestTBRTanque.Testvalidate;
begin
  CheckTrue((FBRTanque.validate(etcdInsert, TTanque(FBRTanque.list.Last))) and (FBRTanque.validate(etcdUpdate, TTanque(FBRTanque.list.Last)
    )), 'Teste validate tanque falhou');
end;

procedure TestTBRBomba.SetUp;
begin
  FBRBomba := TBRBomba.Create;
  FBRTanque := TBRTanque.Create;
end;

procedure TestTBRBomba.TearDown;
begin
  FreeAndNil(FBRBomba);
  FreeAndNil(FBRTanque);
end;

procedure TestTBRBomba.Testinsert;
var
  loBomba: TBomba;
begin
  try
    loBomba := TBomba.Create;
    loBomba.Codigo := '99';
    loBomba.Descricao := 'Bomba Insert Test Unity';
    loBomba.Tanque := TTanque(FBRTanque.list.Last);
    CheckTrue(FBRBomba.insert(loBomba), 'Teste insert bomba falhou.');
  finally
    FreeAndNil(loBomba);
  end;
end;

procedure TestTBRBomba.Testupdate;
var
  loBomba: TBomba;
begin
  loBomba := TBomba(FBRBomba.list.Last);
  loBomba.Codigo := '99';
  loBomba.Descricao := 'Bomba Update Test Unity';
  CheckTrue(FBRBomba.update(loBomba), 'Teste update bomba falhou.');
end;

procedure TestTBRBomba.Testdelete;
begin
  CheckTrue(FBRBomba.delete(TBomba(FBRBomba.list.Last).id), 'Teste delete bomba falhou.');
end;

procedure TestTBRBomba.Testselect;
begin
  CheckNotNull(FBRBomba.select(TBomba(FBRBomba.list.Last).id), 'Teste select bomba falhou.');
end;

procedure TestTBRBomba.Testlist;
begin
  CheckNotNull(FBRBomba.list, 'Teste list bomba falhou.');
end;

procedure TestTBRBomba.TestlistProperty;
begin
  CheckNotNull(FBRBomba.list('1', '1'), 'Teste listProperty bomba falhou.')
end;

procedure TestTBRBomba.Testvalidate;
begin
  CheckTrue((FBRBomba.validate(etcdInsert, TBomba(FBRBomba.list.Last))) and (FBRBomba.validate(etcdUpdate, TBomba(FBRBomba.list.Last))),
    'Teste validate bomba falhou.');
end;

procedure TestTBRAbastecimento.SetUp;
begin
  FBRAbastecimento := TBRAbastecimento.Create;
  FBRBomba := TBRBomba.Create;
end;

procedure TestTBRAbastecimento.TearDown;
begin
  FreeAndNil(FBRAbastecimento);
  FreeAndNil(FBRBomba);
end;

procedure TestTBRAbastecimento.Testinsert;
var
  loAbastecimento: TAbastecimento;
begin
  try
    loAbastecimento := TAbastecimento.Create;
    loAbastecimento.Codigo := '99';
    loAbastecimento.QuantidadeLitros := 1;
    loAbastecimento.Valor := 3.77;
    loAbastecimento.Data := Now;
    loAbastecimento.Bomba := TBomba(FBRBomba.list.Last);
    CheckTrue(FBRAbastecimento.insert(loAbastecimento), 'Teste insert abastecimento falhou.');
  finally
    FreeAndNil(loAbastecimento);
  end;
end;

procedure TestTBRAbastecimento.Testupdate;
var
  loAbastecimento: TAbastecimento;
begin
  loAbastecimento := TAbastecimento(FBRAbastecimento.list.Last);
  loAbastecimento.Codigo := '99';
  loAbastecimento.QuantidadeLitros := 2;
  loAbastecimento.Valor := 4;
  CheckTrue(FBRAbastecimento.update(loAbastecimento), 'Teste update abastecimento falhou.');
end;

procedure TestTBRAbastecimento.Testdelete;
begin
  CheckTrue(FBRAbastecimento.delete(TAbastecimento(FBRAbastecimento.list.Last).id), 'Teste delete abastecimento falhou.');
end;

procedure TestTBRAbastecimento.Testselect;
begin
  CheckNotNull(FBRAbastecimento.select(TAbastecimento(FBRAbastecimento.list.Last).id), 'Teste select abastecimento falhou.');
end;

procedure TestTBRAbastecimento.Testlist;
begin
  CheckNotNull(TList<TAbastecimento>(FBRAbastecimento.list), 'Teste list abastecimento falhou.');
end;

procedure TestTBRAbastecimento.TestlistProperty;
begin
  CheckNotNull(TList<TAbastecimento>(FBRAbastecimento.list('1', '1')), 'Teste listProperty abastecimento falhou.');
end;

procedure TestTBRAbastecimento.Testvalidate;
begin
  CheckTrue((FBRAbastecimento.validate(etcdInsert, TAbastecimento(FBRAbastecimento.list.Last))) and FBRAbastecimento.validate(etcdUpdate,
    TAbastecimento(FBRAbastecimento.list.Last)), 'Teste validate abastecimento falhou.');
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTBREmpresa.Suite);
RegisterTest(TestTBRTanque.Suite);
RegisterTest(TestTBRBomba.Suite);
RegisterTest(TestTBRAbastecimento.Suite);

end.