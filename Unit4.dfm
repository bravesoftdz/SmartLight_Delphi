object Form4: TForm4
  Left = 497
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #21442#25968#26597#30475
  ClientHeight = 417
  ClientWidth = 337
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 398
    Width = 337
    Height = 19
    Panels = <
      item
        Alignment = taCenter
        Width = 150
      end
      item
        Alignment = taCenter
        Text = #33487#24030#20113#21338#20449#24687#25216#26415#26377#38480#20844#21496
        Width = 50
      end>
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 24
    Width = 321
    Height = 369
    ActivePage = TabSheet3
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = #26597#30475#36335#28783#24037#20316#29366#24577
      object Edit2: TEdit
        Left = 95
        Top = 18
        Width = 121
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        MaxLength = 3
        TabOrder = 0
      end
      object GroupBox2: TGroupBox
        Left = 15
        Top = 92
        Width = 281
        Height = 220
        Caption = #24037#20316#29366#24577#21015#34920'   '
        TabOrder = 1
        object ListView2: TListView
          Left = 15
          Top = 27
          Width = 250
          Height = 180
          Columns = <
            item
              Caption = #39033#30446
              Width = 160
            end
            item
              Alignment = taCenter
              Caption = #20540
              Width = 86
            end>
          TabOrder = 0
        end
        object Memo2: TMemo
          Left = 15
          Top = 27
          Width = 250
          Height = 180
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
      end
      object BitBtn1: TBitBtn
        Left = 118
        Top = 56
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = #26597#30475#36335#28783#24037#20316#21442#25968
      ImageIndex = 1
      OnShow = TabSheet2Show
      object GroupBox1: TGroupBox
        Left = 16
        Top = 92
        Width = 281
        Height = 245
        Caption = #24037#20316#21442#25968#21015#34920'   '
        TabOrder = 0
        object ListView1: TListView
          Left = 8
          Top = 27
          Width = 265
          Height = 200
          Columns = <
            item
              Caption = #39033#30446
              Width = 160
            end
            item
              Alignment = taCenter
              Caption = #20540
              Width = 82
            end>
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 8
          Top = 27
          Width = 265
          Height = 200
          Alignment = taCenter
          ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
          TabOrder = 1
        end
      end
      object Edit1: TEdit
        Left = 95
        Top = 18
        Width = 121
        Height = 20
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        MaxLength = 3
        TabOrder = 1
        OnKeyPress = Edit1KeyPress
      end
      object BitBtn2: TBitBtn
        Left = 118
        Top = 56
        Width = 75
        Height = 25
        Caption = #26597#35810
        TabOrder = 2
        OnClick = BitBtn2Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'GSM'#30005#28304#30005#21387
      ImageIndex = 2
      object Button1: TButton
        Left = 121
        Top = 72
        Width = 75
        Height = 25
        Caption = #26597#30475
        TabOrder = 0
        OnClick = Button1Click
      end
      object Memo3: TMemo
        Left = 33
        Top = 128
        Width = 241
        Height = 89
        Alignment = taCenter
        ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 40
    Top = 72
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer2Timer
    Left = 124
    Top = 72
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer3Timer
    Left = 212
    Top = 71
  end
end
