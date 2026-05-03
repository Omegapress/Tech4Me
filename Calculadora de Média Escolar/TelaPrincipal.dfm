object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Calculadora Media Escolar'
  ClientHeight = 316
  ClientWidth = 728
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblTitulo: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 10
    Width = 722
    Height = 30
    Margins.Top = 10
    Align = alTop
    Alignment = taCenter
    Caption = 'Calculadora de M'#233'dia Escolar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 286
  end
  object lblTituloResultado: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 218
    Width = 710
    Height = 21
    Margins.Left = 15
    Margins.Top = 5
    Align = alTop
    Caption = 'Resultado :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 81
  end
  object lblResultadoTexto: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 280
    Width = 710
    Height = 20
    Margins.Left = 15
    Margins.Top = 10
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 4
  end
  object lblResultadoMedia: TLabel
    AlignWithMargins = True
    Left = 15
    Top = 247
    Width = 710
    Height = 20
    Margins.Left = 15
    Margins.Top = 5
    Align = alTop
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ExplicitWidth = 4
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 43
    Width = 728
    Height = 170
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    OnExit = ValidacaoValores
    object lblSegundaNota: TLabel
      Left = 255
      Top = 29
      Width = 102
      Height = 20
      Caption = 'Segunda Nota :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblTerceiraNota: TLabel
      Left = 486
      Top = 29
      Width = 96
      Height = 20
      Caption = 'Terceira Nota :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblPrimeiraNota: TLabel
      Left = 15
      Top = 29
      Width = 99
      Height = 20
      Caption = 'Primeira Nota :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnCalcularMedia: TButton
      Left = 212
      Top = 104
      Width = 133
      Height = 41
      Caption = 'Calcular M'#233'dia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnCalcularMediaClick
    end
    object edtPrimeiraNota: TEdit
      Left = 120
      Top = 26
      Width = 112
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = ValidacaoValores
    end
    object edtSegundaNota: TEdit
      Left = 363
      Top = 26
      Width = 109
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = ValidacaoValores
    end
    object edtTerceiraNota: TEdit
      Left = 588
      Top = 26
      Width = 107
      Height = 28
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnExit = ValidacaoValores
    end
    object btnLimpar: TButton
      Left = 412
      Top = 104
      Width = 133
      Height = 41
      Caption = 'Limpar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = btnLimparClick
    end
  end
end
