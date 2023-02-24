import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:task2/Models/DcotorsModel.dart';
import 'package:task2/Screens/detealis_screen.dart';

import '../Models/CategoriesModel.dart';
import '../Thems&colors/Colors.dart';
import 'icons.dart';

Widget BuildCategoriesItem(context,CategoriesModel model)
{
  bool isLandScape=MediaQuery.of(context).orientation==Orientation.landscape;
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.only(
      top: deviceHeight*0.015,
    ),
    height:isLandScape?deviceHeight*0.3: deviceHeight*0.15,
    width:isLandScape?deviceWidth*0.2: deviceWidth*0.3,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: buttonColor,
    ),
    child: Column(
      children: [
        Image(
          image: AssetImage('${model.image}'),
          height:isLandScape?deviceHeight*0.07: deviceHeight*0.04,
          width: deviceWidth*0.05,
          color: whiteColor,
        ),
        SizedBox(height:isLandScape?deviceHeight*0.009: deviceHeight*0.007,),
        Text(
          '${model.specialist}',
          style: Theme.of(context).textTheme.headline3,
        ),
        SizedBox(height: deviceHeight*0.004,),
        Container(
          margin: EdgeInsets.symmetric(vertical:isLandScape?deviceWidth*0.0045: 0,
            horizontal: isLandScape?deviceWidth*0.03: 0
          ),
          padding: EdgeInsets.symmetric(vertical:isLandScape?deviceWidth*0.0045: deviceWidth*0.006,),
          height:isLandScape?deviceHeight*0.06: deviceHeight*0.03,
          width:isLandScape?deviceWidth*0.4: deviceWidth*0.22,
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(isLandScape?deviceHeight*0.05:deviceHeight*0.01)
          ),
          child: Text(
            '${model.numsOfDoc} Doctors',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
Widget BuildDoctorsItem(context,DoctorModel model)
{
  bool isLandScape=MediaQuery.of(context).orientation==Orientation.landscape;
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return  GestureDetector(
    onTap: ()
    {
      navigateTo(context, DetealisScreen(model));
    },
    child: Container(
      margin:  EdgeInsets.only(right:isLandScape?deviceWidth*0.07: deviceWidth*0.07),
      padding:  EdgeInsets.all( isLandScape?deviceHeight*0.009:deviceHeight*0.009),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5),
      ),
      height:isLandScape?deviceHeight*0.25: deviceHeight*0.1,
      width:isLandScape?deviceWidth*0.7: deviceWidth,
      child: Row(
        children: [
          Image(image: AssetImage('${model.image}'),height:isLandScape?deviceHeight*0.16: deviceHeight*0.08,
            width:deviceWidth*0.2,),
          SizedBox(width: deviceWidth*0.03,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. ${model.name} ',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(height: deviceHeight*0.012,),
              Row(
                children: [
                  Container(
                    width: deviceWidth*0.27,
                    child: Text(
                      '${model.specialist}',
                      style:Theme.of(context).textTheme.headline6 ,),
                  ),
                  SizedBox(width: deviceWidth*0.05,),
                  Icon(Icons.star,color: Colors.yellow,),
                  Container(
                    width: deviceWidth*0.06,
                    child: Text(
                      '${model.rate}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                  Icon(Icons.location_on,color: Colors.yellow,),
                  Container(
                    width: deviceWidth*0.1,
                    child: Text(
                      '${model.distance}Km',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}
Widget BuildNotifacitionIcon(context)
{
  double deviceHeight = MediaQuery.of(context).size.height;
  return Stack(
    alignment: AlignmentDirectional.topEnd,
    children: [
      Icon(IconBroken.Notification),
      Container(
        margin: EdgeInsets.only(top: deviceHeight*0.003,right: deviceHeight*0.003),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              radius: 4,
              backgroundColor: Colors.white,
            ),
            CircleAvatar(
              radius: 3,
              backgroundColor: Colors.lightGreenAccent,
            ),
          ],
        ),
      ),
    ],
  );
}
navigateTo(context,widget)
{
  Navigator.push(
    context,
    PageTransition(child: widget, type: PageTransitionType.fade,duration: Duration(milliseconds: 500),),
  );
}
Widget BuildButtonTime
    (
    context,
{
  required String label,
  required GestureTapCallback ontap,
  required Color textColor,
  required Color buttonSelcColor,
}
    )
{
  bool isLandScape=MediaQuery.of(context).orientation==Orientation.landscape;
  double deviceHeight = MediaQuery.of(context).size.height;
  double deviceWidth = MediaQuery.of(context).size.width;
  return GestureDetector(
    onTap: ontap,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: deviceWidth*0.022,
        vertical: deviceHeight*0.015,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: deviceWidth*0.02,
      ),
      height:deviceHeight*0.04,
      width:isLandScape?deviceWidth*0.15: deviceWidth*0.3,
      decoration: BoxDecoration(
        color: buttonSelcColor,
        borderRadius: BorderRadius.circular(deviceHeight*0.01),
      ),
      child: Row(
        children: [
          Icon(Icons.watch_later_outlined,color: textColor,),
          SizedBox(width: deviceWidth*0.02,),
          Text('${label}',style: TextStyle(
            fontFamily: 'QuickSand',
            fontSize:20,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),),
        ],
      ),
    ),
  );
}
Widget longButton(
    context,
    {
      required String label,
      required GestureTapCallback? onTap,
      required Color buttonColor,
      required Color textColor
    }
    )
{
  final isLandScpe=MediaQuery.of(context).orientation==Orientation.landscape;
  double deviceHeight=MediaQuery.of(context).size.height;
  double deviceWidth=MediaQuery.of(context).size.width;
  return GestureDetector(
    child: Container(
      alignment: Alignment.center,
      height:isLandScpe?deviceHeight*0.1: deviceHeight*0.07,
      width:isLandScpe?deviceWidth*0.4: deviceWidth*0.7,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(deviceWidth*0.009),
      ),
      child: Text(label,textAlign: TextAlign.center,style: TextStyle(
        fontSize: 20,
        color: textColor,

      ),),
    ),
    onTap: onTap,

  );
}
