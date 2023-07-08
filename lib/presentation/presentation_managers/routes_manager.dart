import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/admin_panel/views/banners/add_banner.dart';
import 'package:china_omda/presentation/screens/admin_panel/views/banners/banners_view.dart';
import 'package:china_omda/presentation/screens/admin_panel/views/constants/add_constants.dart';
import 'package:china_omda/presentation/screens/admin_panel/views/external_chats/external_chat_view.dart';
import 'package:china_omda/presentation/screens/admin_panel/views/payment_gates/payment_gates_view.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
  static const String bottomNav = '/bottomNav';
  static const String forgotPasswordRoute = '/forgotPasswor';
  static const String mainRoute = '/main';
  static const String profileRoute = '/profile';
  static const String activeCode = '/activeCode';
  static const String changePassword = '/changePassword';
  static const String newOrders = '/newOrders';
  static const String confirmTourismOrder = '/confirmTourismOrder';
  static const String productOrder2 = '/productOrder2';
  static const String productOrderDetails = '/productOrderDetails';
  static const String confirmProductOrder = '/confirmProductOrder';
  static const String successOrder = '/successOrder';
  static const String adminPanel = '/adminPanel';
  static const String eventView = '/eventView';
  static const String addEvent = '/addEvent';
  static const String holidayView = '/holidayView';
  static const String addHoliday = '/addHoliday';
  static const String bannerView = '/bannerView';
  static const String addBanner = '/addBanner';
  static const String addConstants = '/addConstants';
  static const String correspondence = '/correspondence';
  static const String paymerntGates = '/paymerntGates';
}

class RoutesGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => SignUpView());
      case Routes.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNavBarView());
      case Routes.activeCode:
        return MaterialPageRoute(builder: (_) => const ActiveCodeView());
      case Routes.changePassword:
        return MaterialPageRoute(builder: (_) => ChangeCodeView());
      case Routes.newOrders:
        return MaterialPageRoute(builder: (_) => const AddOrderView());
      case Routes.confirmTourismOrder:
        return MaterialPageRoute(builder: (_) => const ConfirmTourismOrder());
      case Routes.productOrder2:
        return MaterialPageRoute(builder: (_) => const ProductOrderTwo());
      case Routes.productOrderDetails:
        return MaterialPageRoute(builder: (_) => const ProductOrderDetails());
      case Routes.confirmProductOrder:
        return MaterialPageRoute(builder: (_) => const ConfirmProductOrder());
      case Routes.successOrder:
        return MaterialPageRoute(builder: (_) => const SuccessOrder());
      case Routes.adminPanel:
        return MaterialPageRoute(builder: (_) => const AdminPanelView());
      case Routes.eventView:
        return MaterialPageRoute(builder: (_) => const EventsView());
      case Routes.addEvent:
        return MaterialPageRoute(builder: (_) => AddEvents());
      case Routes.holidayView:
        return MaterialPageRoute(builder: (_) => const HolidaysView());
      case Routes.addHoliday:
        return MaterialPageRoute(builder: (_) => AddHolidays());
      case Routes.bannerView:
        return MaterialPageRoute(builder: (_) => const BannersView());
      case Routes.addBanner:
        return MaterialPageRoute(builder: (_) => AddBanner());
      case Routes.addConstants:
        return MaterialPageRoute(builder: (_) => AddConstants());
      case Routes.correspondence:
        return MaterialPageRoute(builder: (_) => const ExternalChatView());
      case Routes.paymerntGates:
        return MaterialPageRoute(builder: (_) => const PaymentGatesView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
            // appBar: AppBar(
            //   title: const Text(AppStrings.noRouteFound),
            // ),
            // body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
