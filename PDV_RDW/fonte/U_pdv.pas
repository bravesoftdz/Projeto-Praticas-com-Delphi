unit U_pdv;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient, Vcl.Imaging.jpeg, Vcl.DBCtrls;

type
  TFrm_PDV = class(TForm)
    tmrCursor: TTimer;
    pnl_Fundo: TPanel;
    img_Fundo: TImage;
    pnl7_Itens: TPanel;
    dbg_Itens: TDBGrid;
    pnl0_Cabecalho: TPanel;
    lbl_pdv: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Label5: TLabel;
    pnl1_TotalVenda: TPanel;
    Label6: TLabel;
    pnl6_Descricao: TPanel;
    edt_DESCRICAO: TEdit;
    Label7: TLabel;
    pnl2_Codigo: TPanel;
    Label8: TLabel;
    pnl3_QTD: TPanel;
    edt_QTD: TEdit;
    Label9: TLabel;
    pnl4_PrecoUN: TPanel;
    edt_Preco: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    pnl5_TotalItem: TPanel;
    cds_Itens: TClientDataSet;
    ds_Itens: TDataSource;
    cds_ItensItem: TIntegerField;
    cds_ItensIdItem: TIntegerField;
    cds_ItensCodigo: TStringField;
    cds_ItensDescricao: TStringField;
    cds_ItensQuantidade: TIntegerField;
    cds_ItensValor: TFloatField;
    cds_ItensSubTotal: TFloatField;
    edt_CODIGO: TEdit;
    cds_ItensSomaTotal: TAggregateField;
    Panel1: TPanel;
    edt_Total: TDBText;
    cds_ItensQtdItems: TAggregateField;
    Panel3: TPanel;
    edt_TotalItem: TDBText;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label2: TLabel;
    Panel4: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label1: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure tmrCursorTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edt_CODIGOKeyPress(Sender: TObject; var Key: Char);
    procedure edt_QTDKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edt_PrecoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    procedure VerificaProdutos(codigo: string);
    procedure SomaValor;
    procedure EnviarDados;
    procedure LimparEdits;
  end;

var
  Frm_PDV: TFrm_PDV;
  vlResultado: String;

implementation

{$R *.dfm}

uses U_DM, U_pesquisaProd, U_apagaItem, U_cancelaCumpom, U_fechamento;

procedure TFrm_PDV.edt_CODIGOKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
     VerificaProdutos(edt_CODIGO.Text);
     edt_QTD.SetFocus;
   end;

end;

procedure TFrm_PDV.edt_PrecoKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
        LimparEdits; // Limpa os edits no pressionar da QTD
        edt_Codigo.SetFocus;
      end;
end;

procedure TFrm_PDV.edt_QTDKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
      begin
        SomaValor;
        enviardados; //Envia os dados para o DBGrid CDsItens do PDV.
        Perform(Wm_NextDlgCtl,0,0);
      end;

end;

procedure TFrm_PDV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Close;
end;

procedure TFrm_PDV.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_F6 then
   begin
      try
         Frm_Pesquisa := TFrm_Pesquisa.Create(Application);
         Frm_Pesquisa.ShowModal;
      finally
         FreeAndNil(Frm_Pesquisa);
      end;
   end;

   if key = VK_F5 then
   begin
      try
         Frm_CancelaCupom := TFrm_CancelaCupom.Create(Application);
         Frm_CancelaCupom.ShowModal;
      finally
         FreeAndNil(Frm_CancelaCupom);
      end;
   end;

   if key = VK_F4 then
   begin
      try
         Frm_ApagaItem := TFrm_ApagaItem.Create(Application);
         Frm_ApagaItem.ShowModal;
      finally
         FreeAndNil(Frm_ApagaItem);
      end;
   end;

  if key = VK_F3 then  //chama uma nova venda
   begin
      if dm.FDVendas.Active = False then
      begin
         dm.FDVendas.Active := True;
         dm.FDVendas.Insert;
         dm.FDVendas.FieldByName('ID_CLIENTE').AsInteger := dm.FDClienteID_Cliente.AsInteger+1;
         dm.FDVendas.Post;

         try
           Frm_Fechamento := TFrm_Fechamento.Create(Application);
           Frm_Fechamento.ShowModal;
        finally
           FreeAndNil(Frm_Fechamento);
        end;
      end;
      dm.FDVendas.Active := False;
   end;

 if key = VK_F2 then  //fecha PDV
 begin
   Close;
 end;

end;

procedure TFrm_PDV.FormShow(Sender: TObject);
begin
   edt_Codigo.SetFocus;
   edt_Preco.Text := '0,00';
   edt_TotalItem.Caption := '0';
end;

procedure TFrm_PDV.LimparEdits;
begin
   edt_Codigo.Clear;
   edt_QTD.Clear;
   edt_Preco.Clear;
   edt_TotalItem.Caption := '0';
   edt_Preco.Text := '0,00';
   edt_Descricao.Text  := 'Aguardando novo Produto';
   edt_Codigo.SetFocus;
end;

procedure TFrm_PDV.EnviarDados;
var
   vlSubTotal : Currency;
begin
   cds_Itens.Open;
   cds_Itens.Insert;
   vlSubTotal := StrToCurrDef(StringReplace(vlResultado, '.', '', [rfReplaceAll]), 0);
   cds_Itenscodigo.Text     := edt_Codigo.Text;
   cds_Itensdescricao.Text  := edt_Descricao.Text;
   cds_Itensquantidade.Text := edt_QTD.Text;
   cds_Itensvalor.Text      := edt_PRECO.Text;
   cds_ItensSubTotal.Text   := FormatFloat('#.00', vlSubTotal);
   cds_Itens.Post;
end;

procedure TFrm_PDV.SomaValor;
var
   vlqtd: Double;
   vlUnit, vlTotal: Currency;
begin
   vlResultado := '';
   vlqtd       := StrToFloat(edt_QTD.Text); //valor de quantidade
   vlUnit      := StrToFloat(edt_PRECO.Text); // valor unitario automatico
   vlTotal     := (vlqtd * vlunit);
   vlResultado := FormatFloat('#,###.00', vlTotal);
end;

procedure TFrm_PDV.VerificaProdutos(codigo: string);
begin
   if not dm.FDProdutos.Locate('codigo_produto',edt_CODIGO.Text,[]) then
   begin
     ShowMessage('Produto n�o cadastrado, tente novamente!');
     Exit;
     edt_CODIGO.SetFocus;
   end else
     edt_CODIGO.Text    := dm.FDProdutosCODIGO_PRODUTO.AsString;
     edt_Preco.Text     := dm.FDProdutosPRECO_PRODUTO.AsString;
     edt_Descricao.Text := dm.FDProdutosNOME_PRODUTO.AsString;
     edt_QTD.SetFocus;

end;

procedure TFrm_PDV.tmrCursorTimer(Sender: TObject);
begin
//   edt_Codigo.SetFocus;
end;

end.
