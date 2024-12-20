import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shafawy/cubit/cubit-name.dart';
import 'package:shafawy/screens/choose_subject.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (context) => AppCubit()
      ,child:  ChooseSubject(),
      )
    );
  }
}

