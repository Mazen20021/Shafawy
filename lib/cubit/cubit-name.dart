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
    "للإنزيم ............. دور رئيسي في تحويل مناطق heterochromatin الى مناطق euchromatin في الـ DNA",
    "يقع التتابع العازل في الجين بين ....................... حتى يقوم بدورة التنظيمي",
    "لكي يتم إدخال tRNA المحمل بالحمض الاميني في الموضع A في الريبوسوم من خلال إرتباطه بالعامل .................",
    "إنزيم لحام قطع أوكازاكي هو ؟",
    "يبدأ ترقيم الحزم عند صبغ الكروموسومات من ؟",
    "تحتوي تحت الوحدة الكبيرة 60S للريبوسوم على ................",
    "دور العامل RF-1 ..................",
    "الحزمة p21 توجد في ؟",
    "يتم إنتاج البروتين المعيق في نظام أوبيرون اللاكتوز من الجين..............",
    "في نموذج واتسون – كريك يوجد ........ في كل لفة",
    "يعمل إنزيم telomerase على ؟",
    "يعتبر DNA هو المادة الوراثية في .......................",
    "تعني خاصية Degeneracy أن ؟",
    "الشفرة الوراثية شفرة ؟",
    "في التفريد الكهربي لجزيئات المادة الوراثية تكون ؟",
    "تلعب المناطق الغنية بزوج القواعد (AU) في mRNA دور رئيسي في ................",
    "في حقيقيات النواة هناك ؟",
    "يقوم بروتين ............ بكسر mRNA بغرض هدمه عند عدم الحاجة اليه",
    "جزيء RNA يكون ؟",
    "تعتبر منطقة 3’ UTR في mRNA منطقة هامة لـ ........... في حقيقيات النواة",
    "في نفس الجينوم إذا كانت شفرة محددة تعطي البرولين فإن نفس الشفرة في نفس الجينوم",
    "تعمل طفرة Oc على ............... نظام أوبيرون اللاكتوز",
    "تعتبر ظاهرة polysome شكل مميز يظهر في ...............",
    "تنتج المناطق المغلقة (الغير نشطة) في الكروماتين بسبب  ................",
    "يعتبر اوبيرون التربتوفان من النوع .................",
    "تؤدي طفرات  تغير  الإطار frameshift إلى تغيير ؟",
    "يكون التحكم في أوبيرون اللاكتوز م من النوع ......................",
    "يوجد تتابع Shine-Dalgarno في منطقة ................... ",
    "إنزيم بناء المادة الوراثية هو ؟",
    "يعتبر RNA هو المادة الوراثية في .......................",
    "مكان وجود  البروتينات في الخلية ؟",
    "يعتبر DNA هو المادة الوراثية في .......................",
    "في فقاعة التناسخ الواحدة هناك ؟",
    "وجود نسبة عالية من مركب cAMP في الخلية يحفز من .................... ",
    "............. يعتبر هو مصدر تكوين mRNA في خلايا حقيقيات النواة",
    "على مستوى الكروموسوم ككل يمكن القول أن هناك ؟",
    "أول حمض أميني يتم إضافته للسلسلة الببتيدية أثناء عملية الترجمة هو .................",
    "تتكون الـ 5’ cap في mRNA من القاعدة ...............",
    "مكان وجود RNA pol I في ................ داخل الخلية.",
    "تعتبر عملية ............. للـ DNA أحد الوسائل التي يستخدمها نظام siRNA في إخماد mRNA",
    "كمية البروتينات في الجاميطات ....... كميتها في الخلايا الجسمية",
    "دور تحت الوحدة b’ في إنزيم النسخ هو ................",
    "تحتوي منطقة التنظيم السفلى على الطرف 3’ في الجين على معلومات تخص ...........",
    "تعرف القاعدة ........... على أنها تحوير للقواعد التي يمكن ان تشترك في تكوين tRNA.",
    "يمكن ترجمة خيط mRNA من أي جين في نواة خلايا الإنسان داخل ؟",
    "من الأدلة المباشرة أن الحمض النووي DNA  هو المادة الوراثية ؟",
    "يعرف مصطلح لاريت (lariat) على أنه تركيب حلقي يتنج من إرتباط ............ في الانترون ؟",
    "يلعب الربوتين يوبكويتين (Ubiquitin) دور مباشر في .............. ",
    "تتكون النيوكليوسيدة من ؟",
    "تعد أحد طرق تثبيط نشاط الجين و التي لا توجد في حقيقيات النواة ؟",
    "للعامل سيجما الدور الرئيسي في .......................... ",
    "يعمل إنزيم RNA pol III على بناء .....................",
    "لوجود تتابع Rut في mRNA البكتريا أهمية كبيرة في .................",
    "............... هي عملية تجرى خلال إنتاج الـ tRNA في الخلية.",
    "وجود سكر الجلوكوز يجعل تشفير الجينات التركيبة لأبيرون اللاكتوز في ..................",
    "......... هو المسؤول عن ربط الأحماض الامينية مع بعضها بروابط ببتيدية أثناء عملية الترجمة.",
    "يتكون octamer من ؟",
    "من خصائص المادة الوراثية ؟",
    "تجارب فك الشفرة الوراثية استخدمت في البداية خيط mRNA ؟",
    "إنزيم بناء البادئ هو ؟",
    "عند تسخين جزيئين مختلفين أ و ب من DNA معا ثم تبريد المحلول تتكون ؟",
    "ترتبط بروتينات SSB بخيوط المادة الوراثية ؟",
    "الشفرة الوراثية ؟",
    "تتكون النيوكليوتيدة من ؟",
    "يلعب الذراع ............ في الـ tRNA الدور الرئيسي في التعرف على الشفرة في mRNA.",
    "“Ribozyme” هو عبارة عن ...................",
    "حجم جينوم الإنسان أكثر من 3 مليار قاعدة في ؟",
    "لبناء DNA ؟",
    "يتوقع أن يكون أقل عدد من أنواع tRNA التي يمكن أن توجد في الخلية هو ............... ",
    "للبروتينات (PABPs) دور اساسي في ..................",
    "يعمل إنزيم telomerase جيدا في ؟",
    "جزيء DNA يكون ؟",
    "يتكون النيوكليوسوم من ؟",
    "يعتبر الذراع ............... في الـ tRNA هو المسؤول عن الإرتباط مع الريبوسوم",
    "يوجد تنظيم التعبير الجيني على مستوى ما بعد عملية النسخ في ..................",
    "شفرات الإيقاف في جينوم نواة خلايا الإنسان ؟",
    "الهستونات شحنتها ؟",
    "مكان وجود  الحمض النووي في الخلية ؟",
    "في شوكة التناسخ الواحدة: تتكون قطع أوكازاكي على ؟",
    "لكي يتم إزالة الإنترون من RNA لابد من وجود القاعدة ............. على بعد 18 – 40 قاعدة جهة الطرف 3’. ؟",
    "عند تسخين جزيء DNA مع جزيء RNA الناتج عنه معا ثم تبريد المحلول تتكون  ؟",
    "في الطرد المركزي لجزيئات المادة الوراثية تكون ؟",
    "يحتوي octamer على  ؟",
    "اعتمدت تجارب فك الشفرة الوراثية على ؟",
    "نوع العلاقة بين بروتين CAP و بروتين Lac I ,,,,,,,,,,,,,,,,,,,,,",
    "يعتبر الجين I + سائد على ....................",
    "يعمل بروتين rho على ...................",
    "تعتبر الثلاثية ............. حتمية الوجود على الطرف 3’ في الـ tRNA",
    "تتم إستطالة السلسلة الببتيدية أثناء عملية الترجمة على tRNA الموجود في ..........",
    "لبناء RNA ؟",
    "جزيء mRNA يكون ؟",
    "يحدث تنشيط لعمليتي النسخ و الترجمة لـ mRNA الخاص بأوبيرون التربتوفان إذا ........",
    "تعتبر منطقة  التنظيم الموجودة في الطرف 5’ في الجين منطقة هامة لـ ........... في أوليات النواة",
    "إنزيم ............... هو المسؤول عن تحويل جزيئات اللاكتوز الى المشابه اللولاكتوز.",
    "جزيء DNA يكون ؟",
    "في فقاعة التناسخ الواحدة: تتكون قطع أوكازاكي على ؟",
    "نوع الروابط المتكونة بين الأحماض الأمينية في التركيب الاولي للبروتين هى .......................",
    "كمية الحمض النووي في الجاميطات ....... كميتها في الخلايا الجسمية ؟",
    "تتميز الشفرة الوراثية بأنها ؟",
    "تحتاج الخلية الى ................ كمركب عالي الطاقة لإستطالة عملية الترجمة. ؟",

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
