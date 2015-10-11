unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB, Grids, DBGrids,TlHelp32,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZConnection, ExtCtrls,
  ComCtrls, OleServer, AccessXP, RzButton;

type
  TForm5 = class(TForm)
    username: TEdit;
    password: TEdit;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ZConnection1: TZConnection;
    zqry1: TZQuery;
    DataSource1: TDataSource;
    StatusBar1: TStatusBar;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure passwordKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        user:String;
        Name:String;
        Psw:String;
        Authority:Integer;
  end;

var
  Form5: TForm5;
  MySQL:Dword;

implementation

uses Unit1, Unit2, Unit3, Unit4;

{$R *.dfm}





function KillTask(ExeFileName:string):integer;//杀进程函数KillTask
const
PROCESS_TERMINATE = $0001;
var
ContinueLoop: BOOLean;
FSnapshotHandle: THandle;
FProcessEntry32: TProcessEntry32;
begin
Result :=0;
FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
while Integer(ContinueLoop) <> 0 do
begin
if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = 
UpperCase(ExeFileName))) then 
Result := Integer(TerminateProcess(
OpenProcess(PROCESS_TERMINATE,
BOOL(0),
FProcessEntry32.th32ProcessID),0));
ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
end;
CloseHandle(FSnapshotHandle);
end;


procedure ConnectMySQLThread;
begin
try
  Form5.ZConnection1.Connected:=true;
  Form5.StatusBar1.Panels[0].Text:='数据库：已连接';
except
  //ShowMessage('连接数据库失败！');
  Form5.StatusBar1.Panels[0].Text:='数据库：连接失败';
  ExitThread(MySQL);
end;
end;



procedure TForm5.BitBtn1Click(Sender: TObject);
begin
if(username.Text='') or (password.Text='') then
  begin
  ShowMessage('用户名或密码为空');
end else
  begin
  if(ZConnection1.Connected=false)  then
    begin
    ShowMessage('数据库未连接！');
  end else
    begin
    Bitbtn1.Enabled:=false;
    Bitbtn1.Caption:='正在登陆..' ;
    zqry1.Close;
    zqry1.SQL.Text := 'set names gbk';
    zqry1.ExecSQL;
    zqry1.SQL.Text:='select username,password,authority from user where username=:name and password=:psw';
    zqry1.ParamByName('name').Value :=trim(username.Text);
    zqry1.ParamByName('psw').Value :=trim(password.Text);
    zqry1.Active := True;
    zqry1.Open;
    if zqry1.RecordCount>0 then
      begin
      user:='当前用户：'+zqry1.Fields[0].AsString;
      Name:= zqry1.Fields[0].AsString;
      Psw:=zqry1.Fields[1].AsString;
      Authority:= zqry1.Fields[2].AsInteger;
      Form1.Show;
      Form5.Hide;
    end else
      begin
      ShowMessage('用户名或密码错误！');
      BitBtn1.Enabled:=true;
      BitBtn1.Caption:='登录';
    end;
  end;
 end;
end;




procedure TForm5.FormShow(Sender: TObject);
begin
CreateThread(nil,0,@ConnectMySQLThread,nil,0,MySQL);
end;                                                     

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  try
  Form1.IdTCPClient1.Disconnect;        
  Form1.IdTCPClient1.DisconnectSocket;
  except
  end;
  KillTask('SmartLight.exe');
end;


procedure TForm5.passwordKeyPress(Sender: TObject; var Key: Char);
begin
if(Key=#13) then
begin
BitBtn1.Click;
end;
end;

procedure TForm5.BitBtn2Click(Sender: TObject);
begin
username.Clear;
password.Clear;
end;

end.
