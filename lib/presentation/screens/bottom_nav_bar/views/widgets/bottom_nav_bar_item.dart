import 'package:china_omda/presentation/presentation_managers/exports.dart';

class BottomNavBarItem extends StatelessWidget {
  final Function()? onTap;
  final int? index;
  final String image;
  final String title;
  final double width;

  const BottomNavBarItem({
    super.key,
    this.onTap,
    this.index,
    required this.image,
    required this.title,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 8.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (BottomNavBarCubit.get(context).screenIndex == index)
              Container(
                width: double.infinity,
                height: 3,
                color: ColorManager.white,
              ),
            const Spacer(),
            SvgPicture.asset(
              image,
            ),
            const Spacer(),
            Text(
              title.tr(context),
              style: TextStyle(
                color: ColorManager.secondary,
                fontSize: 8.5.sp,
                height: 1,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const SizedBox(height: 3),
          ],
        ),
      ),
    );
  }
}
