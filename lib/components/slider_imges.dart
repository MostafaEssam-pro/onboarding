import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 class SliderImges extends StatelessWidget{

   // ignore: non_constant_identifier_names
   late final String images;
   SliderImges({Key? key,required this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {

   return Expanded(child: 
                   Padding(
                     padding:  EdgeInsets.all(40.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.stretch,
                       children:  [
                         Center(
                           child: Image.asset('assets/images/$images.png',
                           height: 300.0,
                           width: 300.0,),

                               ),
                               SizedBox(height: 30.0,),
                               Text('Connect People aroued The Wold',
                                 style: TextStyle(
                                     fontWeight: FontWeight.bold,
                                     color: Colors.white,
                                 fontSize: 20)
                                 ),
                               SizedBox(height:15.5,),
                               Text('Lorem Ispism Sit Amet , Consect',
                                   style: TextStyle(
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white,
                                       fontSize: 15)
                               )
                       ],
                       
                     ),
                   ),
   );
  }
 


 }
  
  

