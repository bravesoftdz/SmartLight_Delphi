unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Edit1: TEdit;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    Timer1: TTimer;
    Memo1: TMemo;
    Label1: TLabel;
    Timer2: TTimer;
    Bitbtn1: TBitBtn;
    Bitbtn2: TBitBtn;
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure GetLightNum();
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bitbtn1Click(Sender: TObject);
    procedure Bitbtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
   

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  retry:Integer;
  retryMax:Integer;
  msg:string;

implementation

uses Unit1, Unit5;

{$R *.dfm}






procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in ['0'..'9', #8, #13]) then
  begin
    Key := #0;

end;
end;



procedure TForm2.FormCreate(Sender: TObject);
begin
  SetWindowLong(Edit1.Handle, GWL_STYLE, GetWindowLong(Edit1.Handle, GWL_STYLE) or ES_CENTER);
  Edit1.Invalidate;
end;



procedure TForm2.Timer1Timer(Sender: TObject);
  begin
  retry:=retry+1;
  if(Pos('Remoter Receive',Form1.DataReceived.Text))>0 then
  begin
    Timer1.Enabled:=False;  //һ��Ҫ��ֹͣ��ʱ�� �����������
    retry:=0;
    Memo1.Clear;
    Memo1.Font.Color:=clWindowText;
    Memo1.Lines.Add('���ΪL'+FormatFloat('000', StrToInt(Edit1.Text))+' ��·������');
  end else  if(retry=8) then
  begin
    Form1.SendMessage('*GS L'+msg);
    Memo1.Clear;
    Memo1.Font.Color:=clWindowText;
    Memo1.Lines.Add('���еڶ��γ��ԡ���');
    end else  if(retry=12) then
  begin
    Form1.SendMessage('*GS L'+msg);
    Memo1.Clear;
    Memo1.Font.Color:=clWindowText;
    Memo1.Lines.Add('���е����γ��ԡ���');
  end else  if(retry=retryMax) then
  begin
    Timer1.Enabled:=False;
    retry:=0;
    Memo1.Clear;
    Memo1.Font.Color:=clRed;
    Memo1.Lines.Add('���ΪL'+FormatFloat('000', StrToInt(Edit1.Text))+' ��·�Ʋ����ߣ�');
   end;
end;



procedure TForm2.TabSheet1Show(Sender: TObject);
begin
Edit1.SetFocus;
end;







procedure TForm2.Timer2Timer(Sender: TObject);
 begin
  retry:=retry+1;
if(Pos('Remoter Receive',Form1.DataReceived.Text))>0 then
  begin
  retryMax:=40;
  if(retry=12) then
    begin
    //Memo2.Clear;
    //Memo2.Lines.Add('�յ��������ݣ����Ժ󡣡���');
  end else if(retry=20) then
    begin
    Form1.SendMessage('*GS');
  end else if(retry=30) then
    begin
    Form1.SendMessage('*GS');
    //Memo2.Clear;
    //Memo2.Lines.Add('���ڶԷ������ݽ��з��������Ժ󡣡���');
  end else if(retry=retryMax) then
    begin
    Timer2.Enabled:=false;
    retry:=0;
    retryMax:=0;
    GetLightNum();
    PageControl1.Enabled:=true;
  end;
end else  if(retry=6) then
    begin
    Form1.SendMessage('*GS');
    {Memo2.Clear;
    Memo2.Font.Color:=clWindowText;
    Memo2.Lines.Add('���еڶ��γ��ԡ���'); }
  end else if(retry=11) then
    begin
    Form1.SendMessage('*GS');
    {Memo2.Clear;
    Memo2.Font.Color:=clWindowText;
    Memo2.Lines.Add('���е����γ��ԡ���');}
  end else  if(retry=retryMax) then
    begin
    Timer2.Enabled:=false;
    {Memo2.Clear;
    Memo2.Font.Color:=clRed;
    Memo2.Lines.Add('û���豸����');}
    PageControl1.Enabled:=true;
    retry:=0;
    retryMax:=0;
  end;
 end;


procedure TForm2.GetLightNum();
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
begin
p:=0;
received:=Form1.DataReceived.Text;
List := TStringList.Create;
SucceedList := TStringList.Create;
FailedList := TStringList.Create;
List.Sorted := True;          //��Ҫ��ָ������
List.Duplicates := dupIgnore;           //�����ظ�ֵ�����
try
begin
  for i:=1 to  Length(received) do
    begin
      if (received[i]='L') then
      begin
      List.Add(Copy(received,i+1,3)) ;
      end;
    end;
end;
except
end;

//���´��������ҵ������ߵ�·��
try
begin
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
end;
except
end;


{Memo2.Clear;
Memo2.Lines.Add('����ѯ��'+IntToStr(List.Count)+'��·������;');
Memo2.Lines.Add('������С���Ϊ L'+List[0]+';');
Memo2.Lines.Add('�����Ϊ L'+List[List.Count-1]+';');   }

if(FailedList.Count=0) then
  begin
  //Memo2.Lines.Add('ȫ��·������');
end else if SucceedList.Count < FailedList.Count then
  begin
  for m:=0 to SucceedList.Count-1 do
    begin
   // Memo2.Text:=Memo2.Text+'L'+FormatFloat('000', StrToInt(SucceedList[m]))+' ';
  end;
  {Memo2.Text:=Memo2.Text+'·������';
  Memo2.Lines.Add('����·�Ʋ�����');}
end else
  begin
  for l:=0 to FailedList.Count-1 do
   begin
  // Memo2.Text:=Memo2.Text+'L'+FormatFloat('000', StrToInt(FailedList[l]))+' ';
  end;
  // Memo2.Text:=Memo2.Text+'·�Ʋ�����';
   //Memo2.Lines.Add('����·������');
end;
end;





procedure TForm2.FormShow(Sender: TObject);
begin
StatusBar1.Panels[0].Text:=Form5.user;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
self.Free;
end;

procedure TForm2.Bitbtn1Click(Sender: TObject);
begin
Edit1.Clear;
end;

procedure TForm2.Bitbtn2Click(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'��������������') or (Pos('δ',Form1.StatusBar1.Panels[2].Text) > 0) then
  begin
  ShowMessage('����������Զ��GSM�豸Ϊ����');
end else if Length(Edit1.Text)=0 then
  begin
  ShowMessage('��������·�Ƶı��');
end else
  begin
  Form1.DataReceived.Clear;
  msg:=FormatFloat('000', StrToInt(Edit1.Text));
  Form1.SendMessage('*GS L'+msg);
  Memo1.Clear;
  Memo1.Font.Color:=clWindowText;
  Memo1.Lines.Add('���ڲ�ѯ���ΪL'+msg+' ��·��״̬�����Ժ󡣡���');
  Timer1.Enabled:=True;
  retryMax:=16;
  retry:=0;
  end;
end;



procedure TForm2.BitBtn3Click(Sender: TObject);
begin
if (Form1.StatusBar1.Panels[1].Text<>'��������������') or (Form1.StatusBar1.Panels[2].Text<>'GSM��������') then
  begin
  ShowMessage('����������Զ��GSM�豸Ϊ����');
end else
  begin
  msg:='*GS';
  Form1.DataReceived.Clear;
  Form1.SendMessage(msg);
  {Memo2.Clear;
  Memo2.Font.Color:=clWindowText;
  Memo2.Lines.Add('���ڲ�ѯ����·�Ƶ�״̬�����Ժ󡣡���');  }
  Timer2.Enabled:=true;
  retryMax:=16;
  retry:=0;
  PageControl1.Enabled:=false;
  end;
end;

end.
