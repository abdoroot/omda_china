abstract class  ChangeControlPasswordStates {}
class  ChangeControlPasswordInitialState extends ChangeControlPasswordStates {}
class  ChangeControlPasswordLoadingState extends ChangeControlPasswordStates {}
class  ChangeControlPasswordSuccessState extends ChangeControlPasswordStates
{
  String uid;
  ChangeControlPasswordSuccessState(this.uid);

}
class  ChangeControlPasswordErrorState extends ChangeControlPasswordStates {
  String error;
  ChangeControlPasswordErrorState(this.error);
}

