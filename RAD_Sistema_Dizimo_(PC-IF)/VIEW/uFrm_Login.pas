unit uFrm_Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.CategoryButtons, Vcl.WinXCtrls, System.Actions,
  Vcl.ActnList, System.ImageList, Vcl.ImgList;

type
  Tfrm_Login = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image5: TImage;
    SplitView1: TSplitView;
    Image6: TImage;
    CategoryButtons1: TCategoryButtons;
    ActionList1: TActionList;
    ImageList1: TImageList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    Action4: TAction;
    Action5: TAction;
    procedure Image4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_Login: Tfrm_Login;

implementation

{$R *.dfm}

procedure Tfrm_Login.Image4Click(Sender: TObject);
begin
  if SplitView1.Opened then
     SplitView1.Close
  else
     SplitView1.Open;
end;

end.