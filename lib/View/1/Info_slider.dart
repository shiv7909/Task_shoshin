import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BBanner extends StatefulWidget {
  const BBanner({Key? key}) : super(key: key);

  @override
  info_banner createState() => info_banner();
}

class info_banner extends State<BBanner> {
  int _currentIndex = 0;
  List Quotes = [];

  Timer? _timer;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString("assists/quotes.json");
    final data = await json.decode(response);
    setState(() {
      // Quotes = [...Quotes, ...data];
      Quotes = List.from(data);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (Quotes.isNotEmpty) {
        final int newIndex = (_currentIndex + 1) % Quotes.length;
        setState(() {
          _currentIndex = newIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  RichText _getStyledText(String text) {
    List<TextSpan> textSpans = [];

    RegExp regExp = RegExp(r"([^\d₹]*)(₹?\d+)(\D*)");
    Iterable<RegExpMatch> matches = regExp.allMatches(text);

    for (RegExpMatch match in matches) {
      textSpans.add(
        TextSpan(
          text: match.group(1), // Text before the number
          style: const TextStyle(color: Colors.black),
        ),
      );
      textSpans.add(
        TextSpan(
          text: match.group(2), // Number
          style:
              const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        ),
      );
      textSpans.add(
        TextSpan(
          text: match.group(3), // Text after the number
          style: const TextStyle(color: Colors.black),
        ),
      );
    }

    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black), // Default text style
        children: textSpans,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          items: Quotes.map((quote) {
            return Container(
              color: const Color(0x3D868686),
              alignment: Alignment.center,
              // margin: EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Row(
                  children: [
                    const Text(
                      '✔️  ',
                      style: TextStyle(color: Colors.blue),
                    ),
                    _getStyledText(quote["quote"].toString())
                  ],
                ),
                // child: Text( quote["quote"].toString(),style: const TextStyle(
                //   fontWeight: FontWeight.w400,
                // //  fontSize: size.width
                //  ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            enlargeCenterPage: false,
            height: size.height * 0.05,
            viewportFraction: 1,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            autoPlay: true,
            // enable automatic sliding
            autoPlayInterval: const Duration(milliseconds: 2600),
            // set sliding interval
            autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            // set sliding animation duration
            autoPlayCurve: Curves.linear, // set sliding animation curve
          ),
        ),
      ],
    );
  }
}
//