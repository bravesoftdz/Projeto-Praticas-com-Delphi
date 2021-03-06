unit uFrm_CadastroUsuarios;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Dialogs, uFrm_CadastroBasico, Data.DB,
  System.Actions, Vcl.ActnList, System.ImageList, Vcl.ImgList, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,
  Datasnap.DBClient, Vcl.ExtCtrls, Winapi.Windows, Vcl.Mask, Vcl.DBCtrls,
  Vcl.AppEvnts, tpEdit;

type
  Tfrm_CadastroUsuarios = class(Tfrm_CadastroBasico)
    lbl_Senha: TLabel;
    lbl_Login: TLabel;
    Label5: TLabel;
    lbl_Nome: TLabel;
    edt_Nome: TEdit;
    edt_Login: TEdit;
    edt_Senha: TEdit;
    Label4: TLabel;
    edt_Salario: TtpEdit;
    ClientDataSet1: TClientDataSet;
    ds_Tabela: TDataSource;
    procedure acl_EditarExecute(Sender: TObject);
    procedure acl_GravarExecute(Sender: TObject);
    procedure acl_PesquisarExecute(Sender: TObject);
    procedure btn_FiltrarClick(Sender: TObject);
    procedure acl_ImprimirExecute(Sender: TObject);
    procedure acl_InserirExecute(Sender: TObject);
    procedure edt_NomeKeyPress(Sender: TObject; var Key: Char);
    procedure cbx_PesquisarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    iModo : Integer;
  public
    { Public declarations }
  end;

var
  frm_CadastroUsuarios: Tfrm_CadastroUsuarios;

implementation

{$R *.dfm}

uses uDM_Dados, uFuncoes, Vcl.Forms;

procedure Tfrm_CadastroUsuarios.acl_EditarExecute(Sender: TObject);
begin
  inherited;
  edt_Nome.Text  := DM_Dados.cds_UsuariosNOME.AsString;
  edt_Login.Text := DM_Dados.cds_Usuarioslogin.AsString;
  edt_Senha.Text := DM_Dados.cds_Usuariossenha.AsString;
end;

procedure Tfrm_CadastroUsuarios.acl_ImprimirExecute(Sender: TObject);
begin
  inherited;
//
end;


procedure Tfrm_CadastroUsuarios.acl_PesquisarExecute(Sender: TObject);
begin
  inherited;
  edt_Pesquisar.Clear;
  with DM_Dados do
  begin
    cds_Usuarios.close;
	  cds_Usuarios.CommandText := 'SELECT * FROM USUARIOS ORDER BY ID';
	  cds_Usuarios.Open;
  end;
end;



procedure Tfrm_CadastroUsuarios.acl_GravarExecute(Sender: TObject);
begin

  if Trim(edt_Nome.Text) = '' then
  begin
    Application.MessageBox('Preencha o campo NOME.','Aten��o!',MB_OK+MB_ICONWARNING);
    edt_Nome.SetFocus;
    Abort;
  end;

  if Trim(edt_Login.Text) = '' then
  begin
    Application.MessageBox('Preencha o campo LOGIN.','Aten��o!',MB_OK+MB_ICONWARNING);
    edt_Login.SetFocus;
    Abort;
  end;

  if (ds_Tabela.State in [dsInsert])  and (GetLoginCadastrado(Trim(edt_Login.Text))) then
  begin
    Application.MessageBox('Login encontra-se cadastrado.','Aten��o!',MB_OK+MB_ICONWARNING);
    edt_Login.SetFocus;
    Abort;
  end;

  if Trim(edt_Senha.Text) = '' then
  begin
    Application.MessageBox('Preencha o campo SENHA.','Aten��o!',MB_OK+MB_ICONWARNING);
    edt_Senha.SetFocus;
    Abort;
  end;

  with TClientDataSet(ds_Tabela.DataSet) do
  begin
    if ds_Tabela.State in [dsInsert,dsEdit] then
      FieldByName('ID').AsInteger    := GetId('ID', 'USUARIOS');
      FieldByName('NOME').AsString   := Trim(edt_Nome.Text);
      FieldByName('LOGIN').AsString  := Trim(edt_Login.Text);
      FieldByName('SENHA').AsString  := Trim(edt_Senha.Text);
      FieldByName('CADASTRADO').AsDateTime := now;
  end;
  inherited;
end;

procedure Tfrm_CadastroUsuarios.btn_FiltrarClick(Sender: TObject);
begin
  if edt_Pesquisar.Text = '' then
  begin
    Application.MessageBox('Informe um valor a ser pesquisado ou clique em Pesquisar.','Aten��o',MB_OK+MB_ICONWARNING);
    edt_Pesquisar.SetFocus;
    Abort;
  end;

    with TClientDataSet(ds_Tabela.DataSet) do
    begin
      Close;
      CommandText := '';
      case cbx_Pesquisar.ItemIndex of
        0 : CommandText := 'SELECT * FROM USUARIOS WHERE NOME  LIKE ' + QuotedStr('%'+edt_Pesquisar.Text+'%');
        1 : CommandText := 'SELECT * FROM USUARIOS WHERE LOGIN LIKE ' + QuotedStr('%'+edt_Pesquisar.Text+'%');
      end;
      Open;
//      if RecordCount = 0 then
//      ShowMessage('Usu�rio n�o cadastrado');
  end;
end;



procedure Tfrm_CadastroUsuarios.cbx_PesquisarClick(Sender: TObject);
begin
  inherited;
//
end;

procedure Tfrm_CadastroUsuarios.acl_InserirExecute(Sender: TObject);
begin
  inherited;
  pnl_Cadastro.Enabled := True;
  edt_Nome.SetFocus;
end;


procedure Tfrm_CadastroUsuarios.edt_NomeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//
end;


procedure Tfrm_CadastroUsuarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
 inherited;
//
end;

end.
