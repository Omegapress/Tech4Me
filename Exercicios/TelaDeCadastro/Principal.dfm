object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela de Cadastro'
  ClientHeight = 502
  ClientWidth = 600
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Splitter: TSplitter
    Left = 297
    Top = 0
    Width = 4
    Height = 450
    Color = clBtnShadow
    ParentColor = False
    ExplicitLeft = 179
    ExplicitHeight = 441
  end
  object Image1: TImage
    Left = 240
    Top = 80
    Width = 105
    Height = 105
  end
  object pnlResultado: TPanel
    Left = 301
    Top = 0
    Width = 299
    Height = 450
    Align = alClient
    TabOrder = 0
    object ListResultados: TListBox
      Left = 1
      Top = 1
      Width = 297
      Height = 448
      Align = alClient
      ItemHeight = 15
      TabOrder = 0
    end
  end
  object pnlCadastro: TPanel
    Left = 0
    Top = 0
    Width = 297
    Height = 450
    Align = alLeft
    TabOrder = 1
    object pgcCadastro: TPageControl
      Left = 1
      Top = 1
      Width = 295
      Height = 448
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Dados Pessoais'
        object gbInformacoes: TGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 10
          Width = 277
          Height = 378
          Margins.Left = 5
          Margins.Top = 10
          Margins.Right = 5
          Margins.Bottom = 30
          Align = alClient
          Caption = 'Informa'#231#245'es'
          TabOrder = 0
          object lblNome: TLabel
            Left = 24
            Top = 184
            Width = 36
            Height = 15
            Caption = 'Nome:'
          end
          object lblCPF: TLabel
            Left = 24
            Top = 232
            Width = 24
            Height = 15
            Caption = 'CPF:'
          end
          object lblSexo: TLabel
            Left = 24
            Top = 280
            Width = 27
            Height = 15
            Caption = 'Sexo:'
          end
          object imgFoto: TImage
            Left = 24
            Top = 24
            Width = 119
            Height = 121
            Center = True
            Proportional = True
            Stretch = True
          end
          object lblFotoPerfil: TLabel
            Left = 49
            Top = 151
            Width = 54
            Height = 15
            Caption = 'Foto Perfil'
          end
          object edtNome: TEdit
            Left = 66
            Top = 181
            Width = 191
            Height = 23
            TabOrder = 0
            TextHint = 'Nome'
          end
          object cbSexo: TComboBox
            Left = 66
            Top = 277
            Width = 191
            Height = 23
            TabOrder = 1
            Items.Strings = (
              'Masculino'
              'Feminino')
          end
          object cbAtivo: TCheckBox
            Left = 199
            Top = 328
            Width = 57
            Height = 17
            Caption = 'Ativo'
            TabOrder = 2
          end
          object edtCPF: TMaskEdit
            Left = 67
            Top = 229
            Width = 189
            Height = 23
            EditMask = '000.000.000-00;1;_'
            MaxLength = 14
            TabOrder = 3
            Text = '   .   .   -  '
          end
          object btnCarregarFoto: TButton
            Left = 156
            Top = 104
            Width = 101
            Height = 33
            Caption = 'Carregar Foto'
            TabOrder = 4
            OnClick = btnCarregarFotoClick
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Contato'
        ImageIndex = 1
        object lblEmail: TLabel
          Left = 16
          Top = 152
          Width = 32
          Height = 15
          Caption = 'Email:'
        end
        object lblTelefone: TLabel
          Left = 16
          Top = 216
          Width = 48
          Height = 15
          Caption = 'Telefone:'
        end
        object edtEmail: TEdit
          Left = 54
          Top = 149
          Width = 211
          Height = 23
          TabOrder = 0
          TextHint = 'Email'
        end
        object edtTelefone: TMaskEdit
          Left = 70
          Top = 213
          Width = 193
          Height = 23
          EditMask = '(00) 00000-0000;1;_'
          MaxLength = 15
          TabOrder = 1
          Text = '(  )      -    '
          TextHint = 'Telefone'
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Observa'#231#227'o'
        ImageIndex = 2
        object lblAdicionais: TLabel
          Left = 16
          Top = 19
          Width = 127
          Height = 15
          Caption = 'Informa'#231#245'es Adicionais '
        end
        object memoAdicionais: TMemo
          Left = 16
          Top = 40
          Width = 257
          Height = 353
          TabOrder = 0
        end
      end
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 450
    Width = 600
    Height = 52
    Align = alBottom
    TabOrder = 2
    object btnSalvar: TButton
      Left = 138
      Top = 5
      Width = 103
      Height = 35
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
    object ProgressoSalvar: TProgressBar
      Left = 256
      Top = 5
      Width = 343
      Height = 36
      TabOrder = 1
    end
    object btnLimpar: TButton
      Left = 10
      Top = 6
      Width = 103
      Height = 35
      Caption = 'Limpar'
      TabOrder = 2
      OnClick = btnLimparClick
    end
  end
  object OpenDialog: TOpenDialog
    Left = 178
    Top = 61
  end
  object Timer: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerTimer
    Left = 242
    Top = 61
  end
end
