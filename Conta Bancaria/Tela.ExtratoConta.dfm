object frmTelaExtratoConta: TfrmTelaExtratoConta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Extrato Conta'
  ClientHeight = 441
  ClientWidth = 624
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
    Width = 624
    Height = 81
    Align = alTop
    TabOrder = 0
    object lblTitular: TLabel
      AlignWithMargins = True
      Left = 1
      Top = 6
      Width = 622
      Height = 38
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
      ExplicitTop = -6
    end
    object lblTituloSacar: TLabel
      Left = 6
      Top = 54
      Width = 29
      Height = 15
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      Caption = 'Sacar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTituloDepositar: TLabel
      Left = 304
      Top = 54
      Width = 51
      Height = 15
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Alignment = taCenter
      Caption = 'Depositar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlCentral: TPanel
    Left = 0
    Top = 81
    Width = 624
    Height = 360
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 384
    ExplicitTop = 352
    ExplicitWidth = 185
    ExplicitHeight = 41
    object lsvDepositar: TListView
      Left = 304
      Top = 1
      Width = 319
      Height = 358
      Align = alRight
      Columns = <>
      TabOrder = 0
    end
    object lsvSacar: TListView
      Left = 1
      Top = 1
      Width = 304
      Height = 358
      Align = alLeft
      Columns = <>
      TabOrder = 1
    end
  end
end
