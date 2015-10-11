object Form7: TForm7
  Left = 505
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29992#25143#31649#29702
  ClientHeight = 390
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object StatusBar1: TStatusBar
    Left = 0
    Top = 371
    Width = 346
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 160
      end
      item
        Alignment = taCenter
        Text = #33487#24030#20113#21338#20449#24687#25216#26415#26377#38480#20844#21496
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 16
    Width = 329
    Height = 345
    ActivePage = TabSheet2
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #28155#21152#26032#29992#25143
      OnShow = TabSheet1Show
      object GroupBox1: TGroupBox
        Left = 16
        Top = 13
        Width = 289
        Height = 300
        Caption = ' '#28155#21152#26032#29992#25143' '
        TabOrder = 0
        object Label2: TLabel
          Left = 46
          Top = 41
          Width = 48
          Height = 12
          Caption = #29992' '#25143' '#21517
        end
        object Label3: TLabel
          Left = 42
          Top = 80
          Width = 60
          Height = 12
          Caption = #35831#35774#32622#23494#30721
        end
        object Label4: TLabel
          Left = 42
          Top = 130
          Width = 60
          Height = 12
          Caption = #35831#30830#35748#23494#30721
        end
        object Label5: TLabel
          Left = 42
          Top = 178
          Width = 60
          Height = 12
          Caption = #35831#35774#32622#26435#38480
        end
        object Label6: TLabel
          Left = 32
          Top = 208
          Width = 222
          Height = 12
          Caption = #39640#32423#26435#38480#20855#26377#20851#38381#36828#31243'GSM'#35774#22791#12289#35774#32622#21442#25968
        end
        object Label7: TLabel
          Left = 70
          Top = 224
          Width = 132
          Height = 12
          Caption = #21644#28155#21152#26032#29992#25143#31561#39640#32423#21151#33021
        end
        object Edit3: TEdit
          Left = 122
          Top = 125
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          PasswordChar = '*'
          TabOrder = 0
        end
        object ComboBox1: TComboBox
          Left = 122
          Top = 176
          Width = 121
          Height = 20
          Style = csDropDownList
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          ItemHeight = 12
          ItemIndex = 0
          TabOrder = 1
          Text = '       '#20302
          Items.Strings = (
            '       '#20302
            '       '#39640)
        end
        object Edit1: TEdit
          Left = 122
          Top = 37
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 2
        end
        object Edit2: TEdit
          Left = 122
          Top = 77
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          PasswordChar = '*'
          TabOrder = 3
        end
        object BitBtn1: TBitBtn
          Left = 48
          Top = 250
          Width = 75
          Height = 33
          Caption = #28165#31354#37325#22635
          TabOrder = 4
          OnClick = BitBtn1Click
        end
        object BitBtn2: TBitBtn
          Left = 160
          Top = 250
          Width = 75
          Height = 33
          Caption = #30830#35748#28155#21152
          TabOrder = 5
          OnClick = BitBtn2Click
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21024#38500#29992#25143
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 16
        Top = 16
        Width = 289
        Height = 273
        Caption = ' '#21024#38500#29992#25143' '
        TabOrder = 0
        object Label1: TLabel
          Left = 70
          Top = 56
          Width = 144
          Height = 12
          Caption = #35831#36755#20837#35201#21024#38500#29992#25143#30340#29992#25143#21517
        end
        object Edit4: TEdit
          Left = 81
          Top = 93
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
        object BitBtn3: TBitBtn
          Left = 102
          Top = 136
          Width = 75
          Height = 25
          Caption = #21024#38500
          TabOrder = 1
          OnClick = BitBtn3Click
        end
      end
    end
  end
end
