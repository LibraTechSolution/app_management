class Api {
  //* Creating instance constructor;
  static Api instance = Api();

  //* Base API URL
  static const baseURL = "https://backend.wecheck999.com/api/v1";


  String getPhoneReport = "$baseURL/phonereport?page=%page%&limit=%limit%";

  String postPhoneReport = "$baseURL/phonereport";

  String getPhoneSearchPage = "$baseURL/phonesearch?page=1&limit=100";

  String getPhoneInitData = "$baseURL/phonereport";


  String getPhoneSearch = "$baseURL/phonesearch?page=%page%&limit=50";

  String postPhoneSearch = "$baseURL/phonesearch";

  String getPhoneDetail = "$baseURL/phonereport/%id%";

  String getAppReport = "$baseURL/appreport?page=%page%&limit=%limit%";

  String getLinkReport = "$baseURL/linkreport?page=%page%&limit=%limit%";

  String getMessage = "$baseURL/message?page=%page%&limit=%limit%";

  String getMessageDetail = "$baseURL/message/%id%";

  String getPhoneReportSearch = "$baseURL/phonesearch/search/%phonenumber%?page=1&limit=10";

  String updatePhoneSearch = "$baseURL/phonesearch/%phonenumber%";

  String getLinkSearchReport = "$baseURL/linkreport/search/%search%?page=%page%&limit=%limit%";


  String updateReport = "$baseURL/phonechart/createReport";

  String detailPhoneSearch = "$baseURL/phonesearch/%id%";

  String getPhoneReportDetail = "$baseURL/phonechart/findNumber/%phone%";

  String getPhoneComment = "$baseURL/phonecomment/search/%id%?page=%page%&limit=%limit%";

  String getNews = "$baseURL/news?page=%page%&limit=%limit%";

  String getNewsComment = "$baseURL/newscomment/%id%";

  String getNewsDetail = "$baseURL/news/%id%";


  String phoneRequest = "$baseURL/phonerequest?page=1&limit=50";

  String phoneRequestNews = "$baseURL/phonerequest";


}