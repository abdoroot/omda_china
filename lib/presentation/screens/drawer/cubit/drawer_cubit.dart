import 'package:china_omda/models/constant_model.dart';
import 'package:china_omda/models/external_message_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());

  static DrawerCubit get(context) => BlocProvider.of(context);
  var firestore = FirebaseFirestore.instance;

  Stream<UserModel> getUserData() {
    return firestore
        .collection('users')
        .doc(uId)
        .snapshots()
        .map((event) => UserModel.fromJson(event.data()!));
  }

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();

  Stream<ConstantModel> getConstants() {
    return firestore
        .collection('constants')
        .doc('const')
        .snapshots()
        .map((event) => ConstantModel.fromJson(event.data()!));
  }

  TextEditingController connectNameController = TextEditingController();
  TextEditingController connectPhoneController = TextEditingController();
  TextEditingController connectEmailController = TextEditingController();
  TextEditingController connectMessageController = TextEditingController();
  TextEditingController connectCompanyNameController = TextEditingController();

  Future<void> snedExternalMessage({
    required String senderName,
    required String senderCompanyName,
    required String senderPhone,
    required String message,
    required String senderEmail,
  }) async {
    var messageId = await generateUniqueId();
    await firestore
        .collection('exteranl_message')
        .doc(messageId)
        .set(ExternalMessageModel(
          id: messageId,
          senderName: senderName,
          senderCompanyName: senderCompanyName,
          senderPhone: senderPhone,
          message: message,
          senderEmail: senderEmail,
          messageTime: DateTime.now().toString(),
          status: 'new',
        ).toMap())
        .then((value) {
      emit(DrawerSendExternalMessageSuccess());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(DrawerSendExternalMessageError());
    });
  }

  void clearExternalMessage() {
    connectNameController.clear();
    connectPhoneController.clear();
    connectEmailController.clear();
    connectMessageController.clear();
    connectCompanyNameController.clear();
  }
}
