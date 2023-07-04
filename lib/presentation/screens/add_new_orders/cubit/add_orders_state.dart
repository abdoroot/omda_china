abstract class AddOrdersState {}

class AddOrdersInitial extends AddOrdersState {}

class SelecteOrderType extends AddOrdersState {}

class AddInterests extends AddOrdersState {}

class RemoveInterests extends AddOrdersState {}

class MakeTourismOrderSuccess extends AddOrdersState {}

class MakeTourismOrderError extends AddOrdersState {}

class MakeProductOrderSuccess extends AddOrdersState {}

class MakeProductOrderError extends AddOrdersState {}

class ChangeProductIndex extends AddOrdersState {}
