// ignore_for_file: camel_case_types

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled/View/2/Home2.dart';

class Moreoffers extends StatefulWidget {
  const Moreoffers({super.key});

  @override
  State<Moreoffers> createState() => _trendingState();
}

class _trendingState extends State<Moreoffers> {
  List items = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString("assists/dummy_tasks.json");
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

  Color hexcolor(String hexcolor) {
    return Color(int.parse('0xFF$hexcolor'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
              top: size.height * 0.023,
              bottom: size.height * 0.01,
              left: size.width * 0.04),
          child: Row(
            children: [
              Icon(
                Icons.add_chart,
                color: Colors.blue,
                size: size.width * 0.043,
              ),
              Text(
                " More Offers",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: size.width * 0.038,
                  // fontFamily: "RobotoCondensed"
                ),
              ),
            ],
          ),
        ),
        ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            // Make the list scroll horizontally
            children: items.map((item) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => Home2(
                        Brand_id: item["brand"]['brandId'],
                        selectedItem: item,
                      ));
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                      vertical: size.width * 0.01),
                  height: size.height * 0.14,
                  padding: EdgeInsets.only(left: size.width * 0.015),
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      //  color: hexcolor(item['custom_data']['dominant_color']),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                            color:
                                hexcolor(item['custom_data']['dominant_color']),
                            // spreadRadius: 1,
                            blurRadius: 1)
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: size.height * 0.1,
                        width: size.width / 4,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            image: DecorationImage(
                                image: NetworkImage(item['brand']['logo']),
                                fit: BoxFit.fill)),
                      ),
                      Expanded(
                        child: Container(
                          // margin: EdgeInsets.only(top: size.height*0.02),
                          height: size.height * 0.14,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            //   color: Colors.blue,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: size.height * 0.12 / 3,
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.018,
                                      right: size.width * 0.013),
                                  child: Text(
                                    item['brand']['title'] ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: size.width * 0.036),
                                  )),
                              Container(
                                  padding: EdgeInsets.only(
                                      left: size.width * 0.018,
                                      right: size.width * 0.013),
                                  height: size.height * 0.12 / 3,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    item['title'] ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                        fontSize: size.width * 0.032),
                                  )),
                              Container(
                                padding: EdgeInsets.only(
                                    left: size.width * 0.018,
                                    right: size.width * 0.013),
                                height: size.height * 0.14 / 3,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(0, 0.3),
                                              color: Colors.blueAccent,
                                              blurRadius: 0.3,
                                            )
                                          ]),
                                      height: size.height * 0.12 / 3,
                                      width: size.width * 0.2,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'Get ${item["payout_currency"]}${item['payout_amt']}',
                                          style: const TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "⚡ ${item['total_lead']} Users" ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: size.width * 0.028),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList()),
      ],
    );
  }
}
//