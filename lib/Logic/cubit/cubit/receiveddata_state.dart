part of 'receiveddata_cubit.dart';

abstract class ReceiveddataState extends Equatable {
  const ReceiveddataState();

  @override
  List<Object> get props => [];
}

class ReceiveddataConnecting extends ReceiveddataState {}

class ReceiveddataConnected extends ReceiveddataState {

  final String data ;
  ReceiveddataConnected({
    required this.data,
  });
  
  @override
  List<Object> get props => [data];


}
