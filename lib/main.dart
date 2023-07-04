import 'package:china_omda/app/bloc_observer.dart';
import 'package:china_omda/presentation/presentation_managers/constancts_manager.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/orders/cubit/orders_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await CachHelper.init();
  Bloc.observer = MyBlocObserver();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  uId = CachHelper.getData(key: 'uId');
  retrieveCountryForIP();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => HomeCubit()..getSavedLanguage()),
            BlocProvider(create: (context) => BottomNavBarCubit()),
            BlocProvider(create: (context) => ChangeControlPasswordCubit()),
            BlocProvider(create: (context) => AuthCubit()),
            BlocProvider(create: (context) => OrdersCubit()),
            BlocProvider(create: (context) => AddOrdersCubit()),
            BlocProvider(create: (context) => DrawerCubit()),
          ],
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'China Omda',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(fontFamily: 'Cairo'),
                onGenerateRoute: RoutesGenerator.getRoutes,
                initialRoute: Routes.splashRoute,
                locale: state is ChangeLocaleState ? state.locale : null,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: const [
                  Locale('en', ''),
                  Locale('ar', ''),
                ],
                localeResolutionCallback: (currentLang, supportLang) {
                  if (currentLang != null) {
                    for (Locale locale in supportLang) {
                      if (locale.languageCode == currentLang.languageCode) {
                        return currentLang;
                      }
                    }
                  }
                  return supportLang.first;
                },
              );
            },
          ),
        );
      },
    );
  }
}
