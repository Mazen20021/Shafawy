import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shafawy/cubit/cubit-name.dart';
import 'package:shafawy/cubit/states.dart';
import 'package:shafawy/screens/choose_subject.dart';
import 'package:shafawy/screens/question_screen.dart';
import '../constants/colors.dart';
import '../constants/screen.dart';

class MainScreen extends StatelessWidget
{
  final String subName;
  const MainScreen({required this.subName ,super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(builder: (BuildContext context , states){
      AppCubit cubitParam = AppCubit.getCubit(context);
      ScreenSize screenSize = ScreenSize();
      return Scaffold(
        backgroundColor: ConstColors.background,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ConstColors.iconColor,
          elevation: 10,
          title: Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(offset: const Offset(-120, 0),child: IconButton(onPressed: (){
                cubitParam.returnBack();
              }, icon: const Icon(Icons.arrow_back_ios_outlined))),
              Text(" نموذج إختبار الشفوي لمادة : $subName " , style: const TextStyle(fontSize: 30),)
            ],)),
        ),
        body: Center(
          child: Column(mainAxisAlignment:
          MainAxisAlignment.center,
            children: [
              Transform.translate(offset: const Offset(0, -250) ,
                child: Icon(Icons.quiz_rounded,color: ConstColors.iconColor,size: 220,shadows: const [Shadow(color: Colors.black,blurRadius: 25,offset: Offset(3, 2))],),
              ),
          Transform.translate(offset: const Offset(0, -225) ,
              child:
              Text("إستعن بالله و توكل عليه" , style: TextStyle(fontSize: 50,color: ConstColors.iconColor,fontWeight: FontWeight.bold),),
          ),
            InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: (){
                cubitParam.startExam();
              },
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 30,offset: Offset(0, 10))],
                    color: ConstColors.iconColor,
                    borderRadius: BorderRadius.circular(20)
                ),
                width: 550,
                height: 100,
                child: const Center(child: Text("بدء الإختبار",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),),
              ),),
              Transform.translate(offset:const Offset(0, 300) ,child:   Text("© 2025 Prof.DR: Ahmed Mansour Rights Reserved V1.0.0",style: TextStyle(color: ConstColors.iconColor,fontSize: 15),))

          ],)

      ));
    }, listener: (BuildContext context , states){
      if(states is StartExam && states is! ReturnScreen)
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
          BlocProvider(create:(context)  => AppCubit(),child:  QuestionScreen(subName: subName))
          ));
        }else if(states is ReturnScreen){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>
              BlocProvider(create:(context)  => AppCubit(),child:  ChooseSubject())
        ));
      }
    });
  }

}