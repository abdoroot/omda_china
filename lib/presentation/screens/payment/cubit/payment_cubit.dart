import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/payment/cubit/payment_state.dart';

class PaymentCubit extends Cubit<PaymentState>
{
  PaymentCubit() : super(PaymentInitialState());
  static PaymentCubit get(context) => BlocProvider.of(context);

}