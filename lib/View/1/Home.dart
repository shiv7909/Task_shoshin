import 'package:flutter/material.dart';
import 'package:untitled/View/1/trending.dart';

import 'Info_slider.dart';
import 'Moreoffers.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedOption = 0;
  PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose(); // Dispose the PageController
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.orange,
        appBar:
            // AppBARR(),
            AppBar(
          leading: const Icon(
            Icons.list_rounded,
            color: Colors.white,
          ),
          flexibleSpace: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade800,
                    Colors.lightBlue,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.5),
                //     spreadRadius: 2,
                //     blurRadius: 10,
                //   //  offset: Offset(0, 1), // Adjust the offset to control the shadow direction
                //   ),
                // ],
              ),
              // padding: EdgeInsets.all(8),
            ),
          ),
          actions: [
            Material(
              color: Colors.white,
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20.0), // Adjust the radius as needed
              ),
              child: Container(
                padding: const EdgeInsets.all(3),
                //  padding: EdgeInsets.only(right: 20),
                //    color: Colors.white,
                height: size.height * 0.04,
                width: size.width * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.wallet,
                      color: Colors.blue,
                    ),
                    //Text("5000"),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '₹9876',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.035),
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.07,
            )
          ],
          title: Text(
            'Hey shoshin',
            style: TextStyle(
                fontSize: size.width * 0.045,
                fontFamily: 'Widolte_Regular',
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
        ),
        body: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                //   padding: EdgeInsets.only(top: 5),
                height: size.height * 0.1,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.05,
                      //  margin: EdgeInsets.only(bottom: 5),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade800,
                            Colors.lightBlue,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Container(
                      //   padding: EdgeInsets.only(left: 10,right: 10),
                      height: size.height * 0.1,
                      margin: EdgeInsets.only(top: size.height * 0.005),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueAccent.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0,
                                4), // Adjust the offset to control the shadow direction
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            //   padding: selectedOption == 0 ? const EdgeInsets.all(30):const EdgeInsets.all(5),
                            width: size.width / 4,
                            child: GestureDetector(
                              onTap: () {
                                selectedOption = 0;
                                pageController.animateToPage(0,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //   const Icon(Icons.account_circle),
                                  SizedBox(
                                      //color:Colors.blue,
                                      height: size.height * 0.05,
                                      width: size.width / 4,
                                      child: Image.network(
                                        'https://i.pinimg.com/564x/76/89/fa/7689fa1353d27162470b6e205d4bc849.jpg',
                                      )),
                                  FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'All Offers',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: selectedOption == 0
                                                ? size.width * 0.027
                                                : size.width * 0.025,
                                            color: selectedOption == 0
                                                ? Colors.blue
                                                : Colors.black),
                                      )),
                                  selectedOption == 0
                                      ? Container(
                                          margin: const EdgeInsets.all(5),
                                          height: size.height * 0.003,
                                          width: size.width / 7,
                                          color: Colors.blue.shade200,
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            //   padding: selectedOption == 0 ? const EdgeInsets.all(30):const EdgeInsets.all(5),
                            width: size.width / 4,
                            child: GestureDetector(
                              onTap: () {
                                selectedOption = 1;
                                pageController.animateToPage(1,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      //color:Colors.blue,
                                      height: size.height * 0.05,
                                      width: size.width / 4,
                                      child: Image.network(
                                        'https://i.pinimg.com/564x/01/b4/62/01b4625318069469dae8f9bcf3ff6387.jpg',
                                      )),
                                  FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Gifts',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            //   fontSize:  selectedOption == 1 ? 11:9,
                                            fontSize: selectedOption == 1
                                                ? size.width * 0.027
                                                : size.width * 0.025,
                                            color: selectedOption == 1
                                                ? Colors.blue
                                                : Colors.black),
                                      )),
                                  selectedOption == 1
                                      ? Container(
                                          margin: const EdgeInsets.all(5),
                                          height: size.height * 0.003,
                                          width: size.width / 7,
                                          color: Colors.blue.shade200,
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            //   padding: selectedOption == 0 ? const EdgeInsets.all(30):const EdgeInsets.all(5),
                            width: size.width / 4,
                            child: GestureDetector(
                              onTap: () {
                                selectedOption = 2;
                                pageController.animateToPage(2,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      //  color:Colors.blue,
                                      height: size.height * 0.05,
                                      width: size.width / 4,
                                      child: Image.network(
                                        'https://i.pinimg.com/736x/a8/e1/cf/a8e1cfd3c983d6fb4493f72bc21938f8.jpg',
                                      )),
                                  FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'Upcoming',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            //    fontSize:  selectedOption == 2 ? 11:9,
                                            fontSize: selectedOption == 2
                                                ? size.width * 0.027
                                                : size.width * 0.025,
                                            color: selectedOption == 2
                                                ? Colors.blue
                                                : Colors.black),
                                      )),
                                  selectedOption == 2
                                      ? Container(
                                          margin: const EdgeInsets.all(5),
                                          height: size.height * 0.003,
                                          width: size.width / 7,
                                          color: Colors.blue.shade200,
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            //   padding: selectedOption == 0 ? const EdgeInsets.all(30):const EdgeInsets.all(5),
                            width: size.width / 4,
                            child: GestureDetector(
                              onTap: () {
                                selectedOption = 3;
                                pageController.animateToPage(3,
                                    duration: const Duration(milliseconds: 200),
                                    curve: Curves.ease);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      // color:Colors.blue,
                                      height: size.height * 0.05,
                                      width: size.width / 4,
                                      child: Image.network(
                                        'https://i.pinimg.com/564x/4d/b0/2f/4db02fd53197900faf3252c76703424d.jpg',
                                      )),
                                  FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'My offers',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: selectedOption == 3
                                                ? size.width * 0.027
                                                : size.width * 0.025,
                                            //  fontSize: size.width*0.025,
                                            color: selectedOption == 3
                                                ? Colors.blue
                                                : Colors.black),
                                      )),
                                  selectedOption == 3
                                      ? Container(
                                          margin: const EdgeInsets.all(5),
                                          height: size.height * 0.003,
                                          width: size.width / 7,
                                          color: Colors.blue.shade200,
                                        )
                                      : Container()
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (int index) {
                    setState(() {
                      selectedOption = index;
                    });
                  },
                  itemCount: 4,
                  // Number of pages
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container(
                        color: Colors.white,
                        child: const SingleChildScrollView(
                            child: Column(children: <Widget>[
                          BBanner(),
                          trending(),
                          Moreoffers(),
                        ])),
                      );
                    } else if (index == 1) {
                      return Container(
                        color: Colors.white,
                        child: const Center(
                          child: Text('Welcome to Gifts section'),
                        ),
                      );
                    } else if (index == 2) {
                      return Container(
                        color: Colors.white,
                        child: const Center(
                          child: Text('Welcome to upcoming section'),
                        ),
                      );
                    } else {
                      return Container(
                        color: Colors.white,
                        child: const Center(
                          child: Text('Welcome to my offers section'),
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
//
