object FrmTelaNovaConta: TFrmTelaNovaConta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Nova Conta'
  ClientHeight = 168
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlCentral: TPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 168
    Align = alClient
    TabOrder = 0
    object lblNumeroConta: TLabel
      Left = 24
      Top = 32
      Width = 101
      Height = 15
      Caption = 'Numero da Conta :'
    end
    object lblNomeTitular: TLabel
      Left = 24
      Top = 72
      Width = 93
      Height = 15
      Caption = 'Nome do Titular :'
    end
    object edtNumeroConta: TEdit
      Left = 131
      Top = 29
      Width = 230
      Height = 23
      TabOrder = 0
      OnExit = ValidarApenasNumeros
    end
    object edtNomeTitular: TEdit
      Left = 131
      Top = 69
      Width = 230
      Height = 23
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 24
      Top = 128
      Width = 65
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelarClick
    end
    object btnLimpar: TButton
      Left = 95
      Top = 128
      Width = 65
      Height = 25
      Caption = 'Limpar'
      TabOrder = 3
      OnClick = btnLimparClick
    end
    object btnCadastrar: TButton
      Left = 296
      Top = 128
      Width = 65
      Height = 25
      Caption = 'Cadastrar'
      TabOrder = 4
      OnClick = btnCadastrarClick
    end
    object btnExcluir: TButton
      Left = 225
      Top = 128
      Width = 65
      Height = 25
      Caption = 'Excluir'
      TabOrder = 5
      Visible = False
      OnClick = btnExcluirClick
    end
  end
end
