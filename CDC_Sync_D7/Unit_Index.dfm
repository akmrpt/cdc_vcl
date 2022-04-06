object Form1: TForm1
  Left = 221
  Top = 104
  Width = 925
  Height = 621
  Caption = 'CDC_Sync'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Memo1: TMemo
    Left = 616
    Top = 49
    Width = 293
    Height = 533
    Align = alRight
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 909
    Height = 49
    Align = alTop
    Color = clNavy
    TabOrder = 0
    object btn_Post2: TButton
      Left = 336
      Top = 9
      Width = 125
      Height = 32
      Caption = 'Post Custody'
      TabOrder = 2
      OnClick = btn_Post2Click
    end
    object btn_Post: TButton
      Left = 200
      Top = 9
      Width = 125
      Height = 32
      Caption = 'Post Account'
      TabOrder = 1
      OnClick = btn_PostClick
    end
    object btn_open: TButton
      Left = 112
      Top = 9
      Width = 75
      Height = 32
      Caption = 'Open'
      TabOrder = 0
      OnClick = btn_openClick
    end
    object btnReadini: TButton
      Left = 694
      Top = 8
      Width = 75
      Height = 25
      Caption = 'readini'
      TabOrder = 3
      Visible = False
      OnClick = btnReadiniClick
    end
    object btnPost3: TButton
      Left = 472
      Top = 8
      Width = 125
      Height = 32
      Caption = 'Post Earmarking'
      TabOrder = 4
      OnClick = btnPost3Click
    end
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 616
    Height = 533
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'CDC-Data'
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 608
        Height = 502
        Align = alClient
        Caption = 'CDC Data'
        Color = clSkyBlue
        ParentColor = False
        TabOrder = 0
        object DBGrid2: TDBGrid
          Left = 2
          Top = 18
          Width = 604
          Height = 120
          Align = alTop
          Color = clScrollBar
          DataSource = ds_Sql_CDC_AccInfo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
        object DBGrid3: TDBGrid
          Left = 2
          Top = 258
          Width = 604
          Height = 242
          Align = alClient
          Color = clMoneyGreen
          DataSource = ds_SQL_cdc_Earmarking
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
        object DBGrid5: TDBGrid
          Left = 2
          Top = 138
          Width = 604
          Height = 120
          Align = alTop
          DataSource = ds_Sql_CDC_CUSTODYACCOUNTINFO
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'SEBO-Data'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 608
        Height = 502
        Align = alClient
        Caption = 'SEBO Data'
        Color = clLime
        ParentColor = False
        TabOrder = 0
        object DBGrid1: TDBGrid
          Left = 2
          Top = 18
          Width = 604
          Height = 120
          Align = alTop
          Color = clScrollBar
          DataSource = ds_Ora_CDC_AccInfo
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
        object DBGrid4: TDBGrid
          Left = 2
          Top = 138
          Width = 604
          Height = 120
          Align = alTop
          DataSource = ds_Ora_CDC_CUSTODYACCOUNTINFO
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
        object DBGrid6: TDBGrid
          Left = 2
          Top = 258
          Width = 604
          Height = 242
          Align = alClient
          Color = clMoneyGreen
          DataSource = ds_Ora_CDC_EARMARKING
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
        end
      end
    end
  end
  object OraConn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=OraOLEDB.Oracle.1;Password=101171;Persist Security Info' +
      '=True;User ID=sebo;Data Source=202.143.125.107:1521/odb'
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle.1'
    Left = 16
    Top = 24
  end
  object Ora_CDC_AccInfo: TADOQuery
    Connection = OraConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from SEBO.CDC_ACCOUNTINFO')
    Left = 176
    Top = 224
  end
  object ds_Ora_CDC_AccInfo: TDataSource
    DataSet = Ora_CDC_AccInfo
    Left = 224
    Top = 224
  end
  object SqlConn: TMSConnection
    Database = 'db_pnc_com_pk_anc2021'
    Username = 'db_pnc_com_pk_sa'
    Server = 'db.pnc.com.pk'
    LoginPrompt = False
    Left = 16
    Top = 56
    EncryptedPassword = 'CEFFCDFFBAFF98FFC0FF8EFF9DFFC6FF'
  end
  object Sql_CDC_AccInfo: TMSQuery
    Connection = SqlConn
    SQL.Strings = (
      'Select * from CDC_ACCOUNTINFO')
    Left = 296
    Top = 96
    object Sql_CDC_AccInfo_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = '_ID'
      ReadOnly = True
    end
    object Sql_CDC_AccInfobankid: TStringField
      FieldName = 'bankid'
      Size = 5
    end
    object Sql_CDC_AccInfobankShortCode: TStringField
      FieldName = 'bankShortCode'
      Size = 4
    end
    object Sql_CDC_AccInfobrokerShortCode: TStringField
      FieldName = 'brokerShortCode'
      Size = 4
    end
    object Sql_CDC_AccInfofullName: TStringField
      FieldName = 'fullName'
      Size = 60
    end
    object Sql_CDC_AccInfofatherSpouseName: TStringField
      FieldName = 'fatherSpouseName'
      Size = 40
    end
    object Sql_CDC_AccInfomotherMaidenName: TStringField
      FieldName = 'motherMaidenName'
      Size = 40
    end
    object Sql_CDC_AccInfodateofBirth: TStringField
      FieldName = 'dateofBirth'
      Size = 25
    end
    object Sql_CDC_AccInfoplaceofBirth: TStringField
      FieldName = 'placeofBirth'
      Size = 40
    end
    object Sql_CDC_AccInfocnicNicopPoc: TStringField
      FieldName = 'cnicNicopPoc'
    end
    object Sql_CDC_AccInfouinType: TStringField
      FieldName = 'uinType'
      Size = 10
    end
    object Sql_CDC_AccInfocnicNicopPocDateofIssuance: TStringField
      FieldName = 'cnicNicopPocDateofIssuance'
      Size = 25
    end
    object Sql_CDC_AccInfoopfmembershipnumber: TStringField
      FieldName = 'opfmembershipnumber'
      Size = 100
    end
    object Sql_CDC_AccInfopassportNumber: TStringField
      FieldName = 'passportNumber'
    end
    object Sql_CDC_AccInfonationalities: TStringField
      FieldName = 'nationalities'
      Size = 100
    end
    object Sql_CDC_AccInfoemailAddress: TStringField
      FieldName = 'emailAddress'
      Size = 60
    end
    object Sql_CDC_AccInfolandlineNumber: TStringField
      FieldName = 'landlineNumber'
    end
    object Sql_CDC_AccInfocellNumber: TStringField
      FieldName = 'cellNumber'
    end
    object Sql_CDC_AccInfocompleteMailingAddress: TStringField
      FieldName = 'completeMailingAddress'
      Size = 120
    end
    object Sql_CDC_AccInfofatcaCRSDeclaration: TStringField
      FieldName = 'fatcaCRSDeclaration'
      Size = 100
    end
    object Sql_CDC_AccInfoprofession: TStringField
      FieldName = 'profession'
      Size = 80
    end
    object Sql_CDC_AccInfosourceofIncome: TStringField
      FieldName = 'sourceofIncome'
      Size = 50
    end
    object Sql_CDC_AccInfoexistingBankAccountDetailsofcustomer: TStringField
      FieldName = 'existingBankAccountDetailsofcustomer'
      Size = 100
    end
    object Sql_CDC_AccInfoibanofNRANCAAccount: TStringField
      FieldName = 'ibanofNRANCAAccount'
      Size = 30
    end
    object Sql_CDC_AccInfouploadedFileNames: TStringField
      FieldName = 'uploadedFileNames'
      Size = 1000
    end
    object Sql_CDC_AccInfonumberofDocuments: TStringField
      FieldName = 'numberofDocuments'
      Size = 2
    end
    object Sql_CDC_AccInfotermsandconditionagreed: TStringField
      FieldName = 'termsandconditionagreed'
      Size = 5
    end
    object Sql_CDC_AccInfoselectedBroker: TStringField
      FieldName = 'selectedBroker'
      Size = 5
    end
    object Sql_CDC_AccInfosecuritymarket: TStringField
      FieldName = 'securitymarket'
      Size = 5
    end
    object Sql_CDC_AccInforeserved: TStringField
      FieldName = 'reserved'
      Size = 200
    end
  end
  object ds_Sql_CDC_AccInfo: TMSDataSource
    DataSet = Sql_CDC_AccInfo
    Left = 344
    Top = 96
  end
  object Ora_sp_AddAccInfo: TADOStoredProc
    Connection = OraConn
    ProcedureName = 'sp_Add_AccountInfo'
    Parameters = <
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end>
    Prepared = True
    Left = 216
    Top = 8
  end
  object Ora_query: TADOQuery
    Connection = OraConn
    Parameters = <>
    Left = 48
    Top = 24
  end
  object Sql_CDC_CUSTODYACCOUNTINFO: TMSQuery
    Connection = SqlConn
    SQL.Strings = (
      'Select * from CDC_CUSTODYACCOUNTINFO')
    Left = 552
    Top = 96
    object Sql_CDC_CUSTODYACCOUNTINFO_ID: TIntegerField
      FieldName = '_ID'
      ReadOnly = True
    end
    object Sql_CDC_CUSTODYACCOUNTINFObrokerShortCode: TStringField
      FieldName = 'brokerShortCode'
      Size = 4
    end
    object Sql_CDC_CUSTODYACCOUNTINFOcnicNicopPoc: TStringField
      FieldName = 'cnicNicopPoc'
    end
    object Sql_CDC_CUSTODYACCOUNTINFOcdcParticipantId: TStringField
      FieldName = 'cdcParticipantId'
      Size = 5
    end
    object Sql_CDC_CUSTODYACCOUNTINFOcdcAccountNumber: TStringField
      FieldName = 'cdcAccountNumber'
      Size = 10
    end
    object Sql_CDC_CUSTODYACCOUNTINFOaccOpeningDate: TDateTimeField
      FieldName = 'accOpeningDate'
    end
    object Sql_CDC_CUSTODYACCOUNTINFOreserved: TStringField
      FieldName = 'reserved'
      Size = 200
    end
  end
  object ds_Sql_CDC_CUSTODYACCOUNTINFO: TMSDataSource
    DataSet = Sql_CDC_CUSTODYACCOUNTINFO
    Left = 600
    Top = 96
  end
  object Ora_CDC_CUSTODYACCOUNTINFO: TADOQuery
    Connection = OraConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from SEBO.CDC_CUSTODYACCOUNTINFO')
    Left = 560
    Top = 216
  end
  object ds_Ora_CDC_CUSTODYACCOUNTINFO: TDataSource
    DataSet = Ora_CDC_CUSTODYACCOUNTINFO
    Left = 608
    Top = 216
  end
  object Ora_sp_Add_CustodyAccountInfo: TADOStoredProc
    Connection = OraConn
    ProcedureName = 'SP_ADD_CUSTODYACCOUNTINFO'
    Parameters = <
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end
      item
        Size = -1
        Value = Null
      end>
    Prepared = True
    Left = 352
    Top = 8
  end
  object SQL_cdc_Earmarking: TMSQuery
    Connection = SqlConn
    SQL.Strings = (
      'Select * from cdc_Earmarking')
    Left = 664
    Top = 96
    object SQL_cdc_Earmarking_Seq: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayWidth = 11
      FieldName = '_Seq'
      ReadOnly = True
    end
    object SQL_cdc_EarmarkingTrnYear: TIntegerField
      DisplayWidth = 8
      FieldName = 'TrnYear'
    end
    object SQL_cdc_EarmarkingTrnId: TIntegerField
      DisplayWidth = 12
      FieldName = 'TrnId'
    end
    object SQL_cdc_EarmarkingBroker: TStringField
      DisplayWidth = 8
      FieldName = 'Broker'
      Size = 55
    end
    object SQL_cdc_EarmarkingElementID: TStringField
      DisplayWidth = 10
      FieldName = 'ElementID'
      Size = 55
    end
    object SQL_cdc_EarmarkingAccountNumber: TIntegerField
      DisplayWidth = 16
      FieldName = 'AccountNumber'
    end
    object SQL_cdc_EarmarkingSecuritySymbol: TStringField
      DisplayWidth = 17
      FieldName = 'SecuritySymbol'
      Size = 55
    end
    object SQL_cdc_EarmarkingTradeDirection: TStringField
      DisplayWidth = 15
      FieldName = 'TradeDirection'
      Size = 55
    end
    object SQL_cdc_EarmarkingQuantity: TIntegerField
      DisplayWidth = 12
      FieldName = 'Quantity'
    end
    object SQL_cdc_EarmarkingCash: TFloatField
      DisplayWidth = 12
      FieldName = 'Cash'
      Precision = 12
    end
    object SQL_cdc_EarmarkingTradeDate: TDateField
      DisplayWidth = 15
      FieldName = 'TradeDate'
    end
  end
  object ds_SQL_cdc_Earmarking: TMSDataSource
    DataSet = SQL_cdc_Earmarking
    Left = 712
    Top = 96
  end
  object Ora_CDC_EARMARKING: TADOQuery
    Connection = OraConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from SEBO.CDC_EARMARKING')
    Left = 712
    Top = 216
  end
  object ds_Ora_CDC_EARMARKING: TDataSource
    DataSet = Ora_CDC_EARMARKING
    Left = 760
    Top = 216
  end
  object Ora_sp_add_earmarking: TADOStoredProc
    Connection = OraConn
    ProcedureName = 'sp_add_earmarking'
    Parameters = <
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end
      item
        Value = Null
      end>
    Prepared = True
    Left = 488
    Top = 8
  end
end
