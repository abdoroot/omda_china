import 'dart:io';
import 'package:china_omda/models/banner_model.dart';
import 'package:china_omda/models/constant_model.dart';
import 'package:china_omda/models/external_message_model.dart';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  static AdminCubit get(context) => BlocProvider.of(context);

  var firestore = FirebaseFirestore.instance;

  // add event
  TextEditingController startDate = TextEditingController();
  TextEditingController titleAr = TextEditingController();
  TextEditingController titleEn = TextEditingController();
  TextEditingController detailsAr = TextEditingController();
  TextEditingController detailsEn = TextEditingController();
  bool? eventStatus;

  List<String> statusValues = [AppStrings.active, AppStrings.inActive];
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

  Stream<List<EventModel>> getAllEvent() {
    return firestore
        .collection('events')
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  Stream<List<EventModel>> getAllActiveEvent() {
    return firestore
        .collection('events')
        .where('status', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  Stream<List<EventModel>> getAllInActiveEvent() {
    return firestore
        .collection('events')
        .where('status', isEqualTo: false)
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  TextEditingController modifyStartDate = TextEditingController();
  TextEditingController modifyTitleAr = TextEditingController();
  TextEditingController modifyTitleEn = TextEditingController();
  TextEditingController modifyDetailsAr = TextEditingController();
  TextEditingController modifyDetailsEn = TextEditingController();
  bool? modifyEventStatus;

  void changeModifyEventStatus(value) {
    modifyEventStatus = value;
  }

  Future<void> modifyEvent({
    required String titleAr,
    required String titleEn,
    required bool status,
    required String detailsAr,
    required String detailsEn,
    required String startDate,
    required String eventId,
  }) async {
    await firestore
        .collection('events')
        .doc(eventId)
        .update(
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
      emit(AdminModifyEventSuccess());
    }).catchError((e) {
      emit(AdminModifyEventError());
    });
  }

  // add holiday
  TextEditingController holidayStartDate = TextEditingController();
  TextEditingController holidayTitleAr = TextEditingController();
  TextEditingController holidayTitleEn = TextEditingController();
  TextEditingController holidayDetailsAr = TextEditingController();
  TextEditingController holidayDetailsEn = TextEditingController();
  bool? holidayStatus;

  void selecteHolidayStatus(value) {
    holidayStatus = value;
    emit(AdminSelecteEventStatus());
  }

  Future<void> addHoliday({
    required String titleAr,
    required String titleEn,
    required bool status,
    required String detailsAr,
    required String detailsEn,
    required String startDate,
  }) async {
    var eventId = await generateUniqueId();
    await firestore
        .collection('holidays')
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
      emit(AdminAddHolidaySuccess());
    }).catchError((e) {
      print(e.toString());
      emit(AdminAddHolidayError());
    });
  }

  void clearHolidayController() {
    holidayStartDate.clear();
    holidayDetailsAr.clear();
    holidayDetailsEn.clear();
    holidayTitleAr.clear();
    holidayTitleEn.clear();
    holidayStatus = null;
  }

  Stream<List<EventModel>> getAllHolidays() {
    return firestore
        .collection('holidays')
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  Stream<List<EventModel>> getAllActiveHolidays() {
    return firestore
        .collection('holidays')
        .where('status', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  Stream<List<EventModel>> getAllInActiveHolidays() {
    return firestore
        .collection('holidays')
        .where('status', isEqualTo: false)
        .snapshots()
        .map((event) => event.docs.map((e) => EventModel.fromJson(e.data())).toList());
  }

  TextEditingController modifyHolidayStartDate = TextEditingController();
  TextEditingController modifyHolidayTitleAr = TextEditingController();
  TextEditingController modifyHolidayTitleEn = TextEditingController();
  TextEditingController modifyHolidayDetailsAr = TextEditingController();
  TextEditingController modifyHolidayDetailsEn = TextEditingController();
  bool? modifyHolidayStatus;

  void changeModifyHolidayStatus(value) {
    modifyHolidayStatus = value;
  }

  Future<void> modifyHoliday({
    required String titleAr,
    required String titleEn,
    required bool status,
    required String detailsAr,
    required String detailsEn,
    required String startDate,
    required String eventId,
  }) async {
    await firestore
        .collection('holidays')
        .doc(eventId)
        .update(
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
      emit(AdminModifyHolidaySuccess());
    }).catchError((e) {
      emit(AdminModifyHolidayError());
    });
  }

  // add banners

  TextEditingController bannerStartDate = TextEditingController();
  TextEditingController bannerEndDate = TextEditingController();
  bool? bannerStatus;

  void selecteBannerStatus(value) {
    bannerStatus = value;
    emit(AdminSelecteBannerStatus());
  }

  File? bannerImage;

  Future<void> addBannerImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    bannerImage = File(image!.path);
    emit(AdminPickBannerImage());
  }

  Future<void> addBanner({
    required File image,
    required String endDate,
    required bool status,
    required String startDate,
  }) async {
    var bannerId = await generateUniqueId();
    await FirebaseStorage.instance
        .ref()
        .child('banners_image/${Uri.file(image.path).pathSegments.last}')
        .putFile(image)
        .then((value) {
      value.ref.getDownloadURL().then((value) async {
        await firestore
            .collection('banners')
            .doc(bannerId)
            .set(
              BannerModel(
                status: status,
                id: bannerId,
                endDate: endDate,
                image: value,
                startDate: startDate,
              ).toMap(),
            )
            .then((value) {
          emit(AdminAddBannerSuccess());
        }).catchError((e) {
          debugPrint(e.toString());
          emit(AdminAddBannerError());
        });
      });
    });
  }

  void clearBannerController() {
    bannerStartDate.clear();
    bannerEndDate.clear();
    bannerStatus = null;
    bannerImage = null;
  }

  Stream<List<BannerModel>> getAllBanners() {
    return firestore
        .collection('banners')
        .snapshots()
        .map((event) => event.docs.map((e) => BannerModel.fromJson(e.data())).toList());
  }

  Stream<List<BannerModel>> getAllActiveBanners() {
    return firestore
        .collection('banners')
        .where('status', isEqualTo: true)
        .snapshots()
        .map((event) => event.docs.map((e) => BannerModel.fromJson(e.data())).toList());
  }

  Stream<List<BannerModel>> getAllInActiveBanners() {
    return firestore
        .collection('banners')
        .where('status', isEqualTo: false)
        .snapshots()
        .map((event) => event.docs.map((e) => BannerModel.fromJson(e.data())).toList());
  }

  TextEditingController modifyBannerStartDate = TextEditingController();
  TextEditingController modifyBannerEndDate = TextEditingController();
  bool? modifyBannerStatus;

  void selecteModfidyBannerStatus(value) {
    modifyBannerStatus = value;
  }

  File? modifyBannerImage;

  Future<void> modifyBannersImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    modifyBannerImage = File(image!.path);
    emit(AdminPickBannerImage());
  }

  Future<void> modifyBanner({
    File? image,
    required String endDate,
    required bool status,
    required String startDate,
    required String bannerId,
  }) async {
    if (image != null) {
      await FirebaseStorage.instance
          .ref()
          .child('banners_image/${Uri.file(image.path).pathSegments.last}')
          .putFile(image)
          .then((value) {
        value.ref.getDownloadURL().then((value) async {
          await firestore
              .collection('banners')
              .doc(bannerId)
              .update(
                BannerModel(
                  status: status,
                  id: bannerId,
                  endDate: endDate,
                  image: value,
                  startDate: startDate,
                ).toMap(),
              )
              .then((value) {
            emit(AdminModifyBannerSuccess());
          }).catchError((e) {
            debugPrint(e.toString());
            emit(AdminModifyBannerError());
          });
        });
      });
    } else {
      await firestore
          .collection('banners')
          .doc(bannerId)
          .update(
            BannerModel(
              status: status,
              id: bannerId,
              endDate: endDate,
              startDate: startDate,
            ).toMap(),
          )
          .then((value) {
        emit(AdminModifyBannerSuccess());
      }).catchError((e) {
        debugPrint(e.toString());
        emit(AdminModifyBannerError());
      });
    }
  }

  // add Constants

  TextEditingController chinaGateController = TextEditingController();
  TextEditingController knowUsArController = TextEditingController();
  TextEditingController knowUsEnController = TextEditingController();
  TextEditingController tirmsArController = TextEditingController();
  TextEditingController tirmsEnController = TextEditingController();
  TextEditingController howWorkArController = TextEditingController();
  TextEditingController howWorkEnController = TextEditingController();

  Future<void> addConstants({
    required String chinaGateUrl,
    required String knowUsAr,
    required String knowUsEn,
    required String knowHowWorkAr,
    required String knowHowWorkEn,
    required String termsAndConditionsAr,
    required String termsAndConditionsEn,
  }) async {
    await firestore
        .collection('constants')
        .doc('const')
        .set(ConstantModel(
          chinaGateUrl: 'https://$chinaGateUrl',
          knowUsAr: knowUsAr,
          knowUsEn: knowUsEn,
          knowHowWorkAr: knowHowWorkAr,
          knowHowWorkEn: knowHowWorkEn,
          termsAndConditionsAr: termsAndConditionsAr,
          termsAndConditionsEn: termsAndConditionsEn,
        ).toMap())
        .then((value) {
      emit(AdminAddConstantsSuccess());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(AdminAddConstantsError());
    });
  }

  Future<void> updateConstants({
    required String chinaGateUrl,
    required String knowUsAr,
    required String knowUsEn,
    required String knowHowWorkAr,
    required String knowHowWorkEn,
    required String termsAndConditionsAr,
    required String termsAndConditionsEn,
  }) async {
    await firestore
        .collection('constants')
        .doc('const')
        .update(ConstantModel(
          chinaGateUrl: 'https://$chinaGateUrl',
          knowUsAr: knowUsAr,
          knowUsEn: knowUsEn,
          knowHowWorkAr: knowHowWorkAr,
          knowHowWorkEn: knowHowWorkEn,
          termsAndConditionsAr: termsAndConditionsAr,
          termsAndConditionsEn: termsAndConditionsEn,
        ).toMap())
        .then((value) {
      emit(AdminAddConstantsSuccess());
    }).catchError((e) {
      debugPrint(e.toString());
      emit(AdminAddConstantsError());
    });
  }

  void clearConstantsController() {
    chinaGateController.clear();
    knowUsArController.clear();
    knowUsEnController.clear();
    tirmsArController.clear();
    tirmsEnController.clear();
    howWorkArController.clear();
    howWorkEnController.clear();
  }

  Stream<ConstantModel> getConstants() {
    return firestore
        .collection('constants')
        .doc('const')
        .snapshots()
        .map((event) => ConstantModel.fromJson(event.data()!));
  }

  // add Chat
  Stream<List<ExternalMessageModel>> getChatMessage() {
    return firestore
        .collection('exteranl_message')
        .snapshots()
        .map((event) => event.docs.map((e) => ExternalMessageModel.fromJson(e.data())).toList());
  }
}
