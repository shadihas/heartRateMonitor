 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/Logic/cubit/datastorage_cubit.dart';
import 'package:graduation_project/presentation/widgets/widgets.dart';

GestureDetector SaveDataButton(BuildContext context, TextEditingController nameController, TextEditingController addressController, TextEditingController ageController) {
    return GestureDetector(
                onTap: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          actionsAlignment: MainAxisAlignment.spaceBetween,
                          content: Text('Do you want to save the data '),
                          actions: [
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: Column(
                                children: [
                                  Icon(Icons.cancel),
                                  Text('Cancel')
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () async =>
                                    BlocProvider.of<DatastorageCubit>(context)
                                        .saveInfo(
                                            nameController.text,
                                            addressController.text,
                                            ageController.text),
                                child: Column(
                                  children: [
                                    Icon(Icons.save),
                                    Text('save'),
                                  ],
                                )),
                          ],
                        );
                      });
                },
                child: SaveButton(text: 'save',));
                
  }


