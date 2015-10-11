unit Unit8;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TForm8 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StatusBar1: TStatusBar;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses Unit5;

{$R *.dfm}

procedure TForm8.FormShow(Sender: TObject);
begin
StatusBar1.Panels[0].Text:=Form5.user;
end;






procedure TForm8.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if(Key=#13) then
begin
BitBtn2.Click;
end;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
if(Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='') then
begin
   ShowMessage('原密码或新密码不能为空！');
end else if(Edit1.Text<>Form5.Psw) then
begin
  ShowMessage('原密码输入错误！');
end else if(Edit2.Text<>Edit3.Text)  then
begin
  ShowMessage('两次密码输入的不相同！');
end else
begin
  with Form5.zqry1 do
  try
    begin
      Close;
      SQL.Clear;
      SQL.add('Update user SET password=:pass where username=:name');
      ParamByName('pass').Value:=Edit2.Text;
      ParamByName('name').Value:=Form5.Name;
      ExecSQL;
      ShowMessage('密码修改成功！');
    end;
  except
    ShowMessage('密码修改失败！');
  end;
 end;
end;

end.
