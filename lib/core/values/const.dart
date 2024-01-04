class AppConst {
  //base

  static const int pageSize = 10;
  static const int pageSizeTablet = 20;
  static const int pageSizeWindows = 40;
  static const int defaultPage = 0;
  static const int requestTimeOut = 15000; //ms
  static const int millisecondsDefault = 1000;
  static const int limitPhone = 14;
  static const int limitTaxCode = 14;
  static const int limitIdentity = 12;
  static const int responseSuccess = 2;
  static const int responseExist = 3;
  static const int codeSuccess = 200;
  static const int currencyUtilsMaxLength = 12;
  static const int timePeriodic = 10;

  static const String keyToken = "keyToken";
  static const String keyUrlBaseImage = "keyImageCDN";
  static const String keyUserName = "keyUserName";
  static const String keyUserpassword = "keyPassword";
  static const String keyDarkMode = "keyDarkMode";
  // static const String keyCookies = "keyCookies";

  //giá trị mặc định phần nghìn
  static const bool isDot = false;

  static const int initTabBar = 0;

  static const int defaultLine = 2;

  //login
  static const int codeBlocked = 400;
  static const int codeAccountNotExist = 401;
  static const int codePasswordNotCorrect = 402;

  static const int defaultIdInvalid = 0;
  static const int defaultFeature = 1;

  //error
  static const int error500 = 500;
  static const int error404 = 404;
  static const int error401 = 401;
  static const int error400 = 400;
  static const int error502 = 502;
  static const int error503 = 503;

  static const String invoiceSeparator = " | ";

  //key print
  static const int printTaxAuthorityCode = 0;
  static const int printCustomer = 1;
  static const int printCustomerTax = 17;
  static const int printCustomerCitizenID = 18;
  static const int printTotal = 2;
  static const int printDiscountInv = 3;
  static const int printTotalAmount = 4;
  static const int printCusAmount = 5;
  static const int printRefund = 6;
  static const int printPaymentMethod = 7;
  static const int printInvTime = 8;
  static const int printAddress = 9;
  static const int printTitle = 10;
  static const int printFooter = 11;
  static const int printTotalVatAmount = 13;
  static const int printTotalProd = 14;
  static const int printFkey = 15;
  static const int settingQrSearch = 16;
  static const int printProductName = 50;
  static const int printProductUnitPrice = 51;
  static const int printProductUnit = 52;
  static const int printProductTotalPreTax = 53;
  static const int printProductDiscount = 54;
  static const int printProductVat = 55;
  static const int printProductTotalAmount = 56;

  //pattern state

  //Image size
  static const double maxWidth = 1000;
  static const double maxHeight = 1000;
  static const int quality = 100;
  //customer
  static const String codeCustomerDefault = "KH1";
  static const int idCustomerDefault = 0;
  //vatRate
  static const int maxVatRate = 100;
  static const int maxLengthInputFormBarcode = 50;
}
