abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSendSmsSuccess extends AuthState {}

class AuthSendSmsError extends AuthState {}

class AuthRegisterSuccessState extends AuthState {}

class AuthRegisterErrorState extends AuthState {}

class AuthLoginSuccessState extends AuthState {
  String uId;
  AuthLoginSuccessState(this.uId);
}

class AuthLoginErrorState extends AuthState {}

class AuthChangePasswordSuccessState extends AuthState {}

class AuthChangePasswordErrorState extends AuthState {}

class AuthSelecteAccountTypeState extends AuthState {}
