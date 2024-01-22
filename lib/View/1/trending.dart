import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class trending extends StatefulWidget {
  const trending({super.key});

  @override
  State<trending> createState() => _trendingState();
}

class _trendingState extends State<trending> {
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
                top: size.height * 0.01,
                bottom: size.height * 0.01,
                left: size.width * 0.04),
            child: Text(
              "🔥 Trending Offers",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.038,
                // fontFamily: "RobotoCondensed"
              ),
            )),
        SizedBox(
          width: size.width,
          height: size.height * 0.25,
          child: ListView(
              scrollDirection: Axis.horizontal,
              // Make the list scroll horizontally
              children: items.map((item) {
                if (item['isTrending']) {
                  return Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                    ),
                    decoration: BoxDecoration(
                        //  color: Colors.orange,
                        color: hexcolor(item['custom_data']['dominant_color']),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        )),
                    child: Column(
                      children: [
                        Container(
                          height: size.height * 0.17,
                          width: size.width / 2.5,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              image: DecorationImage(
                                  image: NetworkImage(item['thumbnail']),
                                  fit: BoxFit.fitWidth)),
                        ),
                        Container(
                          height: size.height * 0.08,
                          width: size.width / 2.5,
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
                                  height: size.height * 0.08 / 3,
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    item['brand']['title'] ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: size.width * 0.032),
                                  )),
                              Container(
                                  height: size.height * 0.08 / 3,
                                  padding: const EdgeInsets.only(left: 5),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Get RS.${item['payout_amt']}" ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                        fontSize: size.width * 0.036),
                                  )),
                              Container(
                                height: size.height * 0.08 / 3,
                                padding: const EdgeInsets.only(left: 5),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "⚡ ${item['total_lead']} Users" ?? '',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                      fontSize: size.width * 0.028),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Expanded(child:
                        // Container(
                        //   color: Colors.blue,
                        // ))
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }).toList()),
        ),
      ],
    );
  }
}
//