unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, Grids, DBGrids, DBCtrls, Menus,
  Buttons;

type
  TForm4 = class(TForm)
    StatusBar1: TStatusBar;
    Edit1: TEdit;
    GroupBox1: TGroupBox;
    ListView1: TListView;
    Timer1: TTimer;
    Memo1: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit2: TEdit;
    GroupBox2: TGroupBox;
    ListView2: TListView;
    Memo2: TMemo;
    Timer2: TTimer;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    TabSheet3: TTabSheet;
    Button1: TButton;
    Memo3: TMemo;
    Timer3: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);
    procedure GetLightParameter();
    procedure FormCreate(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure GetLightRunStatus();
    procedure TabSheet2Show(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  msg:string;
  retry:Integer;
  retryMax:Integer;

implementation

uses Unit1, Unit5;

{$R *.dfm}




procedure TForm4.FormShow(Sender: TObject);
begin
StatusBar1.Panels[0].Text:=Form5.user;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
self.Free;
end;

procedure TForm4.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;

end;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin

  retry:=retry+1;
 if(Pos('#',Form1.DataReceived.Text))>0 then
  begin
    Timer1.Enabled:=False;  //һ��Ҫ��ֹͣ��ʱ�� �����������
    retry:=0;
    retryMax:=0;
    ListView1.Clear;
    GetLightParameter();
    PageControl1.Enabled:=true;
  end else  if(retry=8) then
  begin
    Form1.SendMessage('*VPM L'+msg);
    Memo1.Clear;
    Memo1.Font.Color:=clWindowText;
    Memo1.Lines.Add('���еڶ��γ��ԡ���');
  end else  if(retry=14) then
  begin
    Form1.SendMessage('*VPM L'+msg);
    Memo1.Clear;
    Memo1.Font.Color:=clWindowText;
    Memo1.Lines.Add('���е����γ��ԡ���');
  end else  if(retry=retryMax) then
  begin
    Timer1.Enabled:=False;
    retry:=0;
    retryMax:=0;
    Memo1.Clear;
    Memo1.Font.Color:=clRed;
    Memo1.Lines.Add('��ѯ·�Ʋ���ʧ�ܣ�');
    PageControl1.Enabled:=true;
   end;

end;




procedure TForm4.GetLightParameter();
var
received:String;
ParameterList:TStringList;
i:Integer;
a:Integer;
b:Integer;
d:Integer;
begin
received:=Form1.DataReceived.Text;
ParameterList := TStringList.Create;
a := 0;
b := 0;
d := 0;
try
begin
  for i:=0 to Length(received)  do
   begin
   if(received[i]='#') then
     begin
     if d=0 then
     begin
        a := i;
        d := d+1;
     end else
     begin
        b := i;
     end;
     if b <> 0 then
     begin
      ParameterList.Add(Copy(received,a+1,b-a-1)) ;
      a := b;
     end;
   end;
 end;
end;
except
end;
for i:=6 to 10  do
begin
  ParameterList[i] := FloatToStr(StrToInt(ParameterList[i])/10.0);
end;
for i:=16 to 22  do
begin
  ParameterList[i] := FloatToStr(StrToInt(ParameterList[i])/10.0);
end;
Memo1.Visible:=false;
ListView1.Clear;
Listview1.Items.Add.Caption:='·�Ʊ��';
Listview1.Items[0].SubItems.Add('L'+FormatFloat('000', StrToInt(Edit1.Text)));
Listview1.Items.Add.Caption:='ǿ��ǿ��';
Listview1.Items[1].SubItems.Add(ParameterList[0]+' %');
Listview1.Items.Add.Caption:='����ǿ��';
Listview1.Items[2].SubItems.Add(ParameterList[1]+' %');
Listview1.Items.Add.Caption:='����ǿ��';
Listview1.Items[3].SubItems.Add(ParameterList[2]+' %');
Listview1.Items.Add.Caption:='ǿ��ʱ��';
Listview1.Items[4].SubItems.Add(ParameterList[3]+' H');
Listview1.Items.Add.Caption:='����ʱ��';
Listview1.Items[5].SubItems.Add(ParameterList[4]+' H');
Listview1.Items.Add.Caption:='ҹ����ֵ��ѹ';
Listview1.Items[6].SubItems.Add(ParameterList[5]+' V');
Listview1.Items.Add.Caption:='�ͻص�ѹ';
Listview1.Items[7].SubItems.Add(ParameterList[7]+' V');
Listview1.Items.Add.Caption:='����ǿ����ֹ��ѹ';
Listview1.Items[8].SubItems.Add(ParameterList[8]+' V');
Listview1.Items.Add.Caption:='���ݰ�����ֹ��ѹ';
Listview1.Items[9].SubItems.Add(ParameterList[9]+' V');
Listview1.Items.Add.Caption:='﮵��ǿ����ֹ��ѹ';
Listview1.Items[10].SubItems.Add(ParameterList[10]+' V');
//Listview1.Items.Add.Caption:='��緽ʽ�л���ѹ';
//Listview1.Items[11].SubItems.Add(ParameterList[11]+' V');
//Listview1.Items.Add.Caption:='��ѹ��ʵ��ѹ';
//Listview1.Items[12].SubItems.Add(ParameterList[12]+' V');
//Listview1.Items.Add.Caption:='MPPT�����ֵ��ѹ';
//Listview1.Items[13].SubItems.Add(ParameterList[13]+' V');
//Listview1.Items.Add.Caption:='���ݳ�����ֵ��ѹ';
//Listview1.Items[14].SubItems.Add(ParameterList[14]+' V');
//Listview1.Items.Add.Caption:='���ݲ�����ֵ��ѹ';
//Listview1.Items[15].SubItems.Add(ParameterList[15]+' V');
//Listview1.Items.Add.Caption:='﮵�س�����ֵ��ѹ';
//Listview1.Items[16].SubItems.Add(ParameterList[16]+' V');
//Listview1.Items.Add.Caption:='��������ֵ����';
//Listview1.Items[17].SubItems.Add(ParameterList[17]+' A');
//Listview1.Items.Add.Caption:='���������ֵ����';
//Listview1.Items[18].SubItems.Add(ParameterList[18]+' A');
//Listview1.Items.Add.Caption:='��ѹ�����ֵ����';
//Listview1.Items[19].SubItems.Add(ParameterList[19]+' A');
//Listview1.Items.Add.Caption:='���ݷŵ翪����ֵ��ѹ';
//Listview1.Items[20].SubItems.Add(ParameterList[20]+' V');
Listview1.Items.Add.Caption:='���ݷŵ�ر���ֵ��ѹ';
Listview1.Items[11].SubItems.Add(ParameterList[21]+' V');
//Listview1.Items.Add.Caption:='﮵�طŵ翪����ֵ��ѹ';
//Listview1.Items[22].SubItems.Add(ParameterList[22]+' V');
//Listview1.Items.Add.Caption:='﮵�طŵ�ر���ֵ��ѹ';
//Listview1.Items[23].SubItems.Add(ParameterList[22]+' V');
Listview1.ViewStyle:=vsreport;
ParameterList.Clear;
ParameterList.Free;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  SetWindowLong(Edit1.Handle, GWL_STYLE, GetWindowLong(Edit1.Handle, GWL_STYLE) or ES_CENTER);
  Edit1.Invalidate;
  SetWindowLong(Edit2.Handle, GWL_STYLE, GetWindowLong(Edit2.Handle, GWL_STYLE) or ES_CENTER);
  Edit2.Invalidate;
end;



procedure TForm4.Timer2Timer(Sender: TObject);
begin
  retry:=retry+1;
 if(Pos('#',Form1.DataReceived.Text))>0 then
  begin
    Timer2.Enabled:=False;  //һ��Ҫ��ֹͣ��ʱ�� �����������
    retry:=0;
    retryMax:=0;
    ListView2.Clear;
    GetLightRunStatus();
    PageControl1.Enabled:=true;
  end else  if(retry=8) then
  begin
    Form1.SendMessage('*VS L'+msg);
    Memo2.Clear;
    Memo2.Font.Color:=clWindowText;
    Memo2.Lines.Add('���еڶ��γ��ԡ���');
  end else  if(retry=14) then
  begin
    Form1.SendMessage('*VS L'+msg);
    Memo2.Clear;
    Memo2.Font.Color:=clWindowText;
    Memo2.Lines.Add('���е����γ��ԡ���');
  end else  if(retry=retryMax) then
  begin
    Timer2.Enabled:=False;
    retry:=0;
    retryMax:=0;
    Memo2.Clear;
    Memo2.Font.Color:=clRed;
    Memo2.Lines.Add('��ѯ·������״̬ʧ�ܣ�');
    PageControl1.Enabled:=true;
   end;
end;





procedure TForm4.GetLightRunStatus();
var
received:String;
//LEDPOWER:Double;
RunStatusList:TStringList;
HalfTimeList:TStringList;
WeakTimeList:TStringList;
StrongTimeList:TStringList;
i:Integer;
begin
received:=Form1.DataReceived.Text;
RunStatusList := TStringList.Create;
StrongTimeList := TStringList.Create;
WeakTimeList := TStringList.Create;
HalfTimeList := TStringList.Create;
try
begin
  for i:=0 to Length(received)  do
   begin
    if(received[i]='#') then
     begin
      RunStatusList.Add(Copy(received,i+1,5)) ;
    end;
  end;
end;
except
end;
StrongTimeList.Add(Copy(RunStatusList[5],0,1));
StrongTimeList.Add(Copy(RunStatusList[5],2,2));
StrongTimeList.Add(Copy(RunStatusList[5],4,2));
HalfTimeList.Add(Copy(RunStatusList[6],0,1));
HalfTimeList.Add(Copy(RunStatusList[6],2,2));
HalfTimeList.Add(Copy(RunStatusList[6],4,2));
WeakTimeList.Add(Copy(RunStatusList[7],0,1));
WeakTimeList.Add(Copy(RunStatusList[7],2,2));
WeakTimeList.Add(Copy(RunStatusList[7],4,2));
//LEDPOWER:= StrToFloat(RunStatusList[3])*StrToFloat(RunStatusList[4]) ;
Memo2.Visible:=false;
ListView2.Clear;
Listview2.Items.Add.Caption:='·�Ʊ��';
Listview2.Items[0].SubItems.Add('L'+FormatFloat('000', StrToInt(Edit2.Text)));
Listview2.Items.Add.Caption:='̫�����ѹ';
Listview2.Items[1].SubItems.Add(RunStatusList[0]+' V');
Listview2.Items.Add.Caption:='�������ݵ�ѹ';
Listview2.Items[2].SubItems.Add(RunStatusList[1]+' V');

//Listview2.Items.Add.Caption:='�������ݵ���';
//Listview2.Items[3].SubItems.Add(RunStatusList[2]+' A');

Listview2.Items.Add.Caption:='﮵�ص�ѹ';
Listview2.Items[3].SubItems.Add(RunStatusList[3]+' V');
Listview2.Items.Add.Caption:='PWMռ�ձ�';
Listview2.Items[4].SubItems.Add(RunStatusList[4]+' %');
Listview2.Items.Add.Caption:='ǿ��ʱ��';
Listview2.Items[5].SubItems.Add(StrongTimeList[0]+':'+StrongTimeList[1]+':'+StrongTimeList[2]);
Listview2.Items.Add.Caption:='����ʱ��';
Listview2.Items[6].SubItems.Add(HalfTimeList[0]+':'+HalfTimeList[1]+':'+HalfTimeList[2]);
Listview2.Items.Add.Caption:='����ʱ��';
Listview2.Items[7].SubItems.Add(WeakTimeList[0]+':'+WeakTimeList[1]+':'+WeakTimeList[2]);
Listview2.ViewStyle:=vsreport;
RunStatusList.Clear;
RunStatusList.Free;
StrongTimeList.Clear;
StrongTimeList.Free;
HalfTimeList.Clear;
HalfTimeList.Free;
WeakTimeList.Clear;
WeakTimeList.Free;
end;








procedure TForm4.TabSheet2Show(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TForm4.BitBtn1Click(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'��������������') or (Pos('δ',Form1.StatusBar1.Panels[2].Text) > 0) then
  begin
  ShowMessage('����������Զ��GSM�豸δ����');
end else if Length(Edit2.Text)=0 then
  begin
  ShowMessage('��������·�Ƶı��');
end else
  begin
  Form1.DataReceived.Clear;
  ListView2.Clear;
  msg:=FormatFloat('000', StrToInt(Edit2.Text));
  Form1.SendMessage('*VS L'+msg);
  Memo2.Clear;
  Memo2.Font.Color:=clWindowText;
  Memo2.Visible:=true;
  Memo2.Lines.Add('���ڲ�ѯL'+msg+' ��·��״̬�����Ժ󡣡�');
  PageControl1.Enabled:=false;
  Timer2.Enabled:=true;
  retry:=0;
  retryMax:=20;
  end;
end;

procedure TForm4.BitBtn2Click(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'��������������') or (Pos('δ',Form1.StatusBar1.Panels[2].Text) > 0) then
  begin
  ShowMessage('����������Զ��GSM�豸δ����');
end else if Length(Edit1.Text)=0 then
  begin
  ShowMessage('��������·�Ƶı��');
end else
  begin
  Form1.DataReceived.Clear;
  ListView1.Clear;
  msg:=FormatFloat('000', StrToInt(Edit1.Text));
  Form1.SendMessage('*VPM L'+msg);
  Memo1.Clear;
  Memo1.Font.Color:=clWindowText;
  Memo1.Visible:=true;
  Memo1.Lines.Add('���ڲ�ѯL'+msg+' ��·�Ʋ��������Ժ󡣡�');
  Timer1.Enabled:=true;
  retry:=0;
  retryMax:=20;
  PageControl1.Enabled:=false;
  end;
end;

procedure TForm4.Button1Click(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'��������������') or (Pos('δ',Form1.StatusBar1.Panels[2].Text) > 0) then
begin
  ShowMessage('����������Զ��GSM�豸δ����');
end else
begin
Form1.DataReceived.Clear;
Form1.SendMessage('*VGB');
Memo3.Clear;
Memo3.Font.Color:=clWindowText;
Memo3.Lines.Add('���ڲ�ѯGSM��Դ�ĵ�ѹ�����Ժ򡣡�');
Timer3.Enabled:=true;
retry:=0;
retryMax:=16;
PageControl1.Enabled:=false;
end;
end;

procedure TForm4.Timer3Timer(Sender: TObject);
var
received : String;
GSM_Battery: TStringList;
i:Integer;
begin
  retry:=retry+1;
  GSM_Battery := TStringList.Create;
 if(Pos('#',Form1.DataReceived.Text))>0 then
  begin
    received := Form1.DataReceived.Text;
    Timer3.Enabled:=False;  //һ��Ҫ��ֹͣ��ʱ�� �����������
    retry:=0;
    retryMax:=0;
    try
    begin
      for i:=0 to Length(received)  do
      begin
       if(received[i]='#') then
       begin
       GSM_Battery.Add(Copy(received,i+1,5)) ;
       end;
      end;
    end;
  except
   end;
    Memo3.Font.Color:=clWindowText;
    Memo3.Clear;
    Memo3.Lines.Add('��ѯ�ɹ���������£�');
    Memo3.Lines.Add('');
    Memo3.Lines.Add('');
    Memo3.Lines.Add('GSM�豸��Դ��ѹΪ��'+GSM_Battery[0]+'V');
    PageControl1.Enabled:=true;
  end else  if(retry=8) then
  begin
    Form1.SendMessage('*VGB');
    Memo3.Clear;
    Memo3.Font.Color:=clWindowText;
    Memo3.Lines.Add('���еڶ��γ��ԡ���');
  end else  if(retry=14) then
  begin
    Form1.SendMessage('*VGB');
    Memo3.Clear;
    Memo3.Font.Color:=clWindowText;
    Memo3.Lines.Add('���е����γ��ԡ���');
  end else  if(retry=retryMax) then
  begin
    Timer3.Enabled:=False;
    retry:=0;
    retryMax:=0;
    Memo3.Clear;
    Memo3.Font.Color:=clRed;
    Memo3.Lines.Add('��ѯGSM��Դ��ѹʧ�ܣ�');
    PageControl1.Enabled:=true;
   end;
end;

end.
