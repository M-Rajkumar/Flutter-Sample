class StringConstants {
  //Time Handling
  static int delayedTime = 20; //20 Seconds
  static int timeOutDelayedTime = 20; //5 Seconds

  //API Method Code
  static int methodGet = 0;
  static int methodPost = 1;
  static int methodPut = 2;
  static int methodDelete = 3;

  //Request Code
  static var requestLogin = 100;

  //Login Page
  static String email = 'Email';
  static String password = 'Password';
  static String login = 'Login';
  static String forgotPassword = 'Forgot password';
  static String rememberPassword = 'Rememeber password';
  static String agreedTerms = 'By continuing you are confirming you have read and agreed to our ';
  static String termsConditions = 'Terms and Conditions';
  static String termsConditionsUrl = 'https://www.radiusdirect.net/terms.html';
  static String faqUrl = 'https://api.p2pconnections.com/user/#/faqView';
  static String forgotPasswordDescription = 'Please enter your e-mail address to recover your password';

  //Error Validation for Input Text Field
  static String emailEmpty = 'Please enter your email';
  static String emailValid = 'Please enter your valid email';
  static String passwordEmpty = 'Please enter your password';

  //Common Terms
  static String submit = 'Submit';
  static String error = 'Error';
  static String okay = 'Okay';
  static String close = 'Close';
  static String cancel = 'Cancel';
  static String retry = 'Retry';
  static String authorization = 'Authorization';
  static String bearer = 'Bearer';

  //Shared Preference Keys
  static String userId = 'userId';
  static String userType = 'userType';
  static String userToken = 'userToken';
  static String userName = 'userName';
  static String userFirstName = 'userFirstName';
  static String userFullName = 'userFullName';
  static String userLastName = 'userLastName';
  static String userPhoto = 'userPhoto';
  static String userPassword = 'userPassword';
  static String userSingleBrand = 'userSingleBrand';
  static String userBrandId = 'userBrandId';
  static String userBrandName = 'userBrandName';
  static String userSingleProduct = 'userSingleProduct';
  static String userProductId = 'userProductId';
  static String userProductName = 'userProductName';
  static String userRememberMe = 'userRememberMe';
  static String userIsLoggedIn = 'userIsLoggedIn';

  //Configurations
  static String baseApiUrl = 'baseApiUrl';
  static String userTimeZone = 'userTimeZone';
  static String fireBaseDatabaseUrl = 'fireBaseDatabaseUrl';
  static String gcmPusherKey = 'gcmPusherKey';
  static String tokBoxKey = 'tokBoxKey';
  static String videoScreen = 'videoScreen';

  //Network Error Handling
  static String errorInvalidToken = 'Invalid Token (Token Expired)';
  static String errorAuthenticationFailure = 'Authentication Failure';
  static String errorContactingServer = 'Error contacting server';
  static String errorMethodNotSupported = 'Method not supported';
  static String errorTimeOut = 'Time Out';
  static String errorParameterMissing = 'Parameter Missing';
  static String errorCode404 = 'Error code 404';
  static String errorCode401 = 'Login Expired';
  static String errorCode500 = 'Error contacting server';
  static String errorLostConnection = 'Lost connection to Servers';
  static String errorNetworkConnection = 'Oops, your connection seems off...\nKeep calm, Try again';
  static String errorNetwork =
      'You have lost connection to the server. This might be due to poor network. Try again by\n ' +
          ' - Tapping on the retry button.\n' +
          ' - Going to the previous page.\n' +
          ' - Refreshing page by pulling it down.\n' +
          ' - Log out and log back in.\n' +
          'Please call us, if the issue is not resolved.';
  static String errorSomethingWrong = 'Something went wrong';
  static String errorInvalidRequest = 'Invalid Request';
  static String errorInvalidInput = 'Invalid Input';
  static String errorDuringCommunication = 'Error During Communication';
}
