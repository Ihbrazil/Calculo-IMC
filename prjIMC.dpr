program prjIMC;

uses
  Vcl.Forms,
  untIMC in 'untIMC.pas' {frmIMC};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmIMC, frmIMC);
  Application.Run;
end.
