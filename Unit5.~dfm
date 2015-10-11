object Form5: TForm5
  Left = 489
  Top = 237
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29992#25143#30331#24405
  ClientHeight = 253
  ClientWidth = 334
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 76
    Top = 74
    Width = 48
    Height = 12
    Caption = #29992#25143#21517#65306
  end
  object Label2: TLabel
    Left = 79
    Top = 123
    Width = 42
    Height = 12
    Caption = #23494' '#30721#65306
  end
  object Label3: TLabel
    Left = 67
    Top = 24
    Width = 192
    Height = 16
    Caption = #36229#32423#30005#23481#36335#28783#36828#31243#30417#25511#31995#32479
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object username: TEdit
    Left = 127
    Top = 71
    Width = 121
    Height = 20
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    TabOrder = 0
  end
  object password: TEdit
    Left = 127
    Top = 119
    Width = 121
    Height = 20
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    PasswordChar = '*'
    TabOrder = 1
    OnKeyPress = passwordKeyPress
  end
  object BitBtn1: TBitBtn
    Left = 176
    Top = 164
    Width = 75
    Height = 30
    Caption = #30331#24405
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 234
    Width = 334
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Text = #25968#25454#24211#65306#27491#22312#36830#25509'..'
        Width = 150
      end
      item
        Alignment = taCenter
        Text = 'Version'#65306'2.0'
        Width = 50
      end>
  end
  object BitBtn2: TBitBtn
    Left = 76
    Top = 164
    Width = 75
    Height = 30
    Caption = #28165#31354
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object ZConnection1: TZConnection
    Protocol = 'mysql'
    HostName = '120.55.98.138'
    Port = 3306
    Database = 'smartlight'
    User = 'root'
    Password = 'zdhdqkz'
    Left = 48
    Top = 208
  end
  object zqry1: TZQuery
    Connection = ZConnection1
    Params = <>
    Left = 136
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = zqry1
    Left = 224
    Top = 288
  end
end
