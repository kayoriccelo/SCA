object FmMain: TFmMain
  Left = 0
  Top = 0
  Caption = 'SCA - Sistema de controle de abastecimento'
  ClientHeight = 441
  ClientWidth = 688
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMain
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object mmMain: TMainMenu
    Left = 56
    Top = 24
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Empresa1: TMenuItem
        Caption = 'Empresa'
        OnClick = Empresa1Click
      end
      object anque1: TMenuItem
        Caption = 'Tanque'
        OnClick = anque1Click
      end
      object Bomba1: TMenuItem
        Caption = 'Bomba'
        OnClick = Bomba1Click
      end
    end
    object Movimentaes1: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object Abastecimento1: TMenuItem
        Caption = 'Abastecimento'
        OnClick = Abastecimento1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Abastecimento2: TMenuItem
        Caption = 'Abastecimentos'
        OnClick = Abastecimento2Click
      end
    end
  end
end
