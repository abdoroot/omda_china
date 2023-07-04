import 'package:china_omda/presentation/screens/change_control_password/cubit/change_control_password_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeControlPasswordCubit extends Cubit<ChangeControlPasswordStates> {
  ChangeControlPasswordCubit() : super(ChangeControlPasswordInitialState());

  static ChangeControlPasswordCubit get(context) => BlocProvider.of(context);

  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordOneController = TextEditingController();
  final passwordTwoController = TextEditingController();
  final passwordThreeController = TextEditingController();
  final passwordFourController = TextEditingController();

}