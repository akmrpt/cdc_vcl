unit Unit_Index;

interface

uses
  IniFiles, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, DBAccess, MSAccess, MemDS, StdCtrls,
  ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    OraConn: TADOConnection;
    Ora_CDC_AccInfo: TADOQuery;
    ds_Ora_CDC_AccInfo: TDataSource;
    SqlConn: TMSConnection;
    Sql_CDC_AccInfo: TMSQuery;
    ds_Sql_CDC_AccInfo: TMSDataSource;
    Memo1: TMemo;
    Ora_sp_AddAccInfo: TADOStoredProc;
    Sql_CDC_AccInfo_ID: TIntegerField;
    Sql_CDC_AccInfobankid: TStringField;
    Sql_CDC_AccInfobankShortCode: TStringField;
    Sql_CDC_AccInfobrokerShortCode: TStringField;
    Sql_CDC_AccInfofullName: TStringField;
    Sql_CDC_AccInfofatherSpouseName: TStringField;
    Sql_CDC_AccInfomotherMaidenName: TStringField;
    Sql_CDC_AccInfodateofBirth: TStringField;
    Sql_CDC_AccInfoplaceofBirth: TStringField;
    Sql_CDC_AccInfocnicNicopPoc: TStringField;
    Sql_CDC_AccInfouinType: TStringField;
    Sql_CDC_AccInfocnicNicopPocDateofIssuance: TStringField;
    Sql_CDC_AccInfoopfmembershipnumber: TStringField;
    Sql_CDC_AccInfopassportNumber: TStringField;
    Sql_CDC_AccInfonationalities: TStringField;
    Sql_CDC_AccInfoemailAddress: TStringField;
    Sql_CDC_AccInfolandlineNumber: TStringField;
    Sql_CDC_AccInfocellNumber: TStringField;
    Sql_CDC_AccInfocompleteMailingAddress: TStringField;
    Sql_CDC_AccInfofatcaCRSDeclaration: TStringField;
    Sql_CDC_AccInfoprofession: TStringField;
    Sql_CDC_AccInfosourceofIncome: TStringField;
    Sql_CDC_AccInfoexistingBankAccountDetailsofcustomer: TStringField;
    Sql_CDC_AccInfoibanofNRANCAAccount: TStringField;
    Sql_CDC_AccInfouploadedFileNames: TStringField;
    Sql_CDC_AccInfonumberofDocuments: TStringField;
    Sql_CDC_AccInfotermsandconditionagreed: TStringField;
    Sql_CDC_AccInfoselectedBroker: TStringField;
    Sql_CDC_AccInfosecuritymarket: TStringField;
    Sql_CDC_AccInforeserved: TStringField;
    Ora_query: TADOQuery;
    Sql_CDC_CUSTODYACCOUNTINFO: TMSQuery;
    ds_Sql_CDC_CUSTODYACCOUNTINFO: TMSDataSource;
    Ora_CDC_CUSTODYACCOUNTINFO: TADOQuery;
    ds_Ora_CDC_CUSTODYACCOUNTINFO: TDataSource;
    Sql_CDC_CUSTODYACCOUNTINFO_ID: TIntegerField;
    Sql_CDC_CUSTODYACCOUNTINFObrokerShortCode: TStringField;
    Sql_CDC_CUSTODYACCOUNTINFOcnicNicopPoc: TStringField;
    Sql_CDC_CUSTODYACCOUNTINFOcdcParticipantId: TStringField;
    Sql_CDC_CUSTODYACCOUNTINFOcdcAccountNumber: TStringField;
    Sql_CDC_CUSTODYACCOUNTINFOaccOpeningDate: TDateTimeField;
    Sql_CDC_CUSTODYACCOUNTINFOreserved: TStringField;
    Ora_sp_Add_CustodyAccountInfo: TADOStoredProc;
    Panel1: TPanel;
    btn_Post2: TButton;
    btn_Post: TButton;
    btn_open: TButton;
    btnReadini: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid4: TDBGrid;
    DBGrid5: TDBGrid;
    SQL_cdc_Earmarking: TMSQuery;
    ds_SQL_cdc_Earmarking: TMSDataSource;
    SQL_cdc_Earmarking_Seq: TIntegerField;
    SQL_cdc_EarmarkingTrnYear: TIntegerField;
    SQL_cdc_EarmarkingTrnId: TIntegerField;
    SQL_cdc_EarmarkingBroker: TStringField;
    SQL_cdc_EarmarkingElementID: TStringField;
    SQL_cdc_EarmarkingAccountNumber: TIntegerField;
    SQL_cdc_EarmarkingSecuritySymbol: TStringField;
    SQL_cdc_EarmarkingTradeDirection: TStringField;
    SQL_cdc_EarmarkingQuantity: TIntegerField;
    SQL_cdc_EarmarkingCash: TFloatField;
    SQL_cdc_EarmarkingTradeDate: TDateField;
    DBGrid6: TDBGrid;
    Ora_CDC_EARMARKING: TADOQuery;
    ds_Ora_CDC_EARMARKING: TDataSource;
    Ora_sp_add_earmarking: TADOStoredProc;
    btnPost3: TButton;
    procedure btn_PostClick(Sender: TObject);
    procedure btn_openClick(Sender: TObject);
    procedure btn_Post2Click(Sender: TObject);
    procedure btnReadiniClick(Sender: TObject);
    procedure btnPost3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  conSQL, conORA, ftpLOCAL, ftpREMOTE: string;
implementation

{$R *.dfm}

procedure TForm1.btn_PostClick(Sender: TObject);
var
  sKeyValue, sIsEntry, SqlSring, sResult: string;
begin

  Sql_CDC_AccInfo.First;
  while not Sql_CDC_AccInfo.EOF do begin

    sKeyValue := Sql_CDC_AccInfocnicNicopPoc.Value;

    SqlSring := 'Select nvl(count(*),0) as IsEntry from CDC_ACCOUNTINFO where CNICNICOPPOC = ' + QuotedStr(sKeyValue);

    Ora_query.SQL.Clear;
    Ora_query.SQL.Add(SqlSring);
    Ora_query.Active := True;

    sIsEntry := Ora_query.FieldValues['IsEntry'];


    if sIsEntry = '0' then begin
      Ora_sp_AddAccInfo.Close;
      Ora_sp_AddAccInfo.Prepared;

      Ora_sp_AddAccInfo.Parameters.Items[0].Value := Sql_CDC_AccInfobankid.Value;
      Ora_sp_AddAccInfo.Parameters.Items[1].Value := Sql_CDC_AccInfobankShortCode.Value;
      Ora_sp_AddAccInfo.Parameters.Items[2].Value := Sql_CDC_AccInfobrokerShortCode.Value;
      Ora_sp_AddAccInfo.Parameters.Items[3].Value := Sql_CDC_AccInfofullName.Value;
      Ora_sp_AddAccInfo.Parameters.Items[4].Value := Sql_CDC_AccInfofatherSpouseName.Value;
      Ora_sp_AddAccInfo.Parameters.Items[5].Value := Sql_CDC_AccInfomotherMaidenName.Value;
      Ora_sp_AddAccInfo.Parameters.Items[6].Value := Sql_CDC_AccInfodateofBirth.Value;
      Ora_sp_AddAccInfo.Parameters.Items[7].Value := Sql_CDC_AccInfoplaceofBirth.Value;
      Ora_sp_AddAccInfo.Parameters.Items[8].Value := Sql_CDC_AccInfocnicNicopPoc.Value;
      Ora_sp_AddAccInfo.Parameters.Items[9].Value := Sql_CDC_AccInfouinType.Value;
      Ora_sp_AddAccInfo.Parameters.Items[10].Value := Sql_CDC_AccInfocnicNicopPocDateofIssuance.Value;
      Ora_sp_AddAccInfo.Parameters.Items[11].Value := Sql_CDC_AccInfoopfmembershipnumber.Value;
      Ora_sp_AddAccInfo.Parameters.Items[12].Value := Sql_CDC_AccInfopassportNumber.Value;
      Ora_sp_AddAccInfo.Parameters.Items[13].Value := Sql_CDC_AccInfonationalities.Value;
      Ora_sp_AddAccInfo.Parameters.Items[14].Value := Sql_CDC_AccInfoemailAddress.Value;
      Ora_sp_AddAccInfo.Parameters.Items[15].Value := Sql_CDC_AccInfolandlineNumber.Value;
      Ora_sp_AddAccInfo.Parameters.Items[16].Value := Sql_CDC_AccInfocellNumber.Value;
      Ora_sp_AddAccInfo.Parameters.Items[17].Value := Sql_CDC_AccInfocompleteMailingAddress.Value;
      Ora_sp_AddAccInfo.Parameters.Items[18].Value := Sql_CDC_AccInfofatcaCRSDeclaration.Value;
      Ora_sp_AddAccInfo.Parameters.Items[19].Value := Sql_CDC_AccInfoprofession.Value;
      Ora_sp_AddAccInfo.Parameters.Items[20].Value := Sql_CDC_AccInfosourceofIncome.Value;
      Ora_sp_AddAccInfo.Parameters.Items[21].Value := Sql_CDC_AccInfoexistingBankAccountDetailsofcustomer.Value;
      Ora_sp_AddAccInfo.Parameters.Items[22].Value := Sql_CDC_AccInfoibanofNRANCAAccount.Value;
      Ora_sp_AddAccInfo.Parameters.Items[23].Value := Sql_CDC_AccInfouploadedFileNames.Value;
      Ora_sp_AddAccInfo.Parameters.Items[24].Value := Sql_CDC_AccInfonumberofDocuments.Value;
      Ora_sp_AddAccInfo.Parameters.Items[25].Value := Sql_CDC_AccInfotermsandconditionagreed.Value;
      Ora_sp_AddAccInfo.Parameters.Items[26].Value := Sql_CDC_AccInfoselectedBroker.Value;
      Ora_sp_AddAccInfo.Parameters.Items[27].Value := Sql_CDC_AccInfosecuritymarket.Value;
      Ora_sp_AddAccInfo.Parameters.Items[28].Value := Sql_CDC_AccInforeserved.Value;

      Ora_sp_AddAccInfo.ExecProc;
      sResult := 'Posting Account Info : ' + sKeyValue;

    end else begin
      sResult := 'Already Exist Account Info : ' + sKeyValue;
    end;



    Memo1.Lines.Add(sResult);
    Sql_CDC_AccInfo.Next;
  end;

  Ora_CDC_AccInfo.Requery([eoAsyncFetchNonBlocking]);

end;

procedure TForm1.btn_openClick(Sender: TObject);
var
  connstr: string;
begin
  btnReadiniClick(nil);


  SqlConn.ConnectString := conSQL;

  SqlConn.Open;



  Sql_CDC_AccInfo.Active := True;
  Sql_CDC_CUSTODYACCOUNTINFO.Active := True;
  SQL_cdc_Earmarking.Active := True;

  OraConn.ConnectionString := conORA;
  OraConn.Open;

  Ora_CDC_AccInfo.Active := True;
  Ora_CDC_CUSTODYACCOUNTINFO.Active := True;
  Ora_CDC_EARMARKING.Active := True;


    //Memo1.Clear;
   // Memo1.Lines.Add('SqlConn='+SqlConn.ConnectString) ;
   // Memo1.Lines.Add('OraConn='+OraConn.ConnectionString) ;

end;

procedure TForm1.btn_Post2Click(Sender: TObject);
var
  sKeyValue, sIsEntry, SqlSring, sResult: string;
begin

  Sql_CDC_CUSTODYACCOUNTINFO.First;
  while not Sql_CDC_CUSTODYACCOUNTINFO.EOF do begin

    sKeyValue := Sql_CDC_CUSTODYACCOUNTINFOcnicNicopPoc.Value;

    SqlSring := 'Select nvl(count(*),0) as IsEntry from CDC_CUSTODYACCOUNTINFO where CNICNICOPPOC = ' + QuotedStr(sKeyValue);


    Ora_query.Close;
    Ora_query.SQL.Clear;
    Ora_query.SQL.Add(SqlSring);
    Ora_query.Active := True;


    sIsEntry := Ora_query.FieldValues['IsEntry'];

    if sIsEntry = '0' then begin
      Ora_sp_Add_CustodyAccountInfo.Close;
      Ora_sp_Add_CustodyAccountInfo.Prepared;

      Ora_sp_Add_CustodyAccountInfo.Parameters.Items[0].Value := Sql_CDC_CUSTODYACCOUNTINFObrokerShortCode.Value;
      Ora_sp_Add_CustodyAccountInfo.Parameters.Items[1].Value := Sql_CDC_CUSTODYACCOUNTINFOcnicNicopPoc.Value;
      Ora_sp_Add_CustodyAccountInfo.Parameters.Items[2].Value := Sql_CDC_CUSTODYACCOUNTINFOcdcParticipantId.Value;
      Ora_sp_Add_CustodyAccountInfo.Parameters.Items[3].Value := Sql_CDC_CUSTODYACCOUNTINFOcdcAccountNumber.Value;
      Ora_sp_Add_CustodyAccountInfo.Parameters.Items[4].Value := Sql_CDC_CUSTODYACCOUNTINFOaccOpeningDate.Value;
      Ora_sp_Add_CustodyAccountInfo.Parameters.Items[5].Value := Sql_CDC_CUSTODYACCOUNTINFOreserved.Value;
      Ora_sp_Add_CustodyAccountInfo.ExecProc;

      sResult := 'Posting CUSTODYAccount : ' + sKeyValue;


    end else begin
      sResult := 'Already Exist CUSTODYAccount : ' + sKeyValue;
    end;



    Memo1.Lines.Add(sResult);
    Sql_CDC_CUSTODYACCOUNTINFO.next;
  end;

  Ora_CDC_CUSTODYACCOUNTINFO.Requery([eoAsyncFetchNonBlocking]);

end;

procedure TForm1.btnReadiniClick(Sender: TObject);
var
  connstr: string;
  IniFile: TIniFile;
begin
  Memo1.Clear;
  IniFile := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'connect.ini');

  //conSQL , conORA , ftpLOCAL , ftpREMOTE
  try
    connstr := IniFile.ReadString('Connect', 'SqlConn', '');
    conSQL := connstr;
    //Memo1.Lines.Add('consql=' + connstr);
    connstr := IniFile.ReadString('Connect', 'OraConn', '');
    conORA := connstr;
   // Memo1.Lines.Add('connora=' + connstr);
    connstr := IniFile.ReadString('ftp', 'local', '');
    ftpLOCAL := connstr;
    //Memo1.Lines.Add('ftp local=' + connstr);
    connstr := IniFile.ReadString('ftp', 'remote', '');
    ftpREMOTE := connstr;
    //Memo1.Lines.Add('ftp remote=' + connstr);
  finally
    IniFile.Free;
  end;


end;

procedure TForm1.btnPost3Click(Sender: TObject);
var
  sKeyValue, sIsEntry, SqlSring, sResult: string;
begin
  SQL_cdc_Earmarking.First;
  while not SQL_cdc_Earmarking.EOF do begin
    sKeyValue := IntToStr(SQL_cdc_EarmarkingTrnId.Value);


    SqlSring := 'Select nvl(count(*),0) as IsEntry from CDC_EARMARKING where TRNID = ' + QuotedStr(sKeyValue);

    Ora_query.Close;
    Ora_query.SQL.Clear;
    Ora_query.SQL.Add(SqlSring);
    Ora_query.Active := True;

    sIsEntry := Ora_query.FieldValues['IsEntry'];


    if sIsEntry = '0' then begin
      Ora_sp_add_earmarking.Close;
      Ora_sp_add_earmarking.Prepared;

      Ora_sp_add_earmarking.Parameters.Items[0].Value := SQL_cdc_EarmarkingTrnYear.Value;
      Ora_sp_add_earmarking.Parameters.Items[1].Value := SQL_cdc_EarmarkingTrnId.Value;
      Ora_sp_add_earmarking.Parameters.Items[2].Value := SQL_cdc_EarmarkingBroker.Value;
      Ora_sp_add_earmarking.Parameters.Items[3].Value := SQL_cdc_EarmarkingElementID.Value;
      Ora_sp_add_earmarking.Parameters.Items[4].Value := SQL_cdc_EarmarkingAccountNumber.Value;
      Ora_sp_add_earmarking.Parameters.Items[5].Value := SQL_cdc_EarmarkingSecuritySymbol.Value;
      Ora_sp_add_earmarking.Parameters.Items[6].Value := SQL_cdc_EarmarkingTradeDirection.Value;
      Ora_sp_add_earmarking.Parameters.Items[7].Value := SQL_cdc_EarmarkingQuantity.Value;
      Ora_sp_add_earmarking.Parameters.Items[8].Value := SQL_cdc_EarmarkingCash.Value;
      Ora_sp_add_earmarking.Parameters.Items[9].Value := SQL_cdc_EarmarkingTradeDate.Value;


      Ora_sp_add_earmarking.ExecProc;



      sResult := 'Posting Earmarking : ' + sKeyValue;


    end else begin
      sResult := 'Already Exist Earmarking : ' + sKeyValue;
    end;
    Memo1.Lines.Add(sResult);
    SQL_cdc_Earmarking.Next;

  end;
  Ora_CDC_EARMARKING.Requery([eoAsyncFetchNonBlocking]);

  
end;

end.

