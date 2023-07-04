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
                    child: Text(
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد'
                      'مؤسسة الصين مؤسسة رسمية معتمدة ومرخصة ومعتمدة كوسيط تجاري معتمد لتمثيل الشركات والأفراد',
                      style: TextStyle(
                        color: ColorManager.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
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
  }
}
