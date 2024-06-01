import 'package:get/get.dart';

import '../modules/add_majestic_item/bindings/add_majestic_item_binding.dart';
import '../modules/add_majestic_item/views/add_majestic_item_view.dart';
import '../modules/add_new_swapProduct/bindings/add_new_swap_product_binding.dart';
import '../modules/add_new_swapProduct/views/add_new_swap_product_view.dart';
import '../modules/analytics/bindings/analytics_binding.dart';
import '../modules/analytics/views/analytics_view.dart';
import '../modules/bottombar/bindings/bottombar_binding.dart';
import '../modules/bottombar/views/bottombar_view.dart';
import '../modules/category_details/bindings/category_details_binding.dart';
import '../modules/category_details/views/category_details_view.dart';
import '../modules/changes_password/bindings/changes_password_binding.dart';
import '../modules/changes_password/views/changes_password_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/contact_us/bindings/contact_us_binding.dart';
import '../modules/contact_us/views/contact_us_view.dart';
import '../modules/create_account/bindings/create_account_binding.dart';
import '../modules/create_account/views/create_account_view.dart';
import '../modules/create_password/bindings/create_password_binding.dart';
import '../modules/create_password/views/create_password_view.dart';
import '../modules/create_swap/bindings/create_swap_binding.dart';
import '../modules/create_swap/views/create_swap_view.dart';
import '../modules/edit_exchange_product/bindings/edit_exchange_product_binding.dart';
import '../modules/edit_exchange_product/views/edit_exchange_product_view.dart';
import '../modules/edit_magestic_item/bindings/edit_magestic_item_binding.dart';
import '../modules/edit_magestic_item/views/edit_magestic_item_view.dart';
import '../modules/edit_product/bindings/edit_product_binding.dart';
import '../modules/edit_product/views/edit_product_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/exchange_address_add/bindings/exchange_address_add_binding.dart';
import '../modules/exchange_address_add/views/exchange_address_add_view.dart';
import '../modules/exchange_offer/bindings/exchange_offer_binding.dart';
import '../modules/exchange_offer/views/exchange_offer_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/majestic/bindings/majestic_binding.dart';
import '../modules/majestic/views/majestic_view.dart';
import '../modules/majestic_details/bindings/majestic_details_binding.dart';
import '../modules/majestic_details/views/majestic_details_view.dart';
import '../modules/message/bindings/message_binding.dart';
import '../modules/message/views/message_view.dart';
import '../modules/my_favourite/bindings/my_favourite_binding.dart';
import '../modules/my_favourite/views/my_favourite_view.dart';
import '../modules/my_magestic_item/bindings/my_magestic_item_binding.dart';
import '../modules/my_magestic_item/views/my_magestic_item_view.dart';
import '../modules/my_offer/bindings/my_offer_binding.dart';
import '../modules/my_offer/views/my_offer_view.dart';
import '../modules/my_product/bindings/my_product_binding.dart';
import '../modules/my_product/views/my_product_view.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/offer_user_list/bindings/offer_user_list_binding.dart';
import '../modules/offer_user_list/views/offer_user_list_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/product_info/bindings/product_info_binding.dart';
import '../modules/product_info/views/product_info_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profile_information/bindings/profile_information_binding.dart';
import '../modules/profile_information/views/profile_information_view.dart';
import '../modules/recommended_swap/bindings/recommended_swap_binding.dart';
import '../modules/recommended_swap/views/recommended_swap_view.dart';
import '../modules/review_details/bindings/review_details_binding.dart';
import '../modules/review_details/views/review_details_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/see_all_category/bindings/see_all_category_binding.dart';
import '../modules/see_all_category/views/see_all_category_view.dart';
import '../modules/see_new_swap/bindings/see_new_swap_binding.dart';
import '../modules/see_new_swap/views/see_new_swap_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/verification/bindings/verification_binding.dart';
import '../modules/verification/views/verification_view.dart';
import '../modules/view_offer/bindings/view_offer_binding.dart';
import '../modules/view_offer/views/view_offer_view.dart';
import '../modules/write_review/bindings/write_review_binding.dart';
import '../modules/write_review/views/write_review_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.HOME,
          page: () => const HomeView(),
          binding: HomeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ACCOUNT,
      page: () => const CreateAccountView(),
      binding: CreateAccountBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMBAR,
      page: () => const BottombarView(),
      binding: BottombarBinding(),
    ),
    GetPage(
      name: _Paths.VERIFICATION,
      page: () => const VerificationView(),
      binding: VerificationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_INFORMATION,
      page: () => const ProfileInformationView(),
      binding: ProfileInformationBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PASSWORD,
      page: () => const CreatePasswordView(),
      binding: CreatePasswordBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => const MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.MY_PRODUCT,
      page: () => const MyProductView(),
      binding: MyProductBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_SWAP_PRODUCT,
      page: () => const AddNewSwapProductView(),
      binding: AddNewSwapProductBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.MAJESTIC,
      page: () => const MajesticView(),
      binding: MajesticBinding(),
    ),
    GetPage(
      name: _Paths.MAJESTIC_DETAILS,
      page: () => const MajesticDetailsView(),
      binding: MajesticDetailsBinding(),
    ),
    GetPage(
      name: _Paths.SEE_ALL_CATEGORY,
      page: () => const SeeAllCategoryView(),
      binding: SeeAllCategoryBinding(),
    ),
    GetPage(
      name: _Paths.SEE_NEW_SWAP,
      page: () => const SeeNewSwapView(),
      binding: SeeNewSwapBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_DETAILS,
      page: () => const CategoryDetailsView(),
      binding: CategoryDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_INFO,
      page: () => const ProductInfoView(),
      binding: ProductInfoBinding(),
    ),
    GetPage(
      name: _Paths.EXCHANGE_OFFER,
      page: () => const ExchangeOfferView(),
      binding: ExchangeOfferBinding(),
    ),
    GetPage(
      name: _Paths.RECOMMENDED_SWAP,
      page: () => const RecommendedSwapView(),
      binding: RecommendedSwapBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.VIEW_OFFER,
      page: () => const ViewOfferView(),
      binding: ViewOfferBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.EXCHANGE_ADDRESS_ADD,
      page: () => const ExchangeAddressAddView(),
      binding: ExchangeAddressAddBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SWAP,
      page: () => const CreateSwapView(),
      binding: CreateSwapBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MAJESTIC_ITEM,
      page: () => const AddMajesticItemView(),
      binding: AddMajesticItemBinding(),
    ),
    GetPage(
      name: _Paths.OFFER_USER_LIST,
      page: () => const OfferUserListView(),
      binding: OfferUserListBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PRODUCT,
      page: () => const EditProductView(),
      binding: EditProductBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_EXCHANGE_PRODUCT,
      page: () => const EditExchangeProductView(),
      binding: EditExchangeProductBinding(),
    ),
    GetPage(
      name: _Paths.WRITE_REVIEW,
      page: () => const WriteReviewView(),
      binding: WriteReviewBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.REVIEW_DETAILS,
      page: () => const ReviewDetailsView(),
      binding: ReviewDetailsBinding(),
    ),
    GetPage(
      name: _Paths.MY_FAVOURITE,
      page: () => const MyFavouriteView(),
      binding: MyFavouriteBinding(),
    ),
    GetPage(
      name: _Paths.MY_OFFER,
      page: () => const MyOfferView(),
      binding: MyOfferBinding(),
    ),
    GetPage(
      name: _Paths.MY_MAGESTIC_ITEM,
      page: () => const MyMagesticItemView(),
      binding: MyMagesticItemBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_MAGESTIC_ITEM,
      page: () => const EditMagesticItemView(),
      binding: EditMagesticItemBinding(),
    ),
    GetPage(
      name: _Paths.ANALYTICS,
      page: () => const AnalyticsView(),
      binding: AnalyticsBinding(),
    ),
    GetPage(
      name: _Paths.CHANGES_PASSWORD,
      page: () => const ChangesPasswordView(),
      binding: ChangesPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT_US,
      page: () => const ContactUsView(),
      binding: ContactUsBinding(),
    ),
  ];
}
