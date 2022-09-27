import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'datastorage_state.dart';

class DatastorageCubit extends Cubit<DatastorageState>  with HydratedMixin{
  DatastorageCubit() : super(DatastorageState(newName: '',newAddress: '',newAge: '')){
    
  }
  void saveInfo(newName,newAddress,newAge){
    emit(DatastorageState(newName:newName , newAddress:newAddress,newAge: newAge  ));
  }

  @override
  DatastorageState? fromJson(Map<String, dynamic> json) {
   return DatastorageState.fromMap(json);
  }

  @override
  Map<String,dynamic>? toJson(DatastorageState state) {
   return state.toMap();
  }

 
  }

  

