import 'package:china_omda/models/events_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:china_omda/presentation/screens/admin_panel/cubit/admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  static AdminCubit get(context) => BlocProvider.of(context);

  var firestore = FirebaseFirestore.instance;
  TextEditingController startDate = TextEditingController();
  TextEditingController titleAr = TextEditingController();
  TextEditingController titleEn = TextEditingController();
  TextEditingController detailsAr = TextEditingController();
  TextEditingController detailsEn = TextEditingController();
  bool? eventStatus;

  void changeEventStatus(value) {
    eventStatus = value;
    emit(AdminSelecteEventStatus());
  }

  Future<void> addEvent({
    required String titleAr,
    required String titleEn,
    required bool status,
    required String detailsAr,
    required String detailsEn,
    required String startDate,
  }) async {
    var eventId = await generateUniqueId();
    await firestore
        .collection('events')
        .doc(eventId)
        .set(
          EventModel(
            titleAr: titleAr,
            titleEn: titleEn,
            status: status,
            id: eventId,
            detailsAr: detailsAr,
            detailsEn: detailsEn,
            startDate: startDate,
          ).toMap(),
        )
        .then((value) {
      emit(AdminAddEventSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(AdminAddEventError());
    });
  }

  void clearEventController() {
    startDate.clear();
    titleAr.clear();
    titleEn.clear();
    detailsAr.clear();
    detailsEn.clear();
    eventStatus = null;
  }
}
