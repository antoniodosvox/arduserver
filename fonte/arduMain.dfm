object Form1: TForm1
  Left = 935
  Top = 309
  Width = 340
  Height = 303
  Caption = 'ArduServer v1.0'
  Color = clAqua
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 192
    Top = 232
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555550555
      555555555555F55555555505555B0555570555F55557F55555F55B50555B0555
      7B55575F5557F555575555B5055B5557B5555575F55755557555555B5550005B
      55555557555FFF575555555555BBB0055555555555777FF5555555555BBBBB00
      55555555577777FF55555000BBBBBBB050005FFF7777777F5FFFBBB5BBBBBBB0
      BBB577757777777F77755555BBBBBBB55555555577777775555555555BBBBB55
      55555555577777555555555705BBB55505555555F5777555F555557B5555055B
      505555575555F5575F5557B5555B0555B50555755557F55575F55B55555B0555
      5B5557555557F55557555555555B555555555555555755555555}
    NumGlyphs = 2
    OnClick = SpeedButton1Click
  end
  object rg_portas: TRadioGroup
    Left = 16
    Top = 8
    Width = 185
    Height = 105
    Caption = 'Portas seriais dispon'#237'veis'
    Color = clGradientInactiveCaption
    ParentColor = False
    TabOrder = 7
  end
  object Memo1: TMemo
    Left = 232
    Top = 8
    Width = 65
    Height = 249
    ScrollBars = ssVertical
    TabOrder = 6
  end
  object b_ativar: TButton
    Left = 24
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Ativar!'
    TabOrder = 0
    OnClick = b_ativarClick
  end
  object cb_transmitir: TCheckBox
    Left = 32
    Top = 168
    Width = 73
    Height = 17
    Caption = 'Transmitir'
    Checked = True
    State = cbChecked
    TabOrder = 2
    OnClick = cb_transmitirClick
  end
  object b_desativar: TButton
    Left = 120
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Desativar'
    Enabled = False
    TabOrder = 1
    OnClick = b_desativarClick
  end
  object cb_enviaEnter: TCheckBox
    Left = 32
    Top = 192
    Width = 121
    Height = 17
    Caption = 'ENTER autom'#225'tico'
    TabOrder = 3
    OnClick = cb_enviaEnterClick
  end
  object cb_number: TCheckBox
    Left = 32
    Top = 216
    Width = 113
    Height = 17
    Caption = '# transmite ENTER'
    Checked = True
    Enabled = False
    State = cbChecked
    TabOrder = 4
  end
  object cb_asterisco: TCheckBox
    Left = 32
    Top = 240
    Width = 97
    Height = 17
    Caption = '* transmite ESC'
    Checked = True
    Ctl3D = True
    Enabled = False
    ParentCtl3D = False
    State = cbChecked
    TabOrder = 5
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 160
    Top = 24
  end
end
