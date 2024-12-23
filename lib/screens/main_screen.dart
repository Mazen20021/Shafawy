import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shafawy/constants/sizes.dart';
import 'package:shafawy/cubit/cubit-name.dart';
import 'package:shafawy/cubit/states.dart';
import 'package:shafawy/screens/choose_subject.dart';
import 'package:shafawy/screens/question_screen.dart';
import '../constants/colors.dart';
import '../constants/locations.dart';
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
          title:
            Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.translate(offset:  Offset(-screenSize.getSize(context).width * 0.04, 0),child: IconButton(onPressed: (){
                cubitParam.returnBack();
              }, icon: const Icon(Icons.arrow_back_ios_outlined))),
              Text(" نموذج إختبار الشفوي لمادة : $subName " , style:  TextStyle(fontSize: screenSize.getSize(context).width * 0.048),)
            ],)),
        ),
        body: OrientationBuilder (builder: (context, orientation) {
          final isPortrait = orientation == Orientation.portrait;
          return Center(
          child: Column(mainAxisAlignment:
          MainAxisAlignment.center,
            children: [
              Transform.translate(offset:  Offset(0, !isPortrait ? 10: ConstantLocations().getIconLocation(context)) ,
                child: Icon(Icons.quiz_rounded,color: ConstColors.iconColor,size: !isPortrait? 100 : ConstantSizes().getIconSize(context),shadows: const [Shadow(color: Colors.black,blurRadius: 25,offset: Offset(3, 2))],),
              ),
          Transform.translate(offset:  Offset(0,!isPortrait? 0 : ConstantLocations().getTextLocation(context)) ,
              child:
              Text("إستعن بالله و توكل عليه" , style: TextStyle(fontSize: !isPortrait? 30 :ConstantSizes().getTextSize(context),color: ConstColors.iconColor,fontWeight: FontWeight.bold),),
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
                width:!isPortrait? 650 : ConstantSizes().getButtonWidth(context),
                height:!isPortrait? 70 : ConstantSizes().getButtonHeight(context),
                child:  Center(child: Text("بدء الإختبار",style: TextStyle(fontSize:!isPortrait? 40 : ConstantSizes().getButtonLabelSize(context),fontWeight: FontWeight.bold),),),
              ),),
              Transform.translate(offset: Offset(0, !isPortrait? 13 : ConstantLocations().getCopyRightsLocation(context)) ,child:   Text("© 2025 Prof.DR: Ahmed Mansour Rights Reserved V1.0.0",style: TextStyle(color: ConstColors.iconColor,fontSize:!isPortrait? 25 : ConstantSizes().getCopyRightsSize(context)),))

          ],)

      );}));
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