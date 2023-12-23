import 'package:equatable/equatable.dart';
import 'package:side_proj/shared/enums.dart';

class AdminMenuState extends Equatable {
  final RequestState addItemState;
  final InternetState internetState;
  final RequestState fetchMenuState;

  const AdminMenuState({
    this.addItemState = RequestState.initial,
    this.internetState = InternetState.connected,
    this.fetchMenuState = RequestState.initial,
  });

  AdminMenuState copyWith(
          {RequestState? addItemState,
          InternetState? internetState,
          RequestState? fetchMenuState}) =>
      AdminMenuState(
        addItemState: addItemState ?? this.addItemState,
        internetState: internetState ?? this.internetState,
        fetchMenuState: fetchMenuState ?? this.fetchMenuState,
      );

  @override
  List<Object?> get props => [
        addItemState,
        internetState,
        fetchMenuState,
      ];
}
