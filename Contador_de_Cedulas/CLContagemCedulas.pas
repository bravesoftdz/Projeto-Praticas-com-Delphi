unit CLContagemCedulas;

interface

uses Classes, Dialogs, SysUtils;

type
  TContagemCedulas = class
  protected
    FValorContagem : integer;
    FQtdNotas100   : integer;
    FQtdNotas50    : integer;
    FQtdNotas20    : integer;
    FQtdNotas10    : integer;
    FQtdNotas5     : integer;
    FQtdNotas2     : integer;
    FQtdNotas1     : integer;

    procedure Distribuicao;
    procedure DefineValorContagem(valor: integer);
  public
    function ObterDistribuicao: TStringList;
    property ValorContagem: integer read FValorContagem
                                    write DefineValorContagem;

end;

implementation

uses Math;

{ TContagemCedulas }

procedure TContagemCedulas.DefineValorContagem(valor: integer);
begin
  if valor < 0 then
     FValorContagem := 0
  else
  begin
    FValorContagem := valor;
    Distribuicao();
  end;
end;

procedure TContagemCedulas.Distribuicao;
var
  iAux: integer;
begin
  iAux := FValorContagem;

  FQtdNotas100 := iAux div 100;
  iAux := iAux mod 100;

  if iAux > 0 then
  begin
    FqtdNotas50 := iAux div 50;
    iAux := iAux mod 50;

    if iAux > 0 then
      begin
        FQtdNotas20 := iAux div 20;
        iAux := iAux mod 20;

       if iAux > 0 then
        begin
          FQtdNotas10 := iAux div 10;
          iAux := iAux mod 10;

          if iAux >0 then
          begin
            FQtdNotas5 := iAux div 5;
            iAux := iAux mod 5;

            if iAux > 0  then
            begin
              FQtdNotas2 := iAux div 2;
              iAux := iAux mod 2;

              FQtdNotas1 := iAux;
            end;
          end;
       end;
    end;
  end;
end;

function TContagemCedulas.ObterDistribuicao: TStringList;
var
  lista : TStringList;
begin
  lista := TStringList.Create;

  lista.Add(IntToStr(FQtdNotas100) + ' nota(s) de 100');
  lista.Add(IntToStr(FQtdNotas50) + ' nota(s) de 50');
  lista.Add(IntToStr(FQtdNotas20) + ' nota(s) de 20');
  lista.Add(IntToStr(FQtdNotas10) + ' nota(s) de 10');
  lista.Add(IntToStr(FQtdNotas5) + ' nota(s) de 5');
  lista.Add(IntToStr(FQtdNotas2) + ' nota(s) de 2');
  lista.Add(IntToStr(FQtdNotas1) + ' nota(s) de 1');

  result := lista;
end;

end.
