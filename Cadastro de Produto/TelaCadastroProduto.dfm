object frmTelaCadastroProduto: TfrmTelaCadastroProduto
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produto'
  ClientHeight = 204
  ClientWidth = 421
  Color = clDarkgray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object gbProduto: TGroupBox
    Left = 0
    Top = 0
    Width = 421
    Height = 204
    Align = alClient
    Caption = 'Produto'
    TabOrder = 0
    object lblNomeProduto: TLabel
      Left = 16
      Top = 40
      Width = 102
      Height = 15
      Caption = 'Nome do Produto :'
    end
    object lblPreco: TLabel
      Left = 40
      Top = 83
      Width = 36
      Height = 15
      Caption = 'Pre'#231'o :'
    end
    object lblQuantidade: TLabel
      Left = 24
      Top = 132
      Width = 68
      Height = 15
      Caption = 'Quantidade :'
    end
    object btnCancelar: TButton
      Left = 170
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 0
      StyleName = 'Carbon'
      OnClick = btnCancelarClick
    end
    object btnSalvar: TButton
      Left = 251
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Salvar'
      TabOrder = 1
      StyleName = 'Carbon'
      OnClick = btnSalvarClick
    end
    object btnLimpar: TButton
      Left = 332
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 2
      StyleName = 'Carbon'
      OnClick = btnLimparClick
    end
    object edtNomeProduto: TEdit
      Left = 124
      Top = 37
      Width = 202
      Height = 23
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
    object edtPreco: TEdit
      Left = 124
      Top = 80
      Width = 121
      Height = 23
      BorderStyle = bsNone
      Color = clWindowFrame
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = edtPrecoExit
    end
    object edtQuantidade: TEdit
      Left = 124
      Top = 129
      Width = 121
      Height = 23
      BorderStyle = bsNone
      Color = clWindowFrame
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = 22
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnExit = edtQuantidadeExit
    end
  end
end
