unit untIMC;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls;

type
  TfrmIMC = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblResultado: TLabel;
    lblDiagnostico: TLabel;
    lblRecomendacao: TLabel;
    edtPeso: TEdit;
    edtAltura: TEdit;
    btnCalcular: TButton;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIMC: TfrmIMC;
  imc, peso, altura, pesoCerto, diferenca : Double;
  diagnostico, recomendacao : string;


implementation

{$R *.dfm}

procedure TfrmIMC.btnCalcularClick(Sender: TObject);
begin
  // Realizo os cálculos
  peso := StrToFloat(edtPeso.Text);
  altura := StrToFloat(edtAltura.Text);
  imc := peso / (altura*altura);

  // Exibo o resultado
    lblResultado.Caption := FloatToStr(imc);

  // Defino a diagnóstico
    if (imc < 16) then
      diagnostico := 'Magreza grave.'

    else if ((imc >=16) and (imc < 17)) then
      diagnostico := 'Magreza moderada.'

    else if ((imc >=17) and (imc < 18.5)) then
      diagnostico := 'Magreza leve.'

    else if ((imc >=18.5) and (imc < 25)) then
      diagnostico := 'Saudável.'

    else if ((imc >=25) and (imc < 30)) then
      diagnostico := 'Sobrepeso.'

    else if ((imc >=30) and (imc < 35)) then
      diagnostico := 'Obesidade Grau I.'

    else if ((imc >=35) and (imc < 40)) then
      diagnostico := 'Obesidade Grau II.'

    else
      diagnostico := 'Obesidade Grau II.';

    // Exibo a diagnóstico
    lblDiagnostico.Caption := diagnostico;

    // Defino recomendação
    pesoCerto := 24.99 * (altura * altura);
    diferenca := peso - pesoCerto;

    if(diferenca > 0) then
      recomendacao := 'Você precisa reduzir '+FloatToStr(diferenca)+ 'kg'

    else if (diferenca < 0) then
      recomendacao := 'Você precisa aumentar '+FloatToStr(diferenca)+ 'kg'

    else
      recomendacao := 'Você está bem, continue assim';

    // Exibo a recomendação
    lblRecomendacao.Caption := recomendacao;


end;

end.
