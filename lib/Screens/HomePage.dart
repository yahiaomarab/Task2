import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task2/Thems&colors/Colors.dart';
import 'package:task2/arc/icons.dart';
import 'package:task2/cubit/states.dart';

import '../cubit/Cubit.dart';
import '../arc/Widgets.dart';

class HomePage extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    bool isLandScape=MediaQuery.of(context).orientation==Orientation.landscape;

    return  BlocProvider(
      create: ( context)=>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          AppCubit cubit =AppCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                height: deviceHeight,
                width: deviceWidth,
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Container(
                      height: deviceHeight*0.18,
                      width: deviceWidth,
                      color: topBarColor,
                      padding: EdgeInsets.only(
                        top:deviceHeight*0.03,
                        bottom:deviceHeight*0.08,
                        right: deviceWidth*0.04,
                        left:deviceWidth*0.04,
                      ),
                      child: Container(
                        height: deviceHeight*0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.filter_list_rounded),
                            SizedBox(width:deviceWidth*0.7),
                            BuildNotifacitionIcon(context),
                            SizedBox(width:deviceWidth*0.03),
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              height:isLandScape?deviceHeight*0.07: deviceHeight*0.03,
                              width:isLandScape?deviceWidth*0.05: deviceWidth*0.07,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/images/R (2).jpg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                     Container(
                       margin: EdgeInsets.only(top: deviceHeight*0.1109),
                       padding: EdgeInsets.only(left: deviceWidth*0.06,top: deviceHeight*0.035),
                       height: deviceHeight*0.9,
                       width: deviceWidth,
                       decoration: BoxDecoration(
                         color: scaffoldColor,
                         borderRadius: BorderRadius.only(
                           topLeft: Radius.circular(25),
                           topRight: Radius.circular(25),
                         ),
                       ),
                       child: SingleChildScrollView(
                         physics: BouncingScrollPhysics(),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Text('Hi, Yahia',style: Theme.of(context).textTheme.headline1,),
                             SizedBox(height: deviceHeight*0.008,),
                             Text('Welcome Back',style: Theme.of(context).textTheme.bodyText1,),
                             SizedBox(height: deviceHeight*0.04,),
                             Stack(
                               alignment: AlignmentDirectional.topEnd,
                               children: [
                                 Container(
                                   padding: EdgeInsets.only(right: deviceWidth*0.07),
                                   height:isLandScape?deviceHeight*0.1: deviceHeight*0.055,
                                   width: deviceWidth*0.88,
                                   color: whiteColor,
                                   child: TextFormField(
                                     decoration: InputDecoration(
                                       label: Text('search...'),
                                       labelStyle: Theme.of(context).textTheme.caption,
                                       border:OutlineInputBorder(
                                         borderSide: BorderSide.none,
                                       ) ,
                                     ),
                                   ),
                                 ),
                                 Container(
                                   height:isLandScape?deviceHeight*0.1: deviceHeight*0.055,
                                   width: deviceWidth*0.12,
                                   child:Icon(IconBroken.Search) ,
                                   decoration: BoxDecoration(
                                       color: buttonColor,
                                       borderRadius: BorderRadius.circular(deviceHeight*0.009)
                                   ),
                                 ),
                               ],
                             ),
                             SizedBox(height: deviceHeight*0.04,),
                             Row(
                               children: [
                                 Text('Category',style: Theme.of(context).textTheme.bodyText2),
                                 Spacer(),
                                 Padding(
                                   padding:  EdgeInsets.only(right: deviceWidth*0.07),
                                   child: Text('See All',style: Theme.of(context).textTheme.headline2),
                                 ),
                               ],
                             ),
                             SizedBox(height: deviceHeight*0.02,),
                             Container(
                               height:isLandScape?deviceHeight*0.3: deviceHeight*0.15,
                               child: ListView.separated(
                                 physics: BouncingScrollPhysics(),
                                 scrollDirection: Axis.horizontal,
                                   itemBuilder:(context,index)=> BuildCategoriesItem(context,cubit.Categories[index]),
                                   separatorBuilder:(context,index)=> SizedBox(width:deviceWidth*0.06,),
                                   itemCount: cubit.Categories.length,
                               ),
                             ),
                             SizedBox(height:isLandScape?deviceHeight*0.02: deviceHeight*0.04,),
                             Row(
                               children: [
                                 Text('Top Rate',style: Theme.of(context).textTheme.bodyText2),
                                 Spacer(),
                                 Padding(
                                   padding:  EdgeInsets.only(right: deviceWidth*0.07),
                                   child: Text('See All',style: Theme.of(context).textTheme.headline2),
                                 ),
                               ],
                             ),
                             SizedBox(height:isLandScape?deviceHeight*0.01:deviceHeight*0.02,),
                             Container(
                              height:isLandScape?deviceHeight*0.8: deviceHeight*0.35,
                               width: isLandScape?deviceWidth*0.85:deviceWidth,
                               child: ListView.separated(
                                 physics: BouncingScrollPhysics(),
                                  itemBuilder: (context,index)=>BuildDoctorsItem(context,cubit.Doctors[index]),
                                  separatorBuilder: (context,index)=>SizedBox(height: isLandScape?deviceHeight*0.05: deviceHeight*0.02,),
                                   itemCount: cubit.Doctors.length
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}