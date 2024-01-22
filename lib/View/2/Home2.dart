
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_star/star.dart';
import 'package:flutter_star/star_score.dart';
import 'package:url_launcher/url_launcher.dart';


class Home2 extends StatefulWidget {

  String Brand_id;
  final dynamic selectedItem;
   Home2({super.key,
    required this.Brand_id,
     required this.selectedItem,
  });

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  List items = [];
  int isSelected=0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assists/dummy_details.json");
    final data = json.decode(response);
    setState(() {
      items = List.from(data);
    });
  }


  @override
  void initState() {
    super.initState();
    readJson();

  }


  @override
  Widget build(BuildContext context) {


    double appRating;
    if (widget.selectedItem['custom_data']['app_rating'] != '') {
      appRating = double.parse(widget.selectedItem['custom_data']['app_rating']);
    } else {
      appRating = 0.0; // Set a default value if 'app_rating' is empty
    }

    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xf4fffcf6),
      appBar: AppBar(backgroundColor: Colors.white,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             height: size.height*0.3,
             width: size.width,
             child: Stack(
               children: [
                 Container(
                   height: size.height*0.25,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    image: DecorationImage(
                      image: NetworkImage(widget.selectedItem['custom_data']['wall_url']),fit: BoxFit.fill
                    ),
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15)
                    ),
                  ),
                 ),
                  Container(
                    margin: EdgeInsets.only(left: size.width*0.02),
                    alignment: Alignment.bottomLeft,
                    child: CircleAvatar(
                     radius: size.height*0.05,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(widget.selectedItem['brand']['logo']),
                        radius: 37,
                      ),
                                     ),
                  )

               ],
             ),
           ),

           Container(
            margin: EdgeInsets.only(left: size.width*0.03,top: size.height*0.01,
            right: size.width*0.02),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(widget.selectedItem['title'].toUpperCase(),style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontFamily: 'RobotoCondensed',
                   fontSize: size.width*0.045
                 ),),
                 const SizedBox(height: 6,),
                 Text(widget.selectedItem['shortDesc'],style: TextStyle(
                     fontSize: size.width*0.035,color: Colors.black
                 ),),
                 const SizedBox(height: 6,),
                 StarScore(
                   score: appRating,
                   star: Star(
                       fillColor: Colors.yellow,
                       emptyColor: Colors.grey.shade200,
                       num: 5,
                       size: size.width*0.05
                   ),
                 ),

                 const SizedBox(height: 6,),
                 Text('Steps (${widget.selectedItem['isCompleted']}/${items.length})',style: TextStyle(
                     fontSize: size.width*0.035,color: Colors.black
                 ),),


                 const SizedBox(height:15),
                 ListView.builder(
                   shrinkWrap: true,
                   physics: const NeverScrollableScrollPhysics(),
                   itemCount: items.length,
                   itemBuilder: (context, index) {
                     return GestureDetector(
                       onTap: () {
                         setState(() {
                           isSelected = index;
                         });
                       },
                       child: Container(
                         margin: const EdgeInsets.only(bottom: 9),
                         padding: EdgeInsets.only(left: size.width*0.05,right: size.width*0.05,top: 5),
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10),
                           color:Colors.white,
                           boxShadow: [
                             BoxShadow(
                                 color: isSelected == index ? Colors.redAccent : Colors.grey.shade100,
                               spreadRadius: 1
                             )
                           ]
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     items[index]['isCompleted']?CircleAvatar(
                                       backgroundColor: Colors.green,
                                       radius: size.width*0.033,
                                       child: Icon(Icons.done_all,
                                       size: size.width*0.055,
                                       color: Colors.white,),
                                     ): CircleAvatar(
                                         backgroundColor: Colors.orangeAccent,
                                         radius: size.width*0.033,
                                         child: Icon(Icons.hourglass_bottom,
                                           color: Colors.white,
                                           size: size.width*0.05,)),
                                     const SizedBox(width: 4,),
                                     items[index]['isCompleted']?
                                     Text(
                                       items[index]['title'],style: TextStyle(
                                       fontSize: size.width*0.043,
                                       fontWeight: FontWeight.w500,
                                       decoration: TextDecoration.lineThrough,
                                     ),):
                                     Text(
                                       items[index]['title'],style: TextStyle(
                                         fontSize: size.width*0.043,
                                         fontWeight: FontWeight.w500
                                     ),),
                                   ],
                                 ),

                                 Container(
                                   alignment: Alignment.center,
                                   decoration: const BoxDecoration(
                                       borderRadius:BorderRadius.all(Radius.circular(15)),
                                       color: Colors.white,
                                       boxShadow:[
                                         BoxShadow(
                                           offset: Offset(0,0.3),
                                           color: Colors.blueAccent,
                                           blurRadius: 0.3,
                                         )
                                       ]
                                   ),
                                   height:  size.height*0.03,
                                   width: size.width*0.15,
                                   child:  FittedBox(
                                     fit: BoxFit.scaleDown,
                                     child: Text(items[index]['payout'],style:  const TextStyle(
                                       color: Colors.blue,
                                       fontWeight: FontWeight.w500,
                                     ),
                                     ),
                                   ),
                                 ),

                               ],
                             ),
                              const SizedBox(height: 5,),
                             isSelected == index ?
                                 Text(items[index]['description'],style:  TextStyle(
                                   color: Colors.black54,
                                   fontSize: size.width*0.037
                                 ),):
                                 const Text(''),
                           ],
                         ),
                       ),
                     );
                   },
                 ),

                

               const SizedBox(height: 200,)
               ],
             ),
           ),


         ],
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        height: size.height*0.15,
        width: size.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
                height: size.height*0.1/2,
              child: Text("⚡ ${widget.selectedItem['total_lead']} Users have already participated"??'',style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xd5a69c02),
                  fontSize: size.width*0.028
              ),),
            ),

            InkWell(
              onTap: (){
                String url = widget.selectedItem["ctaAction"];
                Uri uri = Uri.parse(url);
                launchUrl(uri);
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: size.width*0.02,right: size.width*0.02),
                height: size.height*0.1/1.5,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.lightBlue,
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text('Get ${widget.selectedItem["payout"]}',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: size.width*0.044
                ),),

              ),
            )
          ],
        ),
      ),
    );
  }
}
//