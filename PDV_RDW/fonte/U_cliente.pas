unit U_cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TFrm_Cliente = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    dsCliente: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Cliente: TFrm_Cliente;

implementation

{$R *.dfm}

uses U_DM;

end.
