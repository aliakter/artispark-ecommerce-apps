class RemoteUrls {
  // static const String rootUrl = 'https://stagging.dhakasoftwares.com/';
  // static const String baseUrl = '${rootUrl}api/';

  static const String rootUrl = 'https://artispark.host/';
  static const String baseUrl = '${rootUrl}api/';

  static const String userLogin = '${baseUrl}auth/login';
  static const String socialLogin = '${baseUrl}auth/social-login';
  static const String userRegistration = '${baseUrl}auth/register';
  static const String home = '${baseUrl}home';
  static const String stories = '${baseUrl}stories';
  static const String storyCreate = '${baseUrl}stories/store';

  static String storyUpdate(id) => '${baseUrl}stories/$id/update';

  static String storyDetails(id) => '${baseUrl}stories/$id/details';
  static String colloboarteUrl = '${baseUrl}colloboarte/ads';
  static String ordersUrl = '${baseUrl}orders';
  static String artistList = '${baseUrl}seller/list';

  static String checkout(id) => '${baseUrl}checkout/$id';

  static String adsList(String searchText, String selectedCity,
          String categoryValue, String page) =>
      '${baseUrl}ads?paginate=10&page=$page&keyword=$searchText&category=$categoryValue&city_id=$selectedCity';

  static String adDetails(String slug) => '${baseUrl}ads/$slug';

  static String getAdEdit(String id) => '${baseUrl}ads/edit/$id';

  static String editProfile = "${baseUrl}auth/profile";
  static String forgotPassWord = "${baseUrl}send-forget-password";

  static String publicProfile(String userName) => "${baseUrl}seller/$userName";

  static String deleteStoryData(String id) => "${baseUrl}stories/$id/delete";
  static String changePassword = "${baseUrl}auth/password";
  static String deleteAccount = "${baseUrl}customer/account-delete";
  static String wishlist = "${baseUrl}customer/favourite-list";
  static String userAdsList = "${baseUrl}customer/ads?paginate=10";

  static String setUnSetWishlist(String id) => "${baseUrl}ads/favourite/$id";
  static String postAds = "${baseUrl}ads/create";
  static String sendReview = "${baseUrl}product-review/store";

  static String updateAds(String id) => "${baseUrl}ads/update/$id";

  static String editAds(String id) => "${baseUrl}ads/edit/$id";

  static String adDelete(String id) => "${baseUrl}customer/ads/$id/delete";
  static String dashboard = "${baseUrl}customer/dashboard-overview";
  static String compare = "${baseUrl}compare";
  static String favourite = "${baseUrl}customer/favourite-list";
  static String chatList = "${baseUrl}chats/user-list";

  static String chatDetails(String user) => "${baseUrl}chats/$user";

  static String getLanguages = '${baseUrl}language/sync';

  static String getSingleLanguage(String code) => '${baseUrl}language/$code';

  static String setRating(String userName) =>
      '${baseUrl}seller/review/$userName';

  static String registerWithToken(String token, {String? userId}) =>
      "${baseUrl}storeToken?token=$token&user_id=$userId";

  static String getChallengeProduct = "${baseUrl}challenge-product";
  static String changeChallengeProductStatue = "${baseUrl}challenge/status";

  static String uploadChallenge(int id) => '${baseUrl}challenge/$id/upload';
  static String cities = "${baseUrl}cities";
}
