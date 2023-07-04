import 'package:china_omda/presentation/presentation_managers/exports.dart';

class DashboardItem extends StatelessWidget {
  final String image;
  final String textNum;
  final String text;
  final double? right;
  final double? left;
  final Function() onTap;

  const DashboardItem({
    Key? key,
    required this.image,
    required this.text,
    required this.textNum,
    this.right,
    this.left,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            alignment: AppStrings.lang.tr(context) == 'Arabic'
                ? AlignmentDirectional.topEnd
                : AlignmentDirectional.topStart,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Image.asset(
                  image,
                  height: 7.h,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: right ?? 0.0,
                  left: left ?? 0.0,
                ),
                child: CircleAvatar(
                  radius: 11.5,
                  backgroundColor: ColorManager.brownText,
                  child: Text(
                    textNum,
                    style: TextStyle(
                      fontSize: 8.5.sp,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
