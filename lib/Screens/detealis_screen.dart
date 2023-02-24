import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:task2/Thems&colors/Colors.dart';
import 'package:task2/cubit/Cubit.dart';
import 'package:task2/Models/DcotorsModel.dart';
import 'package:task2/Screens/HomePage.dart';
import 'package:task2/arc/icons.dart';
import 'package:task2/cubit/states.dart';

import '../arc/Widgets.dart';

class DetealisScreen extends StatelessWidget
{
  DoctorModel _model;
  DetealisScreen(this._model);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    bool isLandScape=MediaQuery.of(context).orientation==Orientation.landscape;
    return BlocProvider(
      create: (context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          AppCubit cubit=AppCubit.get(context);
           cubit.ratingValue = _model.rate;
          return Scaffold(
            body:Container(
              height: deviceHeight,
              width: deviceWidth,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom:isLandScape?deviceHeight*0.05: deviceHeight*0.02),
                          padding: EdgeInsets.symmetric(
                           // vertical: deviceHeight*0.005,
                            horizontal: deviceWidth*0.02,
                          ),
                          height:isLandScape?deviceHeight*0.55: deviceHeight*0.3,
                          decoration: BoxDecoration(
                            color: topBarColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft:Radius.circular(deviceHeight*0.03) ,
                              bottomRight:Radius.circular(deviceHeight*0.03),
                            ),

                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: (){
                                      navigateTo(context, HomePage());
                                    },
                                    icon: Icon(IconBroken.Arrow___Left),
                                  ),
                                  Spacer(),
                                  BuildNotifacitionIcon(context),
                                ],
                              ),
                              SizedBox(height: deviceHeight*0.02,),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    height:isLandScape?deviceHeight*0.35: deviceHeight*0.18,
                                    width: deviceWidth*0.3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(deviceHeight*0.01)
                                    ),
                                    child: Image(
                                      fit: isLandScape?BoxFit.fill:BoxFit.cover,
                                      image: AssetImage('${_model.image}'),
                                    ),
                                  ),
                                  SizedBox(width: deviceWidth*0.04,),
                                  Container(
                                    padding: EdgeInsets.only(top: deviceHeight*0.025),
                                    height:isLandScape?deviceHeight*0.35: deviceHeight*0.18,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Dr. ${_model.name} ',
                                          style: Theme.of(context).textTheme.subtitle2,
                                        ),
                                        SizedBox(height: deviceHeight*0.012,),
                                        Text(
                                            '${_model.specialist}',
                                            style:Theme.of(context).textTheme.headlineMedium ,),

                                        SizedBox(height:isLandScape?deviceHeight*0.04: deviceHeight*0.012,),
                                        Container(
                                          height:isLandScape?deviceHeight*0.09: deviceHeight*0.045,
                                          width: deviceWidth*0.5,
                                          child:RatingBar(
                                              initialRating:cubit.ratingValue==null? _model.rate!:cubit.ratingValue!,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ratingWidget: RatingWidget(
                                                  full:  Icon(
                                                    Icons.star,
                                                    color: Colors.yellow,
                                                    size: 15,
                                                  ),
                                                  half:  Icon(
                                                    Icons.star_half,
                                                    color: Colors.yellow,
                                                    size: 15,
                                                  ),
                                                  empty:  Icon(
                                                    Icons.star_outline,
                                                    color: Colors.yellow,
                                                    size: 15,
                                                  )),
                                              onRatingUpdate: (value) {
                                                 cubit.changeRate(value);
                                                 print(_model.rate);
                                              }),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: deviceWidth*0.08),
                          height:isLandScape?deviceHeight*0.12: deviceHeight*0.06,
                          width:isLandScape?deviceWidth*0.055: deviceWidth*0.11,
                          decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(deviceHeight*0.005)
                          ),
                          child: Icon(
                            Icons.location_on,
                            color: Colors.yellow,
                            size:isLandScape?deviceHeight*0.08: deviceHeight*0.04,
                          ),
                        ),
                      ],
                    ),
                      SizedBox(
                      height: deviceHeight*0.008,
                    ),
                      Padding(
                        padding:  EdgeInsets.symmetric(
                          horizontal: deviceWidth*0.04,
                        ),
                        child: Text(DateFormat.yMMM().format(DateTime.now()),),
                      ),
                      SizedBox(
                      height:isLandScape?deviceHeight*0.04: deviceHeight*0.01,
                    ),
                      Padding(
                      padding:  EdgeInsets.only(
                        left: deviceWidth*0.04,
                      ),
                      child: DatePicker(
                        DateTime.now(),
                        daysCount:cubit.changeDate(),
                        selectedTextColor: Colors.white,
                        width:isLandScape?deviceWidth*0.08: deviceWidth*0.16,
                        height:isLandScape?deviceHeight*0.25: deviceHeight*0.1,
                        selectionColor: buttonColor,

                        deactivatedColor:Colors.white,
                      ),
                    ),
                      SizedBox(
                      height: deviceHeight*0.013,
                    ),
                      Padding(
                      padding:  EdgeInsets.only(
                        left: deviceWidth*0.04,
                        right: deviceWidth*0.04,
                        bottom:isLandScape?0: deviceHeight*0.001
                      ),
                      child: Text('Morning',),
                    ),
                      Container(
                      height:isLandScape?deviceHeight*0.5: deviceHeight*0.385,
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        crossAxisCount: 3,
                        mainAxisSpacing:isLandScape?2: 0,
                        crossAxisSpacing:isLandScape?20: 0,
                        childAspectRatio:isLandScape?34/6.5: 15 / 7.5,
                        children:
                        List.generate(
                          cubit.ChoosenIndex.length, (index) =>
                          index==6?
                             Container(
                                             padding:  EdgeInsets.only(
                                               right: deviceWidth*0.04,
                                               left: deviceWidth*0.04,
                                               top: deviceHeight*0.047
                                             ),
                                             width: deviceWidth,
                                             child: Text('Evening',),
                                           ):index==7||index==8?Container():
                          BuildButtonTime(
                                 context,
                                 label:cubit.Appointment[index],
                                 ontap:(){
                                   cubit.ChangeIndexItemMorning(index);
                                 },
                                 textColor: cubit.indexchoosen==cubit.ChoosenIndex[index]?whiteColor:Colors.grey[500]!,
                                 buttonSelcColor: cubit.indexchoosen==cubit.ChoosenIndex[index]?buttonColor:whiteColor,
                             ),
                        ),
                      ),
                    ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: deviceHeight*0.009,
                          horizontal: deviceWidth*0.15,
                        ),
                        margin: EdgeInsets.symmetric(
                          vertical:isLandScape? deviceHeight*0.009:0,
                          horizontal: isLandScape? deviceWidth*0.2:0,
                        ),
                        child: longButton(
                            context,
                            label: 'Make An Appointment',
                            onTap: (){},
                            buttonColor: buttonColor,
                            textColor: whiteColor
                        ),
                      ),
                  ],
                ),
              ),
            ) ,
          );
        },

      ),
    );
  }

}