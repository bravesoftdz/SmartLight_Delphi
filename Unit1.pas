unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  StdCtrls, ComCtrls, Menus, XPMan, jpeg, ExtCtrls,shellapi, Buttons,
  RzButton;

type
  TForm1 = class(TForm)
    IdTCPClient1: TIdTCPClient;
    DataReceived: TMemo;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    XPManifest1: TXPManifest;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Image1: TImage;
    XPManifest2: TXPManifest;
    Label1: TLabel;
    Timer1: TTimer;
    N10: TMenuItem;
    ConnectServer: TBitBtn;
    DisconnectServer: TBitBtn;
    QueryLightState: TBitBtn;
    SetLightParameter: TBitBtn;
    QueryLightParameter: TBitBtn;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    procedure ConnectServerClick(Sender: TObject);
    procedure IdTCPClient1Connected(Sender: TObject);
    procedure IdTCPClient1Disconnected(Sender: TObject);
    procedure SendMessage(msg:String);        
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure DisconnectServerClick(Sender: TObject);
    procedure QueryLightStateClick(Sender: TObject);
    procedure SetLightParameterClick(Sender: TObject);
    procedure QueryLightParameterClick(Sender: TObject);
    procedure ComboBox1Select(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  td:Dword;
  up:Dword;
  doRead:boolean;
  NewVersion:Integer;
  NowVersion:Integer;




implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, Unit8;


{$R *.dfm}





procedure ReadThread;
var
s:WideString;
begin
while doRead do        
begin
if(Form1.IdTCPClient1.Connected) then
begin
try
  s:=Form1.IdTCPClient1.ReadLn();
  if(Pos('GSM',s)>0) then
  begin
    Form1.StatusBar1.Panels[2].Text:=s;
    //Form1.DataReceived.Lines.Add(s);
  end else
  begin
    Form1.DataReceived.Lines.Add(s);
    s:='';
    sleep(100);
  end;
except
end;
end;
end;
end;



procedure UpdateSoftware;
begin
  try
  begin
    Form5.zqry1.Close;
    Form5.zqry1.SQL.Text := 'set names gbk';
    Form5.zqry1.ExecSQL;
    Form5.zqry1.SQL.Text:='select versionID,downloadAddr from version ';
    Form5.zqry1.Active := True;
    Form5.zqry1.Open;
    NewVersion:=Form5.zqry1.Fields[0].AsInteger;
    NowVersion:=StrToInt(Form1.Edit1.Text);
    if(NewVersion>NowVersion) then
    begin
       if Messagedlg('检测到新版本，请更新！',mtCustom,[mbYes],0)=mrYes then
       begin
        ShellExecute(Application.Handle, nil,PAnsiChar(AnsiString(Form5.zqry1.Fields[1].AsString)), nil, nil, SW_SHOWNORMAL);
        Form5.Close;
       end;
    end;
  end;
  except
 end;
end;

procedure TForm1.ConnectServerClick(Sender: TObject);
begin
  IdTCPClient1.Host := '120.55.98.138';
  if combobox1.Text='蓝思科技' then
  begin
    IdTCPClient1.Port := 1500;
    with IdTCPClient1 do
    begin
      try
        Connect(5000);
        CreateThread(nil,0,@ReadThread,nil,0,td);
      except
        ShowMessage('无法建立到服务器的连接');
        Disconnect();
      end;
    end;
  end else if  combobox1.Text='浏阳'  then
  begin
    IdTCPClient1.Port := 1501;
    with IdTCPClient1 do
    begin
      try
        Connect(5000);
        CreateThread(nil,0,@ReadThread,nil,0,td);
      except
        ShowMessage('无法建立到服务器的连接');
        Disconnect();
      end;
    end;
  end else
  begin
    IdTCPClient1.Port := 1502;
    with IdTCPClient1 do
    begin
      try
        Connect(5000);
        CreateThread(nil,0,@ReadThread,nil,0,td);
      except
        ShowMessage('无法建立到服务器的连接');
        Disconnect();
      end;
    end;
  end;
end;



procedure TForm1.SendMessage(msg:String);
begin
with IdTCPClient1 do
begin
try
Write(msg);
except
// ShowMessage('命令发送失败！');
//IdTCPClient1.Disconnect();
end;
end;
end;



procedure TForm1.IdTCPClient1Connected(Sender: TObject);
begin
  IdTCPClient1.Write('WAKE');
  StatusBar1.Panels[1].Text:='服务器：已连接';
  Timer1.Enabled:=True;
  N2.Enabled:=false;
  N3.Enabled:=true;
  QueryLightState.Enabled:=true;
  N7.Enabled:=true;
  N8.Enabled:=true;
  N9.Enabled:=true;
  if(Form5.Authority=0) then
  begin
    SetLightParameter.Enabled:=true;
    N8.Enabled:=true;
  end else
  begin
    SetLightParameter.Enabled:=false;
    N8.Enabled:=false;
  end;
  QueryLightParameter.Enabled:=true;
  ShowMessage('已连接到服务器');
  DisconnectServer.Visible:=true;
  doRead:=true;
end;

procedure TForm1.IdTCPClient1Disconnected(Sender: TObject);
begin
  StatusBar1.Panels[1].Text:='服务器：未连接' ;
  N3.Enabled:=false;
  N2.Enabled:=true;
  QueryLightState.Enabled:=false;
  SetLightParameter.Enabled:=false;
  QueryLightParameter.Enabled:=false;
  ConnectServer.Visible:=true;
  DisconnectServer.Visible:=false;
  doRead:=false;
end;







procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if DisConnectServer.Visible = true  then
begin
  if(Pos('已',Form1.StatusBar1.Panels[2].Text) > 0) then
  begin
    if(Form5.Authority=0) then
    begin
      if Messagedlg('是否关闭远程GSM?若关闭，下次需要唤醒！',mtCustom,[mbYes, mbNo],0)=mrYes then
      begin
        Form1.SendMessage('SLEEP');
        Application.CreateForm(TForm6, Form6);
        Form6.Show;
        Form6.Timer1.Enabled:=true;
      end else
      begin
        self.Free;
        Form5.close;
      end;
    end else
    begin
      self.Free;
      Form5.close;
    end;
  end else
  begin
    self.Free;
    Form5.close;
  end;
 end else
 begin
  self.Free;
  Form5.close;
 end;
end;



procedure TForm1.FormShow(Sender: TObject);
begin
if(Form5.Authority=0) then
begin
  N6.Enabled:=true;
end else
begin
  N6.Enabled:=false;
end;
StatusBar1.Panels[0].Text:=Form5.user;
CreateThread(nil,0,@UpdateSoftware,nil,0,up);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
ConnectServer.Click;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
DisconnectServer.Click;   
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
try
Form1.SendMessage('Client：Online');
except
end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
Application.CreateForm(TForm7, Form7);
Form7.Show;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
Application.CreateForm(TForm8, Form8);
Form8.Show;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
SetLightParameter.Click;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
QueryLightState.Click;
end;

procedure TForm1.N9Click(Sender: TObject);
begin
QueryLightParameter.Click;
end;

procedure TForm1.DisconnectServerClick(Sender: TObject);
begin
try
  IdTCPClient1.Disconnect;
  ShowMessage('断开服务器成功');
  QueryLightState.Enabled:=false;
  SetLightParameter.Enabled:=false;
  QueryLightParameter.Enabled:=false;
  doRead:=false;
  DisconnectServer.Visible:=false;
  N3.Enabled:=false;
  N2.Enabled:=true;
  N7.Enabled:=false;
  N8.Enabled:=false;
  N9.Enabled:=false;
except
   ShowMessage('断开服务器失败');
end;
end;

procedure TForm1.QueryLightStateClick(Sender: TObject);
begin
Application.CreateForm(TForm2, Form2);
Form2.Show;
Form2.TabSheet1.Show;
end;

procedure TForm1.SetLightParameterClick(Sender: TObject);
begin
Application.CreateForm(TForm3, Form3);
Form3.Show;
Form3.TabSheet1.Show;
Form3.StrongPower_Lightnum.SetFocus;
end;

procedure TForm1.QueryLightParameterClick(Sender: TObject);
begin
Application.CreateForm(TForm4, Form4);
Form4.Show;
Form4.ListView1.Clear;
Form4.ListView2.Clear;
Form4.TabSheet1.Show;
Form4.Edit2.SetFocus;
end;



procedure TForm1.ComboBox1Select(Sender: TObject);
begin
if DisconnectServer.Enabled=true  then
begin
  try
  IdTCPClient1.Disconnect;
  QueryLightState.Enabled:=false;
  SetLightParameter.Enabled:=false;
  QueryLightParameter.Enabled:=false;
  doRead:=false;
  DisconnectServer.Visible:=false;
  N3.Enabled:=false;
  N2.Enabled:=true;
  N7.Enabled:=false;
  N8.Enabled:=false;
  N9.Enabled:=false;
  ConnectServer.Click;
except
   ShowMessage('断开服务器失败');
end;
end;

end;

end.

