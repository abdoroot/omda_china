abstract class PaymentState{}

class PaymentInitialState extends PaymentState{}
class PaymentLoadingState extends PaymentState{}
class PaymentSuccessState extends PaymentState{}
class PaymentErrorState extends PaymentState{}