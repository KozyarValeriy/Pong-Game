object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Pong'
  ClientHeight = 380
  ClientWidth = 600
  Color = clBackground
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWhite
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseWheelDown = FormMouseWheelDown
  OnMouseWheelUp = FormMouseWheelUp
  OnResize = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Shape4: TShape
    Left = 300
    Top = 5
    Width = 1
    Height = 380
    Brush.Style = bsClear
    Pen.Color = clWhite
    Pen.Style = psDash
    Visible = False
  end
  object Shape1: TShape
    Left = 20
    Top = 168
    Width = 8
    Height = 60
    Pen.Color = clWhite
  end
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 10
    Height = 22
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape2: TShape
    Left = 575
    Top = 168
    Width = 8
    Height = 60
    Pen.Color = clWhite
  end
  object Label2: TLabel
    Left = 582
    Top = 5
    Width = 10
    Height = 22
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Shape3: TShape
    Left = 296
    Top = 186
    Width = 8
    Height = 8
    Pen.Color = clWhite
  end
  object Label4: TLabel
    Left = 261
    Top = 86
    Width = 92
    Height = 22
    Caption = 'Ball speed: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 281
    Top = 10
    Width = 38
    Height = 22
    Caption = '0 : 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 280
    Top = 318
    Width = 46
    Height = 22
    Caption = 'Pause'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -18
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object TrackBar1: TTrackBar
    Left = 224
    Top = 50
    Width = 150
    Height = 30
    Ctl3D = True
    Max = 20
    Min = 10
    ParentCtl3D = False
    Position = 18
    TabOrder = 1
    OnChange = TrackBar1Change
  end
  object Button1: TButton
    Left = 240
    Top = 122
    Width = 113
    Height = 41
    Caption = 'Start'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 18
    OnTimer = Timer1Timer
    Left = 528
    Top = 272
  end
  object Timer2: TTimer
    Interval = 50
    OnTimer = Timer2Timer
    Left = 456
    Top = 280
  end
end
