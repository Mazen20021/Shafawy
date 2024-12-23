import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shafawy/constants/locations.dart';
import 'package:shafawy/constants/sizes.dart';
import 'package:shafawy/cubit/cubit-name.dart';
import 'package:shafawy/cubit/states.dart';
import 'package:shafawy/screens/main_screen.dart';
import '../constants/colors.dart';

class ChooseSubject extends StatelessWidget {
  ChooseSubject({super.key});
  String subName = "";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      builder: (BuildContext context, states) {
        AppCubit cubitParam = AppCubit.getCubit(context);

        return Scaffold(
          backgroundColor: ConstColors.background,
          body: OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = orientation == Orientation.portrait;
              final screenWidth = MediaQuery.of(context).size.width;
              final screenHeight = MediaQuery.of(context).size.height;

              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Transform.translate(
                      offset:  Offset(0, !isPortrait? 10 :ConstantLocations().getIconLocation(context)),
                      child: Icon(
                        Icons.menu_book_sharp,
                        color: ConstColors.iconColor,
                        size: !isPortrait? 150 : screenWidth * 0.35,
                        shadows: const [
                          Shadow(color: Colors.black, blurRadius: 25, offset: Offset(3, 2)),
                        ],
                      ),
                    ),
                    Transform.translate(
                      offset: Offset(0, !isPortrait? -10 :ConstantLocations().getTextLocation(context)),
                      child: Text(
                        "إختر المادة العلمية",
                        style: TextStyle(
                          fontSize: !isPortrait? 35 :ConstantSizes().getTextSize(context),
                          color: ConstColors.iconColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    buildSubjectButton(
                      context,
                      "أسسيات الوراثة",
                      cubitParam,
                      (!isPortrait? 650 : screenWidth),
                      (!isPortrait? 600 : screenHeight),
                    ),
                    const SizedBox(height: 20),
                    buildSubjectButton(
                      context,
                      "وراثة كيماوية حيوية",
                      cubitParam,
                      (!isPortrait? 650 : screenWidth),
                      (!isPortrait? 600 : screenHeight),
                    ),
                    Transform.translate(
                      offset: Offset(0,!isPortrait? 13 : ConstantLocations().getCopyRightsLocation(context)),
                      child: Text(
                        "© 2025 Prof.DR: Ahmed Mansour Rights Reserved V1.0.0",
                        style: TextStyle(
                          color: ConstColors.iconColor,
                          fontSize:!isPortrait? 25 : ConstantSizes().getCopyRightsSize(context),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
      listener: (BuildContext context, states) {
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
      },
    );
  }

  Widget buildSubjectButton(
      BuildContext context,
      String subjectName,
      AppCubit cubit,
      double screenWidth,
      double screenHeight,
      ) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        cubit.setSubject(subjectName);
        subName = AppCubit.getCubit(context).selectedSubject;
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black, blurRadius: 30, offset: Offset(0, 10)),
          ],
          color: ConstColors.iconColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: screenWidth * 0.8, // Adjust width dynamically
        height: screenHeight * 0.08, // Adjust height dynamically
        child: Center(
          child: Text(
            subjectName,
            style: TextStyle(
              fontSize: screenWidth * 0.05, // Adjust text size dynamically
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
