import 'package:china_omda/presentation/presentation_managers/exports.dart';

class UserItem extends StatelessWidget {
  final UserModel userModel;
  final Function()? onTap;

  const UserItem({
    super.key,
    required this.userModel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 15.w,
          child: Text(
            userModel.country ?? '',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 11.sp,
              height: 1,
            ),
          ),
        ),
        Text(
          Jiffy.parse(userModel.registerDate ?? '').format(pattern: 'dd/MM/yyyy'),
          style: TextStyle(
            fontSize: 11.sp,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          width: 20.w,
          child: Text(
            userModel.name ?? '',
            style: TextStyle(
              fontSize: 11.sp,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          userModel.accountStatus!
              ? AppStrings.active.tr(context)
              : AppStrings.inActive.tr(context),
          style: TextStyle(
            fontSize: 11.sp,
            color: userModel.accountStatus! ? ColorManager.primaryGreen : ColorManager.red,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 13.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: ColorManager.primaryGreen,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Icon(
              Icons.remove_red_eye_outlined,
              color: ColorManager.white,
              size: 35,
            ),
          ),
        ),
      ],
    );
  }
}
