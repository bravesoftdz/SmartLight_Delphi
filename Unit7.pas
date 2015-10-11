unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons;

type
  TForm7 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Edit4: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  NewUserAuthority:Integer;

implementation

uses Unit5;

{$R *.dfm}

procedure TForm7.FormShow(Sender: TObject);
begin
StatusBar1.Panels[0].Text:=Form5.user;
TabSheet1.Show;
end;




procedure TForm7.TabSheet1Show(Sender: TObject);
begin
Edit1.SetFocus;
end;

procedure TForm7.BitBtn1Click(Sender: TObject);
begin
Edit1.Clear;
Edit2.Clear;
Edit3.Clear;
end;

procedure TForm7.BitBtn2Click(Sender: TObject);
begin
if(Edit1.Text='') or (Edit2.Text='') or (Edit3.Text='') then
begin
  ShowMessage('用户名、密码不能为空')
end else if(Edit2.Text<>Edit3.Text) then
begin
  ShowMessage('两次输入的密码不同，请重试！');
end else
begin
  if(trim(combobox1.text)='低') then
  begin
    NewUserAuthority:=1;
  end else
  begin
    NewUserAuthority:=0;
  end;
  try
    with Form5.zqry1 do
    begin
      SQL.Text:='select username from user where username=:name';
      ParamByName('name').Value :=trim(Edit1.Text);
      Active := True;
      Open;
      if RecordCount>0 then
      begin
        ShowMessage('该用户已存在！')
      end else
      begin
        with Form5.zqry1 do
        begin
          Close;
          SQL.Clear;
          SQL.Text:='insert into user(username,password,authority) values(:name,:psw,:auth)';
          ParamByName('name').Value:=trim(Edit1.Text);
          ParamByName('psw').Value:=trim(Edit2.Text);
          ParamByName('auth').Value:=NewUserAuthority;
          ExecSQL;
          ShowMessage('添加新用户成功！')
         end;
      end;
    end;
  except
    ShowMessage('添加新用户失败！')
  end;
 end;
end;

procedure TForm7.BitBtn3Click(Sender: TObject);
begin
if(Edit4.Text='') then
begin
  ShowMessage('请输入要删除的用户名！')
end else
begin
  try
  begin
    with Form5.zqry1 do
    begin
      SQL.Text:='select username from user where username=:name';
      ParamByName('name').Value :=trim(Edit4.Text);
      Active := True;
      Open;
      if RecordCount>0 then
      begin
        Close;
        sql.clear;
        sql.add('delete  from user where username=:name');
        ParamByName('name').Value:=trim(Edit4.Text);
        execsql;
        ShowMessage('用户删除成功！');
      end else
      begin
        ShowMessage('您输入的用户不存在！');
      end;
    end;
  end;
  except
    ShowMessage('删除用户失败！');
  end;
 end;
end;

end.
