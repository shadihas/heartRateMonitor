part of 'connectivity_cubit.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

class ConnectivityConnecting extends ConnectivityState {}
class ConnectivityConnected extends ConnectivityState {


}

// hercules setup 