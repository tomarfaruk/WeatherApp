class RemoteUrls {
  static const String rootUrl = "https://api.websolutionus.com/topcommerce/";
  static const String baseUrl =
      "https://api.websolutionus.com/topcommerce/api/";
  static const String homeUrl = baseUrl;
  static const String userRegister = baseUrl + 'store-register';
  static const String userLogin = baseUrl + 'store-login';
  static const String aboutUs = baseUrl + 'about-us';
  static const String faq = baseUrl + 'faq';
  static const String termsAndConditions = baseUrl + 'terms-and-conditions';
  static const String privacyPolicy = baseUrl + 'privacy-policy';
  static const String contactUs = baseUrl + 'contact-us';
  static const String sendContactMessage = baseUrl + 'send-contact-message';
  static String productDetail(String slug) =>
      baseUrl + 'product-detail/' + slug;

  static imageUrl(String imageUrl) => rootUrl + imageUrl;
}
