import 'package:background_sms/background_sms.dart';
import 'package:permission_handler/permission_handler.dart';

getPermission() async => await [Permission.sms].request();

  Future<bool> isPermissionGranted() async =>
      await Permission.sms.status.isGranted;
  sendMessage(String phoneNumber, String message) async {
    var result = await BackgroundSms.sendMessage(
      phoneNumber: phoneNumber,
      message: message,
    );
    if (result == SmsStatus.sent) {
      print("Sent");
    } else {
      print("Failed");
    }}