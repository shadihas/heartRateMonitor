import 'package:background_sms/background_sms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:graduation_project/Logic/cubit/connectivity_cubit.dart';
import 'package:graduation_project/Logic/cubit/cubit/receiveddata_cubit.dart';
import 'package:graduation_project/Logic/cubit/cubit/send_message.dart';
import 'package:graduation_project/Logic/cubit/datastorage_cubit.dart';
import 'package:graduation_project/Logic/cubit/geolocation_cubit.dart'; 
import 'package:graduation_project/core/Routes/app_routes.dart';
import 'package:graduation_project/core/colors/appColors.dart';
import 'package:graduation_project/core/dimension/dimension.dart';
import 'package:graduation_project/presentation/widgets/widgets.dart';
import 'package:graduation_project/repositoriy/geolocation_repository.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    GeolocationRepository().determinePosition();
    super.initState();
  } 
   bool sendIsDone = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatastorageCubit, DatastorageState>(
      builder: (context, datastate) {
        TextEditingController nameController =
            TextEditingController(text: '${datastate.newName}');
        TextEditingController addressController =
            TextEditingController(text: '${datastate.newAddress}');
        TextEditingController ageController =
            TextEditingController(text: '${datastate.newAge}'); 
        return BlocBuilder<GeolocationCubit, GeolocationState>(
          builder: (context, geoState) {
            if(geoState is Geolocationloaded){
            return BlocListener<ReceiveddataCubit, ReceiveddataState>(
                listener: (context, dataFromServer) async {
                  if (dataFromServer is ReceiveddataConnected) {
                    List<String> listOfData = dataFromServer.data.split(',');
                    String one = listOfData[0];
                    String Two = listOfData[1];
                  
                    double dataDouble = await double.parse(one);
                    double healthState = await double.parse(Two);
                  
                    if (
                    (dataDouble >= 145 || healthState == 4 ) && sendIsDone ==false
                      ) {
                      if (await isPermissionGranted()) {

                        sendMessage(
                          geoState.phoneNumber,
                          'hi ${geoState.name}Hospital \n It is an emergency \n my name is ${datastate.newName}\n I am ${datastate.newAge}\n' +
                          'my address is ${datastate.newAddress}\n myLat : ${geoState.myLat}\n myLng:${geoState.mylng}',
                        );
                         sendIsDone = true;
                        Get.snackbar('note', 'message has sent to ${geoState.name} Hospital', colorText:Colors.white, backgroundColor: AppColors.lightColor ); 
                       
                      } else
                        getPermission();
                    }
                  }
            }, 
                child: Scaffold(
                  body: ListView(
                    children: [ 
                       // The AppBar that includes the connectivity and the design. 
                      MyAppBar(),
                      Column(children: [ 
                        InfoTextField(
                          controller: nameController,
                          text: 'Name ',
                          keyboardtype: TextInputType.name,
                          icon: Icon(
                            Icons.person,
                            color: AppColors.darkColor,
                          ),
                        ),
                        InfoTextField(
                          keyboardtype: TextInputType.name,
                          controller: addressController,
                          text: 'Address ',
                          icon: Icon(
                            Icons.location_on,
                            color: AppColors.darkColor,
                          ),
                        ),
                        InfoTextField(
                          keyboardtype: TextInputType.number,
                          controller: ageController,
                          text: 'Age ',
                          icon: Icon(
                            Icons.person_outline_outlined,
                            color: AppColors.darkColor,
                          ),
                        ),
                      ]),
                      // buttons 1- save : to save your info after adding them in the textFormField
                      //  2 - Info : to get to the information page that shows info about your cardiovascular system.
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               
                             
                              SaveDataButton(context, nameController,
                                  addressController, ageController),
                              SizedBox(
                                width: Dimension.pix30,
                              ),
                              GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(AppRoute.getHealthInfo()),
                                  child: SaveButton(text: 'Info'))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          
                          // a button to send a message to the nearest hospital.
                          BlocBuilder<GeolocationCubit, GeolocationState>(
                            builder: (context, geoState) {
                              if (geoState is Geolocationloaded) {
                                return GestureDetector(
                                    onTap: () async {
                                     if (await isPermissionGranted()) {
                        sendMessage(
                          geoState.phoneNumber,
                          'hi ${geoState.name}Hospital \n It is an emergency \n my name is ${datastate.newName}\n I am ${datastate.newAge}\n' +
                          'my address is ${datastate.newAddress}\n myLat : ${geoState.myLat}\n myLng:${geoState.mylng}',  );
                      } else
                        getPermission();
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.message,
                                          size: 30,
                                          color: AppColors.darkColor,
                                        ),
                                        Text(
                                          ' send to the nearest hospital',
                                          style: textTheme.bodyText1?.copyWith(
                                              color: AppColors.darkColor),
                                        ),
                                        
                                      ],
                                    ));
                              } else
                                return Center(
                                    child: CircularProgressIndicator());
                            },
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ));
             }else return Scaffold(body: Center(child: Image.asset('images/heart.png',fit: BoxFit.fill,))); }
        );
      },
    );
  }

}