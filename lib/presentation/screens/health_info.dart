import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Logic/cubit/cubit/receiveddata_cubit.dart';
import 'package:graduation_project/core/Routes/app_routes.dart';
import 'package:graduation_project/core/colors/appColors.dart';
import 'package:graduation_project/core/dimension/dimension.dart';
import 'package:graduation_project/presentation/widgets/widgets.dart';

class HealthInfo extends StatefulWidget {
  const HealthInfo({Key? key}) : super(key: key);


  @override
  State<HealthInfo> createState() => _HealthInfoState();
} 
class _HealthInfoState extends State<HealthInfo> { 
 
  @override
   build(BuildContext context) {
    return BlocBuilder<ReceiveddataCubit, ReceiveddataState>( 
      builder: (context, dataFromCensor) {
        
        if(   dataFromCensor is ReceiveddataConnected  ) 
                
        {  List  listOfData =dataFromCensor.data.split(','); 
        double healthStatus = double.parse( listOfData[1]);
        String healthResult = '';

        if(healthStatus == 1){
          healthResult = 'Normal';
        }else if(healthStatus == 2){
          healthResult = 'Take a rest and try again';
        }else if(healthStatus == 3){
          healthResult = 'Moderate high blood pressure';
        }else if(healthStatus == 4){
          healthResult = 'you must see a doctor';
        }
        return Scaffold(
          drawer: Drawer(),
          backgroundColor: AppColors.lightColor,
          appBar: AppBar(
            title: Text(
            'Health Info',
              style: TextStyle(color: AppColors.lightColor),
            ),
            centerTitle: true,
            backgroundColor: AppColors.darkColor,
          ),
          body: Container(
            alignment: Alignment.center,
            child: Stack( 
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoute.getInitial());
                      },
                      child: Container(
                        height: Dimension.pix40,
                        width: Dimension.pix40,
                        decoration: BoxDecoration(
                          color: Colors.white70,
                          borderRadius: BorderRadius.circular(Dimension.pix40)
                        ),
                        child: Center(child: Icon(Icons.arrow_back))),
                    ),
                  ), 
                  height: Dimension.screenHeight/2.3, 
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'images/health.png',
                      ),fit: BoxFit.fill)
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                     color: Colors.white,
        borderRadius: BorderRadius.circular(Dimension.pix30), 
      ),            
                  margin: EdgeInsets.only(top: Dimension.screenHeight/2.5),
                  height: Dimension.screenHeight/2,
                  width: Dimension.screenWidth,
                  child: Column(
                    children: [
                      InfoContainer(height: Dimension.screenHeight/8,
                        appText:const AppText(text: 'Heart Rate',), appDataText: AppText(text: listOfData[0].toString()),),
                       InfoContainer(height: Dimension.screenHeight/5,
                         appText:const AppText(text: 'Heath Status',), appDataText: AppText(text: healthResult),),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        );}else return Center(child: CircularProgressIndicator());
      },
    );
  }
}



