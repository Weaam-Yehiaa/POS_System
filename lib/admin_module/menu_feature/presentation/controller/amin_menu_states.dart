import 'package:equatable/equatable.dart';
import 'package:side_proj/shared/enums.dart';

class AdminMenuState extends Equatable {
  final RequestState addItemState;
  final InternetState internetState;

  const AdminMenuState({
    this.addItemState = RequestState.initial,
    this.internetState = InternetState.connected,
  });

  AdminMenuState copyWith({
    RequestState? addItemState,
    InternetState? internetState,
  }) =>
      AdminMenuState(
        addItemState: addItemState ?? this.addItemState,
        internetState: internetState ?? this.internetState,
      );

  @override
  List<Object?> get props => [
        addItemState,
        internetState,
      ];
}
