object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Produto'
  ClientHeight = 493
  ClientWidth = 489
  Color = clDarkgray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTopo: TPanel
    Left = 0
    Top = 0
    Width = 489
    Height = 105
    Align = alTop
    Color = clDarkgray
    ParentBackground = False
    TabOrder = 0
    DesignSize = (
      489
      105)
    object lblBuscar: TLabel
      Left = 24
      Top = 13
      Width = 41
      Height = 15
      Caption = 'Buscar :'
    end
    object btnAdicionar: TButton
      Left = 230
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Adicionar'
      TabOrder = 0
      StyleName = 'Carbon'
      OnClick = btnAdicionarClick
    end
    object Remover: TButton
      Left = 395
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Remover'
      TabOrder = 1
      StyleName = 'Carbon'
      OnClick = RemoverClick
    end
    object btnBuscar: TButton
      Left = 311
      Top = 9
      Width = 34
      Height = 25
      Caption = 'OK'
      TabOrder = 2
      StyleName = 'Carbon'
      OnClick = btnBuscarClick
    end
    object edtBuscar: TEdit
      Left = 71
      Top = 10
      Width = 234
      Height = 23
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderStyle = bsNone
      Color = clWindowFrame
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object btnEditar: TButton
      Left = 314
      Top = 74
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Editar'
      TabOrder = 4
      StyleName = 'Carbon'
      OnClick = btnEditarClick
    end
  end
  object pnlGrid: TPanel
    Left = 0
    Top = 105
    Width = 489
    Height = 388
    Align = alClient
    Color = clBlack
    ParentBackground = False
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 487
      Height = 386
      Align = alClient
      Anchors = [akLeft, akRight]
      BorderStyle = bsNone
      Color = clGrayText
      DataSource = dtsProduto
      FixedColor = clGray
      GradientEndColor = clGrayText
      GradientStartColor = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clBlack
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      StyleElements = [seFont, seBorder]
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 32
    Top = 49
  end
  object dtsProduto: TDataSource
    DataSet = cdsProduto
    Left = 104
    Top = 48
  end
end
