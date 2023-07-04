import 'package:china_omda/presentation/presentation_managers/constancts_manager.dart';
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
}
