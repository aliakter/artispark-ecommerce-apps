import 'package:artispark/apps/views/ad_details/ad_details_screen.dart';
import 'package:artispark/apps/views/ad_details/binding/ad_details_binding.dart';
import 'package:artispark/apps/views/ad_post/ad_post_screen.dart';
import 'package:artispark/apps/views/ad_post/binding/ad_post_binding.dart';
import 'package:artispark/apps/views/ads/ads_screen.dart';
import 'package:artispark/apps/views/ads/binding/ads_binding.dart';
import 'package:artispark/apps/views/ads_edit/ads_edit_screen.dart';
import 'package:artispark/apps/views/ads_edit/binding/ad_edit_binding.dart';
import 'package:artispark/apps/views/artist/binding/artist_binding.dart';
import 'package:artispark/apps/views/auth/forgot_password/binding/forgot_password_binding.dart';
import 'package:artispark/apps/views/auth/forgot_password/forgot_password_screen.dart';
import 'package:artispark/apps/views/auth/login/binding/login_binding.dart';
import 'package:artispark/apps/views/auth/login/login_screen.dart';
import 'package:artispark/apps/views/auth/registration/binding/signup_binding.dart';
import 'package:artispark/apps/views/auth/registration/signup_screen.dart';
import 'package:artispark/apps/views/challenge_product/bindings/challenge_product_bindings.dart';
import 'package:artispark/apps/views/challenge_product/screens/challenge_product_screen.dart';
import 'package:artispark/apps/views/chat/binding/chat_binding.dart';
import 'package:artispark/apps/views/chat/screens/chat_screen.dart';
import 'package:artispark/apps/views/chat_details/binding/chat_details_binding.dart';
import 'package:artispark/apps/views/chat_details/screens/chat_details_screen.dart';
import 'package:artispark/apps/views/checkout/binding/checkout_binding.dart';
import 'package:artispark/apps/views/checkout/screens/checkout_screen.dart';
import 'package:artispark/apps/views/compare/binding/compare_binding.dart';
import 'package:artispark/apps/views/dashboard/binding/dashboard_binding.dart';
import 'package:artispark/apps/views/dashboard/dashboard_screen.dart';
import 'package:artispark/apps/views/story/component/create_story.dart';
import 'package:artispark/apps/views/main/binding/main_screen_binding.dart';
import 'package:artispark/apps/views/main/views/main_screen.dart';
import 'package:artispark/apps/views/my_ads/binding/my_ads_binding.dart';
import 'package:artispark/apps/views/my_ads/my_ads_screen.dart';
import 'package:artispark/apps/views/order/binding/order_biniding.dart';
import 'package:artispark/apps/views/artist/artist_list_screen.dart';
import 'package:artispark/apps/views/profile/compare_page.dart';
import 'package:artispark/apps/views/order/order_list.dart';
import 'package:artispark/apps/views/profile_update/binding/profile_update_binding.dart';
import 'package:artispark/apps/views/profile_update/view/profile_update_screen.dart';
import 'package:artispark/apps/views/public_profile/binding/public_profile_binding.dart';
import 'package:artispark/apps/views/public_profile/public_profile_screen.dart';
import 'package:artispark/apps/views/setting/setting_screen.dart';
import 'package:artispark/apps/views/splash/binding/splash_binding.dart';
import 'package:artispark/apps/views/splash/screens/splash_screen.dart';
import 'package:artispark/apps/views/story/binding/story_binding.dart';
import 'package:artispark/apps/views/story/story_screen.dart';
import 'package:artispark/apps/views/transection/transection_screen.dart';
import 'package:artispark/apps/views/wishlist/binding/wishlist_binding.dart';
import 'package:artispark/apps/views/wishlist/wishlist_screen.dart';
import 'package:get/get.dart';

import 'routes.dart';

class Pages {
  static const initial = SplashScreen();

  // static const initial = SignUpScreen();
  static final pages = [
    GetPage(
        name: Routes.initial,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.main,
        page: () => MainScreen(),
        binding: MainScreenBinding()),
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.signup,
      page: () => const SignUpScreen(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Routes.forgotPass,
      page: () => const ForgotScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: Routes.dashBoard,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: Routes.publicProfile,
      page: () => const PublicProfileScreen(),
      binding: PublicProfileBinding(),
    ),
    GetPage(
      name: Routes.customerAds,
      page: () => const MyAdsScreen(),
      binding: MyAdsBinding(),
    ),
    GetPage(
      name: Routes.compareAds,
      page: () => ComparePage(),
      binding: CompareBinding(),
    ),
    GetPage(
      name: Routes.checkout,
      page: () => const CheckoutScreen(),
      binding: CheckoutBinding(),
    ),
    GetPage(
      name: Routes.challengeProduct,
      page: () => const ChallengeProductScreen(),
      binding: ChallengeProductBinding(),
    ),
    GetPage(
      name: Routes.favoriteAds,
      page: () => WishListScreen(),
      binding: WishlistBinding(),
    ),
    GetPage(
      name: Routes.transaction,
      page: () => const TransactionScreen(),
      // binding: MainScreenBinding(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => const SettingScreen(),
      // binding: MainScreenBinding(),
    ),
    GetPage(
      name: Routes.createStory,
      page: () => const CreateStory(),
      binding: StoryBinding(),
    ),
    GetPage(
      name: Routes.chat,
      page: () => const ChatScreen(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: Routes.chatDetails,
      page: () => const ChatDetailsScreen(),
      binding: ChatDetailsBinding(),
    ),
    GetPage(
      name: Routes.adDetailsScreen,
      page: () => const AdDetailsScreen(),
      binding: AdDetailsBinding(),
    ),
    GetPage(
      name: Routes.adsScreen,
      page: () => const AdsScreen(),
      binding: AdsBinding(),
    ),
    GetPage(
      name: Routes.adPostScreen,
      page: () => const AdPostScreen(),
      binding: AdPostBinding(),
    ),
    GetPage(
      name: Routes.editProfile,
      page: () => const ProfileUpdateScreen(),
      binding: ProfileUpdateBinding(),
    ),
    GetPage(
      name: Routes.adsEdit,
      page: () => const AdsEditScreen(),
      binding: AdEditBinding(),
    ),

    ///new project
    // GetPage(
    //   name: Routes.createStories,
    //   page: () => CreateStory(homeController: Get.,),
    //   // binding: AdEditBinding(),
    // ),
    GetPage(
      name: Routes.artistList,
      page: () => const ArtistList(),
      binding: ArtistBinding(),
    ),
    GetPage(
      name: Routes.orderList,
      page: () => OrderListScreen(),
      binding: OrderBinding(),
    ),
    GetPage(
      name: Routes.storyList,
      page: () => const StoryListScreen(),
      binding: StoryBinding(),
    ),
  ];
}
