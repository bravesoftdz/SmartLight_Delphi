unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Timer1: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  retry:Integer;
  retryMax:Integer;
  GSMClosedTime:Integer;

implementation

uses Unit1, Unit5;

{$R *.dfm}

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Self.Free;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
  retry:=retry+1;
if(Form1.StatusBar1.Panels[2].Text='GSM：未连接') then
  begin
  if(GSMClosedTime=0) then
    begin
    GSMClosedTime:=retry;
  end;
  Label1.Caption:='   GSM已关闭,程序退出！';
  if(retry = (GSMClosedTime+15))  then
    begin
      try
       Form1.IdTCPClient1.Disconnect;
       Form1.IdTCPClient1.DisconnectSocket;
      except
      end;
    retry:=0;
    Timer1.Enabled:=false;
    //self.Free;
    self.Close;
    Form5.Close;
  end;
end else if(retry=50) then
  begin
  Label1.Caption:='   GSM关闭失败,程序退出！';
end else if(retry=65) then
  begin
  retry:=0;
  Timer1.Enabled:=false;
  //self.Free;
  self.Close;
  Form5.Close;
end;
end;

end.
