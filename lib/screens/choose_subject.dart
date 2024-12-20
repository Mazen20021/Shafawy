import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shafawy/constants/screen.dart';
import 'package:shafawy/cubit/cubit-name.dart';
import 'package:shafawy/cubit/states.dart';
import 'package:shafawy/screens/main_screen.dart';
import '../constants/colors.dart';

class ChooseSubject extends StatelessWidget
{
  ChooseSubject({super.key});
  String subName = "";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(builder: (BuildContext context , states){
      AppCubit cubitParam = AppCubit.getCubit(context);
      ScreenSize screenSize = ScreenSize();
      return Scaffold(
          backgroundColor: ConstColors.background,
          body: Center(
              child: Column(mainAxisAlignment:
              MainAxisAlignment.center,
                children: [
                  Transform.translate(offset: const Offset(0, -250) ,
                    child: Icon(Icons.menu_book_sharp,color: ConstColors.iconColor,size: 220,shadows: const [Shadow(color: Colors.black,blurRadius: 25,offset: Offset(3, 2))],),
                  ),
                  Transform.translate(offset: const Offset(0, -225) ,
                    child:
                    Text("إختر المادة العلمية" , style: TextStyle(fontSize: 50,color: ConstColors.iconColor,fontWeight: FontWeight.bold),),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: (){
                      cubitParam.setSubject("أسسيات الوراثة");
                      subName = AppCubit.getCubit(context).selectedSubject;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 30,offset: Offset(0, 10))],
                          color: ConstColors.iconColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      width: 550,
                      height: 100,
                      child: const Center(child: Text("أسسيات الوراثة",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),),
                    ),),
                  const SizedBox(height: 50),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: (){
                      cubitParam.setSubject("وراثة كيماوية حيوية");
                      subName = AppCubit.getCubit(context).selectedSubject;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(color: Colors.black,blurRadius: 30,offset: Offset(0, 10))],
                          color: ConstColors.iconColor,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      width: 550,
                      height: 100,
                      child: const Center(child: Text("وراثة كيماوية حيوية",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),),
                    ),),
                  Transform.translate(offset:const Offset(0, 300) ,child:   Text("© 2025 Prof.DR: Ahmed Mansour Rights Reserved V1.0.0",style: TextStyle(color: ConstColors.iconColor,fontSize: 15),))
                ],)
          ));
    }, listener: (BuildContext context , states){
      if (states is ChangeSubject) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) => AppCubit(),
              child: MainScreen(subName: subName),
            ),
          ),
        );
      }
    });
  }

}