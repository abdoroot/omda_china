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
  TextEditingController regNameController = TextEditingController();
  TextEditingController regPhoneController = TextEditingController();
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regCountryController = TextEditingController();
  TextEditingController regCountryCodeController = TextEditingController();
  TextEditingController regPassController = TextEditingController();
  TextEditingController regConfirmPassController = TextEditingController();

  // confirm
  TextEditingController confirmCodeController = TextEditingController();

  // forget password
  var forgetKey = GlobalKey<FormState>();
  TextEditingController forgetPasswordController = TextEditingController();

  // active code
  TextEditingController activeCodeController = TextEditingController();

  // change password
  TextEditingController changePassController = TextEditingController();
  TextEditingController confirmChangePassController = TextEditingController();

  bool checkCode(String code) {
    if (twilioServices.code.toString() == code) {
      return true;
    } else {
      return false;
    }
  }

  bool checkPassword() {
    if (regPassController.text == regConfirmPassController.text) {
      return true;
    } else {
      return false;
    }
  }

  bool checkNewPassword() {
    if (changePassController.text == confirmChangePassController.text) {
      return true;
    } else {
      return false;
    }
  }

  String? accountType;
  List<String> option = [
    AppStrings.personsAccount,
    AppStrings.commercialAccount,
  ];

  void selecteAccountType(String value) {
    accountType = value;
    emit(AuthSelecteAccountTypeState());
  }

  Future<void> createUser({
    required String phone,
    required String password,
    required String country,
    required String countryCode,
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
              countryCode: countryCode,
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
    confirmCodeController.clear();
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
        emit(AuthLoginSuccessState(value.user!.uid, user!.accountType!));
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
    activeCodeController.clear();
    changePassController.clear();
    confirmChangePassController.clear();
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
