
part of 'datastorage_cubit.dart'; 
class DatastorageState { 
  String newName;
  String newAge;
  String newAddress;
  
  DatastorageState({
    required this.newName,
    required this.newAddress,
    required this.newAge,
  }); 
  Map<String, dynamic> toMap() {
    return {
      'newName': newName,
      'newAge': newAge,
      'newAddress': newAddress,
    };
  }

  factory DatastorageState.fromMap(Map<String, dynamic> map) {
    return DatastorageState(
      newName: map['newName'] ?? '',
      newAge: map['newAge'] ?? '',
      newAddress: map['newAddress'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DatastorageState.fromJson(String source) => DatastorageState.fromMap(json.decode(source));
}
