 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Logic/cubit/connectivity_cubit.dart';
import 'package:graduation_project/core/colors/appColors.dart';
import 'widgets.dart';

Container MyAppBar() {
    return Container(
                        child: Stack(
                      children: [
                        Container(
                          child: ClipPath(
                            clipper: WaveClipper(),
                            child: Container(
                              color: AppColors.lightColor,
                              height: 160,
                            ),
                          ),
                        ),
                        Container(
                          child: ClipPath(
                            clipper: WaveClipper(),
                            child: Container(
                              alignment: Alignment.center,
                              child: BlocBuilder<ConnectivityCubit,
                                  ConnectivityState>(
                                builder: (context, state) {
                                  if (state is ConnectivityConnected) {
                                    return Text(
                                      'Monitor is connected',
                                      style: TextStyle(
                                          color: AppColors.lightColor,
                                          fontSize: 25),
                                    );
                                  } else {
                                    return Text(
                                      'Monitor is not connected',
                                      style: TextStyle(
                                          color: AppColors.lightColor,
                                          fontSize: 25),
                                    );
                                  }
                                },
                              ),
                              color: AppColors.darkColor,
                              height: 140,
                            ),
                          ),
                        )
                      ],
                    ));
  }

