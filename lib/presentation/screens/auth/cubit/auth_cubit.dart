import 'package:china_omda/presentation/presentation_managers/exports.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);
  TwilioServices twilioServices = TwilioServices();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Login
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordOtp = TextEditingController();

  // Sign up
  var regKey = GlobalKey<FormState>();
  TextEditingController regNameController = TextEditingController();
  TextEditingController regPhoneController = TextEditingController();
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regCountryController = TextEditingController();
  TextEditingController regFirstPassController = TextEditingController();
  TextEditingController regSecondPassController = TextEditingController();
  TextEditingController regThirdPassController = TextEditingController();
  TextEditingController regFourthPassController = TextEditingController();
  TextEditingController regConfirmFirstPassController = TextEditingController();
  TextEditingController regConfirmSecondPassController = TextEditingController();
  TextEditingController regConfirmThirdPassController = TextEditingController();
  TextEditingController regConfirmFourthPassController = TextEditingController();

  // confirm
  var confirmKey = GlobalKey<FormState>();
  TextEditingController confirmFirstPassController = TextEditingController();
  TextEditingController confirmSecondPassController = TextEditingController();
  TextEditingController confirmThirdPassController = TextEditingController();
  TextEditingController confirmFourthPassController = TextEditingController();

  // forget password
  var forgetKey = GlobalKey<FormState>();
  TextEditingController forgetPasswordController = TextEditingController();

  // active code
  var activeCodeKey = GlobalKey<FormState>();
  TextEditingController activeFirstPassController = TextEditingController();
  TextEditingController activeSecondPassController = TextEditingController();
  TextEditingController activeThirdPassController = TextEditingController();
  TextEditingController activeFourthPassController = TextEditingController();

  // change password
  var changePasswordKey = GlobalKey<FormState>();
  TextEditingController changeFirstPassController = TextEditingController();
  TextEditingController changeSecondPassController = TextEditingController();
  TextEditingController changeThirdPassController = TextEditingController();
  TextEditingController changeFourthPassController = TextEditingController();
  TextEditingController confirmChangeFirstPassController = TextEditingController();
  TextEditingController confirmChangeSecondPassController = TextEditingController();
  TextEditingController confirmChangeThirdPassController = TextEditingController();
  TextEditingController confirmChangeFourthPassController = TextEditingController();

  bool checkCode(String code) {
    if (twilioServices.code.toString() == code) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPassword() {
    if (regFirstPassController.text == regConfirmFirstPassController.text &&
        regSecondPassController.text == regConfirmSecondPassController.text &&
        regThirdPassController.text == regConfirmThirdPassController.text &&
        regFourthPassController.text == regConfirmFourthPassController.text) {
      return true;
    } else {
      return false;
    }
  }

  bool checkNewPassword() {
    if (changeFirstPassController.text == confirmChangeFirstPassController.text &&
        changeSecondPassController.text == confirmChangeSecondPassController.text &&
        changeThirdPassController.text == confirmChangeThirdPassController.text &&
        changeFourthPassController.text == confirmChangeFourthPassController.text) {
      return true;
    } else {
      return false;
    }
  }

  String? accountType;

  void selecteAccountType(String value) {
    accountType = value;
    emit(AuthSelecteAccountTypeState());
  }

  Future<void> createUser({
    required String phone,
    required String password,
    required String country,
    required String email,
    required String name,
    required String accountType,
  }) async {
    var userId = await generateUniqueId();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: '${password}china')
        .then((value) async {
      await firestore
          .collection('users')
          .doc(value.user!.uid)
          .set(
            UserModel(
              id: userId,
              uId: value.user!.uid,
              accountStatus: true,
              accountType: accountType,
              country: country,
              email: email,
              lastMessage: '',
              name: name,
              phone: phone,
              registerDate: DateTime.now().toString(),
              password: '${password}china',
            ).toMap(),
          )
          .then((value) {
        emit(AuthRegisterSuccessState());
      });
    }).catchError((error) {
      emit(AuthRegisterErrorState());
    });
  }

  void clearRegisterText() {
    accountType = null;
    regNameController.clear();
    regPhoneController.clear();
    regEmailController.clear();
    regCountryController.clear();
    regFirstPassController.clear();
    regSecondPassController.clear();
    regThirdPassController.clear();
    regFourthPassController.clear();
    regConfirmFirstPassController.clear();
    regConfirmSecondPassController.clear();
    regConfirmThirdPassController.clear();
    regConfirmFourthPassController.clear();

    confirmFirstPassController.clear();
    confirmSecondPassController.clear();
    confirmThirdPassController.clear();
    confirmFourthPassController.clear();
  }

  Future<void> userLogin({
    required String phone,
    required String password,
  }) async {
    UserModel? user;
    await firestore.collection('users').where('phone', isEqualTo: phone).get().then((value) {
      user = UserModel.fromJson(value.docs.first.data());
    });
    if (user!.password.toString() == '${password}china') {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: user!.email!,
        password: '${password}china',
      )
          .then((value) {
        emit(AuthLoginSuccessState(value.user!.uid));
      }).catchError((error) {
        print(error.toString());
        emit(AuthLoginErrorState());
      });
    }
  }

  void clearLoginText() {
    loginPasswordOtp.clear();
    loginPhoneController.clear();
  }

  Future<void> changePassword({
    required String phone,
    required String newPassword,
  }) async {
    UserModel? user;
    await firestore.collection('users').where('phone', isEqualTo: phone).get().then((value) {
      user = UserModel.fromJson(value.docs.first.data());
    }).then((value) async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: user!.email!,
        password: user!.password!,
      );
    });
    await FirebaseAuth.instance.currentUser!.updatePassword('${newPassword}china').then((value) {
      firestore.collection('users').doc(user!.uId).update({'password': '${newPassword}china'});
      emit(AuthChangePasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AuthChangePasswordErrorState());
    });
  }

  void clearChangePasswordText() {
    forgetPasswordController.clear();
    activeFirstPassController.clear();
    activeSecondPassController.clear();
    activeThirdPassController.clear();
    activeFourthPassController.clear();
    changeFirstPassController.clear();
    changeSecondPassController.clear();
    changeThirdPassController.clear();
    changeFourthPassController.clear();
    confirmChangeFirstPassController.clear();
    confirmChangeSecondPassController.clear();
    confirmChangeThirdPassController.clear();
    confirmChangeFourthPassController.clear();
  }

  Future<void> changePasswordMessage({
    context,
  }) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
            child: Text(
              AppStrings.updatedData.tr(context),
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          actions: <Widget>[
            Center(
              child: SizedBox(
                height: 6.h,
                width: 25.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      backgroundColor: ColorManager.brownText),
                  child: Text(
                    AppStrings.close.tr(context),
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2.h)
          ],
        );
      },
    );
  }
}
