import 'package:china_omda/models/profits_and_losess_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProfitsAndLossesItem extends StatelessWidget {
  final int itemIndex;
  final ProfitsAndLossesModel? model;

  const ProfitsAndLossesItem({
    super.key,
    required this.itemIndex,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${itemIndex + 1}',
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
        Text(
          Jiffy.parse(model!.date!.toString()).format(pattern: 'dd/MM/yyyy'),
          style: TextStyle(
            fontSize: 11.sp,
          ),
        ),
        Text(
          model!.reason!,
          style: TextStyle(
            fontSize: 11.sp,
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          model!.type == 'losses' ? AppStrings.losses.tr(context) : AppStrings.profit.tr(context),
          style: TextStyle(
            fontSize: 11.sp,
            color: model!.type == 'losses' ? ColorManager.red : ColorManager.primaryGreen,
          ),
        ),
        Text(
          model!.type == 'losses' ? '- ${model!.amount!}' : model!.amount!,
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontSize: 11.sp,
            color: model!.type == 'losses' ? ColorManager.red : ColorManager.primaryGreen,
          ),
        ),
      ],
    );
  }
}
