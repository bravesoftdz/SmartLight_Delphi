object Form8: TForm8
  Left = 699
  Top = 246
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #20462#25913#23494#30721
  ClientHeight = 231
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 34
    Top = 38
    Width = 72
    Height = 12
    Caption = #35831#36755#20837#21407#23494#30721
  end
  object Label2: TLabel
    Left = 34
    Top = 80
    Width = 72
    Height = 12
    Caption = #35831#36755#20837#26032#23494#30721
  end
  object Label3: TLabel
    Left = 26
    Top = 118
    Width = 84
    Height = 12
    Caption = #20877#27425#36755#20837#26032#23494#30721
  end
  object Edit1: TEdit
    Left = 130
    Top = 35
    Width = 121
    Height = 20
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    PasswordChar = '*'
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 130
    Top = 75
    Width = 121
    Height = 20
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    PasswordChar = '*'
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 130
    Top = 115
    Width = 121
    Height = 20
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    PasswordChar = '*'
    TabOrder = 2
    OnKeyPress = Edit3KeyPress
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 212
    Width = 291
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 140
      end
      item
        Alignment = taCenter
        Text = #33487#24030#20113#21338#20449#24687#25216#26415#26377#38480#20844#21496
        Width = 50
      end>
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 160
    Width = 75
    Height = 25
    Caption = #28165#31354#37325#22635
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 168
    Top = 160
    Width = 75
    Height = 25
    Caption = #30830#35748#20462#25913
    TabOrder = 5
    OnClick = BitBtn2Click
  end
end
