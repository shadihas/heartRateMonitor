import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  Connectivity connectivity = Connectivity();
  StreamSubscription? streamSubscription;
  ConnectivityCubit() : super(ConnectivityConnecting()){

  streamSubscription = connectivity.onConnectivityChanged.listen((connectionState) {
    if(connectionState == ConnectivityResult.mobile || connectionState == ConnectivityResult.wifi){
      connectivityConnected();


    }else if(connectionState == ConnectivityResult.none){
      connectivityConnecting();
    }
   });
  }

  void connectivityConnected(){
    emit(ConnectivityConnected());
    


  }
  void connectivityConnecting(){
    emit(ConnectivityConnecting());
  }
  @override
  Future<void> close() {
   streamSubscription?.cancel();
    return super.close();
  }
 
  
}
