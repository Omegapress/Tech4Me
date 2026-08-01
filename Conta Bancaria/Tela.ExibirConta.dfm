object frmExibirConta: TfrmExibirConta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exibir Contas'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object dbContas: TDBGrid
    Left = 0
    Top = 0
    Width = 624
    Height = 441
    Align = alClient
    DataSource = dsContas
    Enabled = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object dsContas: TDataSource
    DataSet = cdsContas
    Left = 392
    Top = 24
  end
  object cdsContas: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 480
    Top = 24
  end
end
