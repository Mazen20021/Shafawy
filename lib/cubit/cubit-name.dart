import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shafawy/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  bool hasNavigated = false;
  AppCubit() : super(InitAppStates());
  Timer? timer;
  int time = 60;
  String selectedSubject = "";
  List<String> questions = [
    "ما هي الوراثة",
    "كم عدد الباثنجان",
    "ما هو السؤال",
  ];
  void setSubject(String subject) {
    selectedSubject = subject;
    emit(ChangeSubject());
  }
  void returnBack()
  {
    emit(ReturnScreen());
  }
  static AppCubit getCubit(BuildContext context) {
    return BlocProvider.of(context);
  }

  void startExam() {
    emit(StartExam());
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (time <= 0) {
        timer.cancel();
        this.timer = null;
        emit(Finished());
      } else if (time > 0) {
        time--;
        emit(DecreaseTimer());
      }
    });
  }

  void resetExam() {
    hasNavigated = false;
  }
}
