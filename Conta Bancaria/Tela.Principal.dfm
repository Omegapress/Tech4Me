object FrmContaBancaria: TFrmContaBancaria
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conta Bancaria Tech4Me'
  ClientHeight = 371
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 479
    Height = 41
    Align = alTop
    TabOrder = 0
    object lblNumeroConta: TLabel
      AlignWithMargins = True
      Left = 6
      Top = 11
      Width = 104
      Height = 21
      Margins.Left = 5
      Margins.Top = 10
      Margins.Right = 2
      Margins.Bottom = 8
      Align = alLeft
      Alignment = taCenter
      Caption = 'Numero da Conta : '
      ExplicitHeight = 15
    end
    object btnBuscarNumeroConta: TButton
      AlignWithMargins = True
      Left = 310
      Top = 9
      Width = 75
      Height = 23
      Margins.Left = 5
      Margins.Top = 8
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alLeft
      Caption = 'Buscar'
      TabOrder = 0
      OnClick = btnBuscarNumeroContaClick
    end
    object edtNumeroConta: TEdit
      AlignWithMargins = True
      Left = 115
      Top = 11
      Width = 188
      Height = 21
      Margins.Top = 10
      Margins.Right = 2
      Margins.Bottom = 8
      Align = alLeft
      TabOrder = 1
      OnExit = ValidarApenasNumeros
      ExplicitHeight = 23
    end
    object btnLimpar: TButton
      AlignWithMargins = True
      Left = 390
      Top = 9
      Width = 75
      Height = 23
      Margins.Left = 5
      Margins.Top = 8
      Margins.Right = 0
      Margins.Bottom = 8
      Align = alLeft
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = btnLimparClick
    end
  end
  object pnlCenter: TPanel
    Left = 0
    Top = 41
    Width = 479
    Height = 330
    Align = alClient
    TabOrder = 1
    object lblTitular: TLabel
      Left = 1
      Top = 1
      Width = 477
      Height = 25
      Margins.Left = 0
      Margins.Top = 5
      Margins.Right = 0
      Margins.Bottom = 5
      Align = alTop
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 5
    end
    object pnlOperacao: TPanel
      AlignWithMargins = True
      Left = 71
      Top = 31
      Width = 337
      Height = 218
      Margins.Left = 70
      Margins.Top = 5
      Margins.Right = 70
      Margins.Bottom = 5
      Align = alTop
      TabOrder = 0
      object lblOperacao: TLabel
        AlignWithMargins = True
        Left = 1
        Top = 31
        Width = 335
        Height = 15
        Margins.Left = 0
        Margins.Top = 30
        Margins.Right = 0
        Margins.Bottom = 5
        Align = alTop
        Alignment = taCenter
        Caption = 'Opera'#231#245'es Bancarias'
        ExplicitWidth = 109
      end
      object lblSaldo: TLabel
        AlignWithMargins = True
        Left = 1
        Top = 172
        Width = 335
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alBottom
        Alignment = taCenter
        Caption = 'Saldo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 50
      end
      object btnDepositar: TButton
        AlignWithMargins = True
        Left = 201
        Top = 114
        Width = 75
        Height = 38
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 60
        Margins.Bottom = 20
        Align = alRight
        Caption = 'Depositar'
        TabOrder = 0
        OnClick = btnDepositarClick
      end
      object btnSacar: TButton
        AlignWithMargins = True
        Left = 61
        Top = 114
        Width = 75
        Height = 38
        Margins.Left = 60
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 20
        Align = alLeft
        Caption = 'Sacar'
        TabOrder = 1
        OnClick = btnSacarClick
      end
      object mskValor: TMaskEdit
        AlignWithMargins = True
        Left = 51
        Top = 71
        Width = 235
        Height = 23
        Margins.Left = 50
        Margins.Top = 20
        Margins.Right = 50
        Margins.Bottom = 0
        Align = alTop
        EditMask = '999999999,99;1;_'
        MaxLength = 12
        TabOrder = 2
        Text = '         ,  '
        ExplicitWidth = 234
      end
    end
    object btnCriarEditarConta: TButton
      Left = 287
      Top = 272
      Width = 118
      Height = 41
      Caption = 'Criar | Editar Conta'
      TabOrder = 1
      OnClick = btnCriarEditarContaClick
    end
    object btnExibirSaldo: TButton
      Left = 184
      Top = 272
      Width = 97
      Height = 41
      Caption = 'Saldo | Extrato'
      TabOrder = 2
      OnClick = btnExibirSaldoClick
    end
    object btnExibirContas: TButton
      Left = 79
      Top = 272
      Width = 99
      Height = 41
      Caption = 'Exibir Contas'
      TabOrder = 3
      OnClick = btnExibirContasClick
    end
  end
end
