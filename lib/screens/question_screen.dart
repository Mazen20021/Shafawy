import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shafawy/cubit/cubit-name.dart';
import 'package:shafawy/cubit/states.dart';
import 'package:shafawy/screens/main_screen.dart';
import '../constants/colors.dart';
import '../constants/screen.dart';

class QuestionScreen extends StatelessWidget
{
  final String subName;
  QuestionScreen({required this.subName,super.key});
  Random random = Random();
  int randomNumber = 0;
  @override
  Widget build(BuildContext context) {
    randomNumber = random.nextInt(3);
    return BlocConsumer<AppCubit,AppStates>(builder: (BuildContext context , states){
      AppCubit cubitParam = AppCubit.getCubit(context);
      ScreenSize screenSize = ScreenSize();
      cubitParam.startTimer();
      return Scaffold(
        backgroundColor: ConstColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ConstColors.iconColor,
          elevation: 10,
          title: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(cubitParam.time.toString(), style: const TextStyle(fontSize: 30)),
              const SizedBox(width: 10),
              const Text("الوقت المتبقي على انتهاء مدة السؤال" , style: TextStyle(fontSize: 30),)
            ],)),
        ),
        body: Center(child: Text(cubitParam.questions[randomNumber].toString(),style: TextStyle(color: ConstColors.iconColor,fontSize: 50),),),
      );
    }, listener: (BuildContext context , states){
      if(states is Finished && !AppCubit.getCubit(context).hasNavigated)
        {
          AppCubit.getCubit(context).hasNavigated = true;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              BlocProvider(create:(context)  => AppCubit(),child: MainScreen(subName: subName,))
          ));
        }
    });
  }

}