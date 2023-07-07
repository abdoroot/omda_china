import 'package:china_omda/models/constant_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class KnowUsView extends StatelessWidget {
  final bool isLogin;
  const KnowUsView({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    String lang = AppStrings.lang.tr(context);

    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {},
      builder: (context, state) {
        DrawerCubit cubit = DrawerCubit.get(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          body: Column(
            children: [
              HeaderView(
                headerText: AppStrings.knowUs,
                isLogin: isLogin,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                        child: StreamBuilder<ConstantModel>(
                            stream: cubit.getConstants(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }
                              return Text(
                                lang == 'English'
                                    ? snapshot.data!.knowUsAr!
                                    : snapshot.data!.knowUsEn!,
                                style: TextStyle(
                                  color: ColorManager.black,
                                ),
                                textAlign: TextAlign.center,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isLogin ? const SizedBox() : const BottomWidget(),
          drawer: isLogin ? null : const DrawerView(isLogin: false),
          endDrawer: isLogin ? null : const DrawerView(isLogin: false),
        );
      },
    );
  }
}
