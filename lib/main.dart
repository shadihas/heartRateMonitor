import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:get/get.dart';
import 'package:graduation_project/Logic/cubit/connectivity_cubit.dart';
import 'package:graduation_project/Logic/cubit/cubit/receiveddata_cubit.dart';
import 'package:graduation_project/Logic/cubit/datastorage_cubit.dart';
import 'package:graduation_project/Logic/cubit/geolocation_cubit.dart';

import 'package:graduation_project/core/Routes/app_routes.dart'; 
import 'package:graduation_project/presentation/screens/homePage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 final storage = await HydratedStorage.build(
   storageDirectory: await getApplicationDocumentsDirectory()
 );
HydratedBlocOverrides.runZoned(
  () => runApp(MyApp()),
  storage: storage,
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        
        BlocProvider<ConnectivityCubit>(
          create: (context) => ConnectivityCubit(),
        ),
        BlocProvider(
          create: (context) => DatastorageCubit(),
        ),
         BlocProvider<GeolocationCubit>(
          create: (context) => GeolocationCubit()
          ..getTheSecondNearestHospital(),
          ), 
             BlocProvider<ReceiveddataCubit>(
              create: (context) => ReceiveddataCubit()
               ..connectToServer()
          
          
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Gratuation project',
        initialRoute: AppRoute.getInitial(),
       getPages:AppRoute.routes,
        home: HomePage()
      ),
    );
  }
}
