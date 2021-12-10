import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding/components/slider_imges.dart';

class SliderShow extends StatefulWidget{
  @override
  State<SliderShow> createState() => _SliderShowState();
}

class _SliderShowState extends State<SliderShow> {
  final int  _numberpages=3;
  // strat pages number
  final PageController  _PageController=PageController(initialPage: 0);

  // strat slider iamges nmber
  int _currentPage=0;

  List <Widget> _buidPageIndicator(){

    List<Widget>list=[];
    for(int i=0;i<_numberpages;i++){
      list.add(i==_currentPage ? _indicator(true):_indicator(false));
    }
    return list;
  }
  Widget  _indicator(bool isActive){
    return AnimatedContainer(duration: Duration(microseconds: 150),
    margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 5.0,
      width: isActive ? 24.0: 16.0,
      decoration: BoxDecoration(color:isActive? Colors.white :Color(0xFF7B51D3),
      borderRadius: BorderRadius.all(Radius.circular(12))
      ),

    );
  }
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: AnnotatedRegion<SystemUiOverlayStyle>(
       value: SystemUiOverlayStyle.light,
       child: Container(
         decoration: BoxDecoration(
     
           gradient: LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             stops: [0.1,0.4,0.7,0.9],
              colors: [
                Color(0xFF3594DD),
                Color(0xFF4563DB),
                Color(0xFF5036D5),
                Color(0xFF5B16D0),
     
              ]
             
                    )
         ),
         child: Padding(
           padding: const EdgeInsets.symmetric(vertical:40.0),
           child: Column(crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Container(alignment: Alignment.centerRight,
             // ignore: deprecated_member_use
             child: FlatButton(onPressed: ()=>print('Skip'),
             child:Text('Skip',style: TextStyle(color: Colors.white,fontSize: 20.0),)
             ),
             ),
             Container(
               height: 500.0,
               child: PageView(
                 physics: ClampingScrollPhysics(),
                
                 controller: _PageController,
                 onPageChanged: (int page){
                   // ignore: invalid_use_of_protected_member
                   setState(() {
                     _currentPage=page;
                      
                      });
                 },

                 children: [
                   SliderImges(images:'onboarding0'),
                   SliderImges(images:'onboarding1'),
                   SliderImges(images:'onboarding2'),

               ],
               ),
               ),
             Row(mainAxisAlignment: MainAxisAlignment.center,children: _buidPageIndicator(),
             ),
             _currentPage !=_numberpages -1 ?
             Expanded(
                 child: Align(
                   alignment: FractionalOffset.bottomRight,
             
                 // ignore: deprecated_member_use, avoid_print
                 child: FlatButton(
                   // ignore: avoid_print
                   onPressed: () {
                     _PageController.nextPage(duration:Duration(microseconds: 500),
                         curve:Curves.ease);
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     mainAxisSize: MainAxisSize.min,
                     // ignore: prefer_const_literals_to_create_immutables
                     children: <Widget>[
                       const Text('Next',
                         style: TextStyle(
                           color: Colors.white,
                           fontSize: 22.0
                         ),
                       ),
                       // ignore: prefer_const_constructors
                       SizedBox(width: 10.0),
                       const Icon(Icons.arrow_forward,color: Colors.white,size: 30.0,)
                     ],
                   ),
                 ),
                 ),
             ):
                 Text(''),
           ],
           ),
         ),
       ),
     ),
         bottomSheet: _currentPage==_numberpages-1?
         Container(
       height: 50.0,width: double.infinity,color: Colors.white,
           child: GestureDetector(
             onTap: ()=>print('Get Stred'),
             child: Center(
               child: Padding(padding: EdgeInsets.only(bottom: 10.0),
               child: Text('Get Stred',style:
               TextStyle(color: Color(0xFF5B16D0),
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
               ),
             ),
             ),
           ),
   ):Text(''),
   );
  }
}
