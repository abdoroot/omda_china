import 'package:china_omda/models/external_message_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ChatMessageDetails extends StatelessWidget {
  final ExternalMessageModel model;

  const ChatMessageDetails({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        AdminCubit cubit = AdminCubit.get(context);
        var lang = AppStrings.lang.tr(context);
        cubit.chatStatus = model.status;
        return Scaffold(
          drawerEnableOpenDragGesture: lang == 'English' ? false : true,
          endDrawerEnableOpenDragGesture: lang == 'English' ? true : false,
          backgroundColor: ColorManager.white,
          body: Column(
            children: [
              const HeaderView(
                headerText: AppStrings.viewMessage,
                isLogin: false,
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              model.senderName ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: Text(
                                Jiffy.parse(model.messageTime!)
                                    .format(pattern: "dd/MM/yyyy hh:mm a"),
                                style: TextStyle(
                                  color: ColorManager.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 2.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.senderCompanyName ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: ColorManager.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  model.senderEmail ?? '',
                                  style: TextStyle(
                                    color: ColorManager.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text(
                                    model.senderPhone ?? '',
                                    style: TextStyle(
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 2.w),
                        Text(
                          model.message ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        GlobalDropDownButton(
                          items: cubit.chatStatusList,
                          onChanged: (value) {
                            cubit.selecteChatStatus(value);
                          },
                          padding: EdgeInsets.zero,
                          height: 7.h,
                          lableText: AppStrings.status.tr(context),
                          value: cubit.chatStatus,
                        ),
                        SizedBox(height: 3.h),
                        GlobalButton(
                          text: 'save',
                          color: ColorManager.secondary,
                          height: 5.h,
                          width: 50.w,
                          colorText: ColorManager.white,
                          raduis: 20,
                          onPressed: () {
                            if (cubit.chatStatus == AppStrings.delete) {
                              cubit.deleteChat(messageId: model.id!).then((value) {
                                cubit.chatStatus = null;
                                Navigator.pop(context);
                              });
                            } else {
                              cubit
                                  .changeChatStatus(
                                      messageId: model.id!, statusValue: cubit.chatStatus!)
                                  .then((value) {
                                cubit.chatStatus = null;
                                Navigator.pop(context);
                              });
                            }
                          },
                        ),
                      ],
                    ),
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
