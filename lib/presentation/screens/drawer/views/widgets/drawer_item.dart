import 'package:china_omda/presentation/presentation_managers/exports.dart';


class DrawerItem extends StatelessWidget {
  final Function()? onTap;
  final String itemText;
  final Widget? image;

  const DrawerItem({
    super.key,
    this.onTap,
    required this.itemText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8.h,
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            image == null
                ? Image.asset(
                    ImageAssets.drawerIcon,
                  )
                : image!,
            SizedBox(width: 4.w),
            Text(
              itemText.tr(context),
              style: TextStyle(
                color: ColorManager.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
