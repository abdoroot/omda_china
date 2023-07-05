import 'package:china_omda/presentation/presentation_managers/exports.dart';

class SettingsItem extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onTap;
  

  const SettingsItem({
    super.key,
    required this.image,
    required this.text,
     this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image),
          SizedBox(height: 1.h),
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
