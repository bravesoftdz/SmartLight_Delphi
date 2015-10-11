object Form3: TForm3
  Left = 394
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21442#25968#35774#32622
  ClientHeight = 444
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 10
    Top = 17
    Width = 370
    Height = 400
    ActivePage = TabSheet3
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #24378#20142#24378#24230
      object GroupBox1: TGroupBox
        Left = 16
        Top = 25
        Width = 330
        Height = 160
        Caption = '   '#21442#25968#36873#39033'   '
        TabOrder = 0
        object Label1: TLabel
          Left = 66
          Top = 43
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #36335#28783#32534#21495
          Transparent = False
          Layout = tlCenter
        end
        object Label2: TLabel
          Left = 66
          Top = 76
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #24378#20142#24378#24230
          Layout = tlCenter
        end
        object StrongPower_Confirm: TButton
          Left = 176
          Top = 112
          Width = 75
          Height = 25
          Caption = #30830#35748
          TabOrder = 0
          OnClick = StrongPower_ConfirmClick
        end
        object StrongPower_Lightnum: TEdit
          Left = 129
          Top = 40
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 3
          TabOrder = 1
          OnKeyPress = StrongPower_LightnumKeyPress
        end
        object StrongPower_Value: TEdit
          Left = 129
          Top = 72
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 2
          TabOrder = 2
          OnKeyPress = StrongPower_ValueKeyPress
        end
        object StrongPower_Clear: TButton
          Left = 66
          Top = 112
          Width = 75
          Height = 25
          Caption = #28165#31354
          TabOrder = 3
          OnClick = StrongPower_ClearClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 16
        Top = 200
        Width = 330
        Height = 145
        Caption = '   '#21442#25968#35774#32622#32467#26524'   '
        TabOrder = 1
        object StrongPower_Memo: TMemo
          Left = 14
          Top = 24
          Width = 300
          Height = 105
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #21322#20142#24378#24230
      ImageIndex = 1
      OnShow = TabSheet2Show
      object GroupBox2: TGroupBox
        Left = 16
        Top = 25
        Width = 330
        Height = 160
        Caption = '   '#21442#25968#36873#39033'   '
        TabOrder = 0
        object Label3: TLabel
          Left = 66
          Top = 43
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #36335#28783#32534#21495
          Transparent = False
          Layout = tlCenter
        end
        object Label4: TLabel
          Left = 66
          Top = 76
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #21322#20142#24378#24230
          Layout = tlCenter
        end
        object HalfPower_Lightnum: TEdit
          Left = 129
          Top = 40
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 3
          TabOrder = 0
          OnKeyPress = StrongPower_LightnumKeyPress
        end
        object HalfPower_Value: TEdit
          Left = 129
          Top = 72
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 2
          TabOrder = 1
          OnKeyPress = StrongPower_ValueKeyPress
        end
        object HalfPower_Clear: TButton
          Left = 66
          Top = 112
          Width = 75
          Height = 25
          Caption = #28165#31354
          TabOrder = 2
          OnClick = HalfPower_ClearClick
        end
        object HalfPower_Confirm: TButton
          Left = 176
          Top = 112
          Width = 75
          Height = 25
          Caption = #30830#35748
          TabOrder = 3
          OnClick = HalfPower_ConfirmClick
        end
      end
      object GroupBox8: TGroupBox
        Left = 16
        Top = 200
        Width = 330
        Height = 145
        Caption = '   '#21442#25968#35774#32622#32467#26524'   '
        TabOrder = 1
        object HalfPower_Memo: TMemo
          Left = 14
          Top = 24
          Width = 300
          Height = 105
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = #24369#20142#24378#24230
      ImageIndex = 2
      OnShow = TabSheet3Show
      object GroupBox3: TGroupBox
        Left = 16
        Top = 25
        Width = 330
        Height = 160
        Caption = '   '#21442#25968#36873#39033'   '
        TabOrder = 0
        object Label7: TLabel
          Left = 66
          Top = 43
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #36335#28783#32534#21495
          Transparent = False
          Layout = tlCenter
        end
        object Label8: TLabel
          Left = 66
          Top = 76
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #24369#20142#24378#24230
          Layout = tlCenter
        end
        object WeakPower_Confirm: TButton
          Left = 176
          Top = 112
          Width = 75
          Height = 25
          Caption = #30830#35748
          TabOrder = 0
          OnClick = WeakPower_ConfirmClick
        end
        object WeakPower_Lightnum: TEdit
          Left = 129
          Top = 40
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 3
          TabOrder = 1
          OnKeyPress = StrongTime_LightnumKeyPress
        end
        object WeakPower_Value: TEdit
          Left = 129
          Top = 72
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 2
          TabOrder = 2
          OnKeyPress = StrongTime_ValueKeyPress
        end
        object WeakPower_Clear: TButton
          Left = 66
          Top = 112
          Width = 75
          Height = 25
          Caption = #28165#31354
          TabOrder = 3
          OnClick = WeakPower_ClearClick
        end
      end
      object GroupBox9: TGroupBox
        Left = 16
        Top = 200
        Width = 330
        Height = 145
        Caption = '   '#21442#25968#35774#32622#32467#26524'   '
        TabOrder = 1
        object WeakPower_Memo: TMemo
          Left = 14
          Top = 24
          Width = 300
          Height = 105
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = #24378#20142#26102#38271
      ImageIndex = 3
      OnShow = TabSheet4Show
      object GroupBox4: TGroupBox
        Left = 16
        Top = 25
        Width = 330
        Height = 160
        Caption = '   '#21442#25968#36873#39033'   '
        TabOrder = 0
        object Label9: TLabel
          Left = 66
          Top = 43
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #36335#28783#32534#21495
          Transparent = False
          Layout = tlCenter
        end
        object Label10: TLabel
          Left = 66
          Top = 76
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #24378#20142#26102#38271
          Layout = tlCenter
        end
        object StrongTime_Lightnum: TEdit
          Left = 129
          Top = 40
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 3
          TabOrder = 0
          OnKeyPress = StrongPower_LightnumKeyPress
        end
        object StrongTime_Value: TEdit
          Left = 129
          Top = 72
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 2
          TabOrder = 1
          OnKeyPress = StrongPower_ValueKeyPress
        end
        object StrongTime_Clear: TButton
          Left = 66
          Top = 112
          Width = 75
          Height = 25
          Caption = #28165#31354
          TabOrder = 2
          OnClick = StrongTime_ClearClick
        end
        object StrongTime_Confirm: TButton
          Left = 176
          Top = 112
          Width = 75
          Height = 25
          Caption = #30830#35748
          TabOrder = 3
          OnClick = StrongTime_ConfirmClick
        end
      end
      object GroupBox10: TGroupBox
        Left = 16
        Top = 200
        Width = 330
        Height = 145
        Caption = '   '#21442#25968#35774#32622#32467#26524'   '
        TabOrder = 1
        object StrongTime_Memo: TMemo
          Left = 14
          Top = 24
          Width = 300
          Height = 105
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = #21322#20142#26102#38271
      ImageIndex = 6
      object GroupBox14: TGroupBox
        Left = 16
        Top = 200
        Width = 330
        Height = 145
        Caption = '   '#21442#25968#35774#32622#32467#26524'   '
        TabOrder = 0
        object HalfTime_Memo: TMemo
          Left = 14
          Top = 24
          Width = 300
          Height = 105
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
      end
      object GroupBox13: TGroupBox
        Left = 16
        Top = 25
        Width = 330
        Height = 160
        Caption = '   '#21442#25968#36873#39033'   '
        TabOrder = 1
        object Label5: TLabel
          Left = 66
          Top = 43
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #36335#28783#32534#21495
          Transparent = False
          Layout = tlCenter
        end
        object Label6: TLabel
          Left = 66
          Top = 76
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #21322#20142#26102#38271
          Layout = tlCenter
        end
        object HalfTime_Lightnum: TEdit
          Left = 129
          Top = 40
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 3
          TabOrder = 0
          OnKeyPress = StrongPower_LightnumKeyPress
        end
        object HalfTime_Value: TEdit
          Left = 129
          Top = 72
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 2
          TabOrder = 1
          OnKeyPress = StrongPower_ValueKeyPress
        end
        object HalfTime_Clear: TButton
          Left = 66
          Top = 112
          Width = 75
          Height = 25
          Caption = #28165#31354
          TabOrder = 2
          OnClick = HalfTime_ClearClick
        end
        object HalfTime_Confirm: TButton
          Left = 176
          Top = 112
          Width = 75
          Height = 25
          Caption = #30830#35748
          TabOrder = 3
          OnClick = HalfTime_ConfirmClick
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = #22812#26202#38408#20540#30005#21387
      ImageIndex = 5
      object GroupBox6: TGroupBox
        Left = 16
        Top = 25
        Width = 330
        Height = 160
        Caption = '   '#21442#25968#36873#39033'   '
        TabOrder = 0
        object Label11: TLabel
          Left = 66
          Top = 43
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #36335#28783#32534#21495
          Transparent = False
          Layout = tlCenter
        end
        object Label12: TLabel
          Left = 66
          Top = 76
          Width = 48
          Height = 12
          Alignment = taCenter
          Caption = #22812#26202#38408#20540
          Layout = tlCenter
        end
        object NightVoltage_Lightnum: TEdit
          Left = 129
          Top = 40
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 3
          TabOrder = 0
          OnKeyPress = StrongPower_LightnumKeyPress
        end
        object NightVoltage_Value: TEdit
          Left = 129
          Top = 72
          Width = 121
          Height = 20
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          MaxLength = 2
          TabOrder = 1
          OnKeyPress = StrongPower_ValueKeyPress
        end
        object NightVoltage_Clear: TButton
          Left = 66
          Top = 112
          Width = 75
          Height = 25
          Caption = #28165#31354
          TabOrder = 2
          OnClick = NightVoltage_ClearClick
        end
        object NightVoltage_Confirm: TButton
          Left = 176
          Top = 112
          Width = 75
          Height = 25
          Caption = #30830#35748
          TabOrder = 3
          OnClick = NightVoltage_ConfirmClick
        end
      end
      object GroupBox12: TGroupBox
        Left = 16
        Top = 200
        Width = 330
        Height = 145
        Caption = '   '#21442#25968#35774#32622#32467#26524'   '
        TabOrder = 1
        object NightVoltage_Memo: TMemo
          Left = 14
          Top = 24
          Width = 300
          Height = 105
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 0
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 425
    Width = 392
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 200
      end
      item
        Alignment = taCenter
        Text = #33487#24030#20113#21338#20449#24687#25216#26415#26377#38480#20844#21496
        Width = 50
      end>
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 302
    Top = 90
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 302
    Top = 130
  end
end
