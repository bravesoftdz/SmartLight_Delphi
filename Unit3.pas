unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TForm3 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    StatusBar1: TStatusBar;
    TabSheet5: TTabSheet;
    GroupBox14: TGroupBox;
    HalfTime_Memo: TMemo;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    StrongPower_Confirm: TButton;
    StrongPower_Lightnum: TEdit;
    StrongPower_Value: TEdit;
    StrongPower_Clear: TButton;
    GroupBox7: TGroupBox;
    StrongPower_Memo: TMemo;
    GroupBox2: TGroupBox;
    GroupBox8: TGroupBox;
    HalfPower_Memo: TMemo;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    WeakPower_Confirm: TButton;
    WeakPower_Lightnum: TEdit;
    WeakPower_Value: TEdit;
    WeakPower_Clear: TButton;
    GroupBox9: TGroupBox;
    WeakPower_Memo: TMemo;
    GroupBox4: TGroupBox;
    GroupBox10: TGroupBox;
    StrongTime_Memo: TMemo;
    Timer1: TTimer;
    Timer2: TTimer;
    TabSheet6: TTabSheet;
    GroupBox6: TGroupBox;
    GroupBox12: TGroupBox;
    NightVoltage_Memo: TMemo;
    Label3: TLabel;
    HalfPower_Lightnum: TEdit;
    Label4: TLabel;
    HalfPower_Value: TEdit;
    HalfPower_Clear: TButton;
    HalfPower_Confirm: TButton;
    Label9: TLabel;
    StrongTime_Lightnum: TEdit;
    Label10: TLabel;
    StrongTime_Value: TEdit;
    StrongTime_Clear: TButton;
    StrongTime_Confirm: TButton;
    GroupBox13: TGroupBox;
    Label5: TLabel;
    HalfTime_Lightnum: TEdit;
    Label6: TLabel;
    HalfTime_Value: TEdit;
    HalfTime_Clear: TButton;
    HalfTime_Confirm: TButton;
    Label11: TLabel;
    NightVoltage_Lightnum: TEdit;
    Label12: TLabel;
    NightVoltage_Value: TEdit;
    NightVoltage_Clear: TButton;
    NightVoltage_Confirm: TButton;
    procedure StrongPower_ConfirmClick(Sender: TObject);

    procedure StrongPower_LightnumKeyPress(Sender: TObject; var Key: Char);
    procedure StrongPower_ValueKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure StrongPower_ClearClick(Sender: TObject);
    procedure WeakPower_ConfirmClick(Sender: TObject);
    procedure StrongTime_ConfirmClick(Sender: TObject);



    procedure WeakPower_ClearClick(Sender: TObject);
    procedure StrongTime_ClearClick(Sender: TObject);

    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure WeakPower_LightnumKeyPress(Sender: TObject; var Key: Char);
    procedure WeakPower_ValueKeyPress(Sender: TObject; var Key: Char);
    procedure StrongTime_LightnumKeyPress(Sender: TObject; var Key: Char);
    procedure StrongTime_ValueKeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet1Show(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure TabSheet4Show(Sender: TObject);
    procedure TabSheet5Show(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure HalfPower_ConfirmClick(Sender: TObject);
    procedure HalfTime_ConfirmClick(Sender: TObject);
    procedure NightVoltage_ConfirmClick(Sender: TObject);
    procedure HalfPower_ClearClick(Sender: TObject);
    procedure HalfTime_ClearClick(Sender: TObject);
    procedure NightVoltage_ClearClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  msg:string;
  retry:integer;
  retryMax:integer;
  orderType:integer;

implementation

uses Unit1, Unit5;


{$R *.dfm}



procedure TForm3.StrongPower_ConfirmClick(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'服务器：已连接') or (Pos('未',Form1.StatusBar1.Panels[2].Text) > 0) then
begin
  ShowMessage('服务器或者远程GSM设备未连接');
end else if Length(StrongPower_Value.Text)=0 then
begin
  ShowMessage('强亮强度不能为空');
end else if Length(StrongPower_Lightnum.Text)=0  then
  begin
  ShowMessage('路灯编号不能为空');
  end else
  begin
    orderType:=1;
    retryMax:=16;
    PageControl1.Enabled:=false;
    Form1.DataReceived.Clear;
    msg:=FormatFloat('000', StrToInt(StrongPower_Lightnum.Text));
    msg:='*SSP L'+msg+' '+FormatFloat('00', StrToInt(StrongPower_Value.Text));
    Form1.SendMessage(msg);
    Timer1.Enabled:=true;
    StrongPower_Memo.Clear;
    StrongPower_Memo.Font.Color:=clWindowText;
    StrongPower_Memo.Lines.Add('正在对编号为:L'+FormatFloat('000', StrToInt(StrongPower_Lightnum.Text))+'的路灯设置强亮功率值为:'+FormatFloat('00', StrToInt(StrongPower_Value.Text))+'W,请稍候。。。');
    end;
end;






procedure TForm3.StrongPower_LightnumKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
end;
end;


procedure TForm3.StrongPower_ValueKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;
end;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  SetWindowLong(StrongPower_Lightnum.Handle, GWL_STYLE, GetWindowLong(StrongPower_Lightnum.Handle, GWL_STYLE) or ES_CENTER);
  StrongPower_Lightnum.Invalidate;
  SetWindowLong(StrongPower_Value.Handle, GWL_STYLE, GetWindowLong(StrongPower_Value.Handle, GWL_STYLE) or ES_CENTER);
  StrongPower_Value.Invalidate;

  SetWindowLong(HalfPower_Lightnum.Handle, GWL_STYLE, GetWindowLong(HalfPower_Value.Handle, GWL_STYLE) or ES_CENTER);
  HalfPower_Lightnum.Invalidate;
  SetWindowLong(HalfPower_Value.Handle, GWL_STYLE, GetWindowLong(HalfPower_Value.Handle, GWL_STYLE) or ES_CENTER);
  HalfPower_Value.Invalidate;

  SetWindowLong(WeakPower_Lightnum.Handle, GWL_STYLE, GetWindowLong(WeakPower_Lightnum.Handle, GWL_STYLE) or ES_CENTER);
  WeakPower_Lightnum.Invalidate;
  SetWindowLong(WeakPower_Value.Handle, GWL_STYLE, GetWindowLong(WeakPower_Value.Handle, GWL_STYLE) or ES_CENTER);
  WeakPower_Value.Invalidate;

  SetWindowLong(StrongTime_Lightnum.Handle, GWL_STYLE, GetWindowLong(StrongTime_Lightnum.Handle, GWL_STYLE) or ES_CENTER);
  StrongTime_Lightnum.Invalidate;
  SetWindowLong(StrongTime_Value.Handle, GWL_STYLE, GetWindowLong(StrongTime_Value.Handle, GWL_STYLE) or ES_CENTER);
  StrongTime_Value.Invalidate;


  SetWindowLong(HalfTime_Lightnum.Handle, GWL_STYLE, GetWindowLong(HalfTime_Lightnum.Handle, GWL_STYLE) or ES_CENTER);
  HalfTime_Lightnum.Invalidate;
  SetWindowLong(HalfTime_Value.Handle, GWL_STYLE, GetWindowLong(HalfTime_Value.Handle, GWL_STYLE) or ES_CENTER);
  HalfTime_Value.Invalidate;

  SetWindowLong(NightVoltage_Lightnum.Handle, GWL_STYLE, GetWindowLong(NightVoltage_Lightnum.Handle, GWL_STYLE) or ES_CENTER);
  NightVoltage_Lightnum.Invalidate;
  SetWindowLong(NightVoltage_Value.Handle, GWL_STYLE, GetWindowLong(NightVoltage_Value.Handle, GWL_STYLE) or ES_CENTER);
  NightVoltage_Value.Invalidate;

  TabSheet1.Show;
end;

procedure TForm3.StrongPower_ClearClick(Sender: TObject);
begin
StrongPower_Lightnum.Clear;
StrongPower_Value.Clear;
end;

procedure TForm3.WeakPower_ConfirmClick(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'服务器：已连接') or (Pos('未',Form1.StatusBar1.Panels[2].Text) > 0) then
  begin
  ShowMessage('服务器或者远程GSM设备未连接');
end else if Length(WeakPower_Value.Text)=0 then
  begin
  ShowMessage('弱亮强度不能为空');
end else  if Length(WeakPower_Lightnum.Text)=0  then
    begin
    ShowMessage('路灯编号不能为空');
  end else
    begin
    orderType:=3;
    retryMax:=16;
    Form1.DataReceived.Clear;
    PageControl1.Enabled:=false;
    msg:=FormatFloat('000', StrToInt(WeakPower_Lightnum.Text));
    msg:='*SWP L'+msg+' '+FormatFloat('00', StrToInt(WeakPower_Value.Text));
    Form1.SendMessage(msg);
    Timer1.Enabled:=true;
    WeakPower_Memo.Clear;
    WeakPower_Memo.Font.Color:=clWindowText;
    WeakPower_Memo.Lines.Add('正在对编号为:L'+FormatFloat('000', StrToInt(WeakPower_Lightnum.Text))+'的路灯设置弱亮强度值为:'+FormatFloat('00', StrToInt(WeakPower_Value.Text))+'W,请稍候。。。');
    end;
end;

procedure TForm3.StrongTime_ConfirmClick(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'服务器：已连接') or (Pos('未',Form1.StatusBar1.Panels[2].Text) > 0) then
begin
  ShowMessage('服务器或者远程GSM设备未连接');
end else if Length(StrongTime_Value.Text)=0 then
begin
  ShowMessage('强亮时长不能为空');
end else if Length(StrongTime_Lightnum.Text)=0  then
  begin
  ShowMessage('路灯编号不能为空');
  end else
  begin
    orderType:=4;
    retryMax:=16;
    Form1.DataReceived.Clear;
    PageControl1.Enabled:=false;
    msg:=FormatFloat('000', StrToInt(StrongTime_Lightnum.Text));
    msg:='*SST L'+msg+' '+FormatFloat('00', StrToInt(StrongTime_Value.Text));
    Form1.SendMessage(msg);
    Timer1.Enabled:=true;
    StrongTime_Memo.Clear;
    StrongTime_Memo.Font.Color:=clWindowText;
    StrongTime_Memo.Lines.Add('正在对编号为:L'+FormatFloat('000', StrToInt(StrongTime_Lightnum.Text))+'的路灯设置强亮时长值为:'+FormatFloat('00', StrToInt(StrongTime_Value.Text))+'H,请稍候。。。');
    end;
end;




procedure TForm3.WeakPower_ClearClick(Sender: TObject);
begin
WeakPower_Lightnum.Clear;
WeakPower_Value.Clear;
end;

procedure TForm3.StrongTime_ClearClick(Sender: TObject);
begin
StrongTime_Lightnum.Clear;
StrongTime_Value.Clear;
end;


procedure TForm3.Timer1Timer(Sender: TObject);
var
Memo:TMemo;
begin
  case orderType of
    1:Memo:=StrongPower_Memo;
    2:Memo:=HalfPower_Memo;
    3:Memo:=WeakPower_Memo;
    4:Memo:=StrongTime_Memo;
    5:Memo:=HalfTime_Memo;
    6:Memo:=NightVoltage_Memo;
    else
     Memo:=StrongPower_Memo;
    end;
  retry:=retry+1;
  if(Pos('Remoter Receive',Form1.DataReceived.Text))>0 then
  begin
    Timer1.Enabled:=False;  //一定要先停止定时器 再做别的事情
    retry:=0;
    retryMax:=0;
    Memo.Clear;
    Memo.Font.Color:=clWindowText;
    Memo.Lines.Add('参数设置成功！');
    orderType:=0;
    PageControl1.Enabled:=true;
  end else  if(retry=5) then
  begin
    Form1.SendMessage(msg);
    Memo.Clear;
    Memo.Font.Color:=clWindowText;
    Memo.Lines.Add('进行第二次尝试。。');
  end else  if(retry=11) then
  begin
    Form1.SendMessage(msg);
    Memo.Clear;
    Memo.Font.Color:=clWindowText;
    Memo.Lines.Add('进行第三次尝试。。');
  end else  if(retry=retryMax) then
  begin
    Timer1.Enabled:=False;
    retry:=0;
    retryMax:=0;
    Memo.Clear;
    Memo.Font.Color:=clRed;
    Memo.Lines.Add('参数设置失败！');
    orderType:=0;
    PageControl1.Enabled:=true;
   end;
end;


procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
self.Free;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
StatusBar1.Panels[0].Text:=Form5.user;
end;

procedure TForm3.Timer2Timer(Sender: TObject);
var
Memo:TMemo;
begin
    case orderType of
    1:Memo:=StrongPower_Memo;
    2:Memo:=HalfPower_Memo;
    3:Memo:=WeakPower_Memo;
    4:Memo:=StrongTime_Memo;
    5:Memo:=HalfTime_Memo;
    6:Memo:=NightVoltage_Memo;
    else
     Memo:=StrongPower_Memo;
    end;
  retry:=retry+1;
if(Pos('Remoter Receive',Form1.DataReceived.Text))>0 then
  begin
  retryMax:=40;
  if(retry=12) then
    begin
    Memo.Clear;
    Memo.Lines.Add('收到返回数据，请稍后。。。');
  end else if(retry=20) then
    begin
    Form1.SendMessage(msg);
  end else if(retry=30) then
    begin
    Form1.SendMessage(msg);
    Memo.Clear;
    Memo.Lines.Add('正在对返回数据进行分析，请稍后。。。');
  end else if(retry=retryMax) then
    begin
    Timer2.Enabled:=false;
    PageControl1.Enabled:=true;
    retry:=0;
    retryMax:=0;
    //GetLightNum();
  end;
end else  if(retry=6) then
    begin
    Form1.SendMessage(msg);
    Memo.Clear;
    Memo.Font.Color:=clWindowText;
    Memo.Lines.Add('进行第二次尝试。。');
  end else if(retry=11) then
    begin
    Form1.SendMessage(msg);
    Memo.Clear;
    Memo.Font.Color:=clWindowText;
    Memo.Lines.Add('进行第三次尝试。。');
  end else  if(retry=retryMax) then
    begin
    Timer2.Enabled:=false;
    Memo.Clear;
    Memo.Font.Color:=clRed;
    Memo.Lines.Add('参数设置失败');
    PageControl1.Enabled:=true;
    retry:=0;
    retryMax:=0;
    orderType:=0;
  end;
end;




{procedure TForm3.GetLightNum();
var
received:String;
i:integer;
j:integer;
k:integer;
l:integer;
m:integer;
p:integer;
List:TStringList;
SucceedList:TStringList;
FailedList:TStringList;
Memo:TMemo;
begin
  case orderType of
    1:Memo:=StrongPower_Memo;
    2:Memo:=WeakPower_Memo;
    3:Memo:=StrongTime_Memo;
    4:Memo:=SwitchVoltage_Memo;
    5:Memo:=BestPower_Memo;
    6:Memo:=PWM_Memo;
    7:Memo:=ChargeMode_Memo;
    else
     Memo:=StrongPower_Memo;
    end;
p:=0;
received:=Form1.DataReceived.Text;
List := TStringList.Create;
SucceedList := TStringList.Create;
FailedList := TStringList.Create;
List.Sorted := True;          //需要先指定排序
List.Duplicates := dupIgnore;           //如有重复值则放弃
for i:=1 to  Length(received) do
  begin
    if (received[i]='L') then
    begin
    List.Add(Copy(received,i+1,3)) ;
    end;
  end;


for j:=0 to StrToInt(List[List.Count-1]) do
begin
  for k:=0 to List.Count-1 do
  begin
    if(j<>StrToInt(List[k])) then
    begin
      p:=p+1;
    end;
  end;
if(p=List.Count) then
  begin
  FailedList.Add(inttostr(j));
  p:=0;
  end else
  begin
  SucceedList.Add(inttostr(j));
  p:=0;
  end;
end;

Memo.Clear;
Memo.Lines.Add('共对'+IntToStr(List.Count)+'个路灯设置参数成功;');
Memo.Lines.Add('其中最小编号为 L'+List[0]+';');
Memo.Lines.Add('最大编号为 L'+List[List.Count-1]+';');

if(FailedList.Count=0) then
  begin
  Memo.Lines.Add('全部路灯参数设置成功');
end else if SucceedList.Count < FailedList.Count then
  begin
  for m:=0 to SucceedList.Count-1 do
    begin
    Memo.Text:=Memo.Text+'L'+FormatFloat('000', StrToInt(SucceedList[m]))+' ';
  end;
  Memo.Text:=Memo.Text+'路灯设置参数成功';
  Memo.Lines.Add('其余路灯设置参数失败');
end else
  begin
  for l:=0 to FailedList.Count-1 do
   begin
   Memo.Text:=Memo.Text+'L'+FormatFloat('000', StrToInt(FailedList[l]))+' ';
  end;
   Memo.Text:=Memo.Text+'路灯设置参数失败';
   Memo.Lines.Add('其余路灯设置参数成功');
end;
end; }








procedure TForm3.WeakPower_LightnumKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;

end;
end;

procedure TForm3.WeakPower_ValueKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;

end;
end;

procedure TForm3.StrongTime_LightnumKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;

end;
end;

procedure TForm3.StrongTime_ValueKeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;

end;
end;

procedure TForm3.TabSheet1Show(Sender: TObject);
begin
StrongPower_Lightnum.SetFocus ;
end;


procedure TForm3.TabSheet2Show(Sender: TObject);
begin
HalfPower_Lightnum.SetFocus;
end;

procedure TForm3.TabSheet3Show(Sender: TObject);
begin
WeakPower_Lightnum.SetFocus;
end;

procedure TForm3.TabSheet4Show(Sender: TObject);
begin
StrongTime_Lightnum.SetFocus ;
end;

procedure TForm3.TabSheet5Show(Sender: TObject);
begin
HalfTime_Lightnum.SetFocus ;
end;

procedure TForm3.TabSheet6Show(Sender: TObject);
begin
NightVoltage_Lightnum.SetFocus ;
end;


procedure TForm3.HalfPower_ConfirmClick(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'服务器：已连接') or (Pos('未',Form1.StatusBar1.Panels[2].Text) > 0) then
begin
  ShowMessage('服务器或者远程GSM设备未连接');
end else if Length(HalfPower_Value.Text)=0 then
begin
  ShowMessage('半亮强度不能为空');
end else if Length(HalfPower_Lightnum.Text)=0  then
  begin
  ShowMessage('路灯编号不能为空');
  end else
  begin
    orderType:=2;
    retryMax:=16;
    PageControl1.Enabled:=false;
    Form1.DataReceived.Clear;
    msg:=FormatFloat('000', StrToInt(HalfPower_Lightnum.Text));
    msg:='*SHP L'+msg+' '+FormatFloat('00', StrToInt(HalfPower_Value.Text));
    Form1.SendMessage(msg);
    Timer1.Enabled:=true;
    HalfPower_Memo.Clear;
    HalfPower_Memo.Font.Color:=clWindowText;
    HalfPower_Memo.Lines.Add('正在对编号为:L'+FormatFloat('000', StrToInt(HalfPower_Lightnum.Text))+'的路灯设置半亮强度值为:'+FormatFloat('00', StrToInt(HalfPower_Value.Text))+'W,请稍后。。。');
    end;

end;

procedure TForm3.HalfTime_ConfirmClick(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'服务器：已连接') or (Pos('未',Form1.StatusBar1.Panels[2].Text) > 0) then
begin
  ShowMessage('服务器或者远程GSM设备未连接');
end else if Length(HalfTime_Value.Text)=0 then
begin
  ShowMessage('半亮时长不能为空');
end else if Length(HalfTime_Lightnum.Text)=0  then
  begin
  ShowMessage('路灯编号不能为空');
  end else
  begin
    orderType:=5;
    retryMax:=16;
    PageControl1.Enabled:=false;
    Form1.DataReceived.Clear;
    msg:=FormatFloat('000', StrToInt(HalfTime_Lightnum.Text));
    msg:='*SHT L'+msg+' '+FormatFloat('00', StrToInt(HalfTime_Value.Text));
    Form1.SendMessage(msg);
    Timer1.Enabled:=true;
    HalfTime_Memo.Clear;
    HalfTime_Memo.Font.Color:=clWindowText;
    HalfTime_Memo.Lines.Add('正在对编号为:L'+FormatFloat('000', StrToInt(HalfTime_Lightnum.Text))+'的路灯设置半亮时长值为:'+FormatFloat('00', StrToInt(HalfTime_Value.Text))+'H,请稍候。。。');
    end;

end;

procedure TForm3.NightVoltage_ConfirmClick(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'服务器：已连接') or (Pos('未',Form1.StatusBar1.Panels[2].Text) > 0) then
begin
  ShowMessage('服务器或者远程GSM设备未连接');
end else if Length(NightVoltage_Value.Text)=0 then
begin
  ShowMessage('夜晚阈值电压不能为空');
end else if Length(NightVoltage_Lightnum.Text)=0  then
  begin
  ShowMessage('路灯编号不能为空');
  end else
  begin
    orderType:=6;
    retryMax:=16;
    PageControl1.Enabled:=false;
    Form1.DataReceived.Clear;
    msg:=FormatFloat('000', StrToInt(NightVoltage_Lightnum.Text));
    msg:='*STN L'+msg+' '+FormatFloat('00', StrToInt(NightVoltage_Value.Text));
    Form1.SendMessage(msg);
    Timer1.Enabled:=true;
    NightVoltage_Memo.Clear;
    NightVoltage_Memo.Font.Color:=clWindowText;
    NightVoltage_Memo.Lines.Add('正在对编号为:L'+FormatFloat('000', StrToInt(NightVoltage_Lightnum.Text))+'的路灯设置夜晚阈值电压值为:'+FormatFloat('00', StrToInt(NightVoltage_Value.Text))+'V,请稍候。。。');
    end;


end;

procedure TForm3.HalfPower_ClearClick(Sender: TObject);
begin
HalfPower_Lightnum.Clear;
HalfPower_Value.Clear;
end;

procedure TForm3.HalfTime_ClearClick(Sender: TObject);
begin
HalfTime_Lightnum.Clear;
HalfTime_Value.Clear;
end;

procedure TForm3.NightVoltage_ClearClick(Sender: TObject);
begin
NightVoltage_Lightnum.Clear;
NightVoltage_Value.Clear;
end;

end.


