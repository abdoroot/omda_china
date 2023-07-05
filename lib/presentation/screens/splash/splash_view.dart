import 'package:china_omda/presentation/presentation_managers/constancts_manager.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _statrtDelay() {
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() {
    uId = CachHelper.getData(key: 'uId');
    var accountType = CachHelper.getData(key: 'accountType');

    debugPrint(uId);
    if (uId == null) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    } else {
      if (accountType != 'admin') {
        Navigator.pushReplacementNamed(context, Routes.bottomNav);
      }
      Navigator.pushReplacementNamed(context, Routes.adminPanel);
    }
  }

  @override
  void initState() {
    super.initState();
    _statrtDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Stack(
        children: [
          Positioned(
            top: 130,
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              ImageAssets.splashlogo,
              height: 45.h,
              width: 45.w,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 540,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "وسيطك المعتمد للتعاملات التجارية والسياحية",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.27.sp,
                    color: ColorManager.brown2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            left: 0,
            top: 570,
            child: Text(
              "Your approved broker for commercial and tourism transactions",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10.sp,
                color: ColorManager.brown2,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
