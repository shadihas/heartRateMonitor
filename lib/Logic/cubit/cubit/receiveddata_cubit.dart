import 'dart:convert';
import 'dart:io'; 
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart'; 
part 'receiveddata_state.dart';
 List<int> data = [3,3];
class ReceiveddataCubit extends Cubit<ReceiveddataState> {
  ReceiveddataCubit() : super(ReceiveddataConnecting());
  
  void sendToServer() async{
     
    Socket socket = await Socket.connect('10.2.0.2', 23);
  print('connected'); 
  
  }

  void connectToServer() async{
     
    Socket socket = await Socket.connect('10.2.0.2', 23);
  print('connected'); 
socket.add(utf8.encode('hello')); 
  // listen to the received data event stream
  // socket.add([]);
  socket.listen((List<int> event) {
    print(utf8.decode(event));
    emit(ReceiveddataConnected(data:utf8.decode(event)));
  });


   
  // send hello
   
  
  // wait 5 seconds
  //  await Future.delayed(Duration(seconds: 5)); 
  // .. and close the socket
   
  }
  
}
