import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/change_control_password/cubit/change_control_password_state.dart';

class ChangeControlPasswordCubit extends Cubit<ChangeControlPasswordStates> {
  ChangeControlPasswordCubit() : super(ChangeControlPasswordInitialState());

  static ChangeControlPasswordCubit get(context) => BlocProvider.of(context);

  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewpasswordController = TextEditingController();
  bool? oldPassword;
  var firestore = FirebaseFirestore.instance;

  bool checkOldPassword(String pass) {
    if ('${oldPasswordController.text}china' == pass) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> changePassword({
    required String newPassword,
  }) async {
    await FirebaseAuth.instance.currentUser!.updatePassword('${newPassword}china').then((value) {
      firestore.collection('users').doc(uId).update({'password': '${newPassword}china'});
      emit(ChangeControlPasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ChangeControlPasswordErrorState());
    });
  }
}
