import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ControlPanelView extends StatelessWidget {
  const ControlPanelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderView(
          headerText: AppStrings.controlPanel,
          isLogin: false,
          arrowTap: () {},
        ),
      ],
    );
  }
}
