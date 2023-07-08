import 'package:china_omda/models/external_message_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/admin_panel/views/external_chats/chat_message_details.dart';
import 'package:china_omda/presentation/screens/admin_panel/widgets/chat_message_item.dart';

class ExternalChatView extends StatelessWidget {
  const ExternalChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit cubit = AdminCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.correspondence,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: StreamBuilder<List<ExternalMessageModel>>(
                            stream: cubit.getChatMessage(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return const SizedBox();
                              }
                              return ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => ChatMessageItem(
                                  model: snapshot.data![index],
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ChatMessageDetails(model: snapshot.data![index]),
                                        ));
                                  },
                                ),
                                separatorBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 2.0.w),
                                  child: const Divider(thickness: 1),
                                ),
                                itemCount: snapshot.data!.length,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomWidget(isAdmin: true),
          drawer: const DrawerView(isLogin: false, isAdmin: true),
          endDrawer: const DrawerView(isLogin: false, isAdmin: true),
        );
      },
    );
  }
}
