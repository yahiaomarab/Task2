import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/cubit/states.dart';

import '../Models/CategoriesModel.dart';
import '../Models/DcotorsModel.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit():super(IntialState());
  static AppCubit get(context)=>BlocProvider.of(context);
  double? ratingValue;
  List<CategoriesModel>Categories=
      [
        CategoriesModel(
          numsOfDoc: 20,
          image: 'assets/images/dentistcategory.png',
          specialist: 'Dental',
        ),
        CategoriesModel(
            numsOfDoc: 11,
            image: 'assets/images/eyesspecialist.png',
            specialist: 'Eyes'
        ),
        CategoriesModel(
          image:'assets/images/brainspecialist.png',
          numsOfDoc: 17,
          specialist: 'Brain',
        ),
        CategoriesModel(
          image:'assets/images/heartspecialist.png',
          numsOfDoc: 24,
          specialist: 'Heart',
        ),
      ];
  List<DoctorModel>Doctors=
      [
        DoctorModel(
          name:'Stella Kane' ,
          image:'assets/images/doc1.jpg' ,
          specialist: 'Heart Surgeon',
          rate:4.5 ,
          distance: 11.0,
        ),
        DoctorModel(
          name:'Fred Mask',
          image:'assets/images/doc2.jpg' ,
          specialist: 'Bone Specialist',
          rate:4.0 ,
          distance:3.2 ,
        ),
        DoctorModel(
          name:'Lara Mice' ,
          image:'assets/images/doc3.jpg' ,
          specialist: 'Eyes Specialis',
          rate: 3.5,
          distance: 3.2,
        ),
        DoctorModel(
          name: 'Zac Wolf',
          image: 'assets/images/doc4.jpg',
          specialist: 'Neurologist',
          rate:3.0,
          distance:4.4 ,
        ),
      ];

  List<dynamic>Appointment=
  [
    '5:30 PM',
    '6:00 PM',
    '6:30 PM',
    '7:00 PM',
    '7:30 PM',
    '8:00 PM',
    'Evening',
    '',
    '',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
  ];
  List<int>ChoosenIndex=
  [
    0,1,2,3,4,5,6,7,8,9,10,11,12,13,14
  ];

  String time='';
  int indexchoosen=-1;
  void ChangeIndexItemMorning(index)
  {
    indexchoosen=ChoosenIndex[index];
    time=Appointment[index];
    emit(ButtonSelectedChangedSuccessfully());
  }

  void
  changeRate(double rating)
      {
    ratingValue=rating;
    emit(RatingChangedSuccessfully());
  }
  int changeDate()
  {
    int months=DateTime.now().month;
    int days= DateTime.now().day;
     return months==DateTime.april
         ||months==DateTime.june
         ||months==DateTime.september
         ||months==DateTime.november? 31-days
         :months==DateTime.february?29-days
         :32-days;
  }

}
