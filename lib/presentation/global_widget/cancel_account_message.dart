import 'package:china_omda/presentation/presentation_managers/exports.dart';

class CancelAccountDialog extends StatelessWidget {
  const CancelAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: double.infinity,
          height: 60.h,
          color: ColorManager.black,
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              Image.asset('assets/images/cancel_user_account.png'),
              SizedBox(height: 2.h),
              Text(
                AppStrings.sureToDelete.tr(context),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.white,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                AppStrings.delelteMessage.tr(context),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorManager.white,
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 7.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(ColorManager.red),
                  ),
                  child: Text(
                    AppStrings.yes.tr(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorManager.white,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 2.h),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppStrings.cancel.tr(context),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.white,
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
