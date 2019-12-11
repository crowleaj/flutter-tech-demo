import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hello_flutter/entities/announcement.dart';

import '../utils.dart';

List<Announcement> slides = [
    Announcement("Important", "This is Very important"),
    Announcement("Change Coming", "Rule changes will be coming soonRule changes will be coming soonRule changes will be coming soonRule changes will be coming soon"),
    Announcement("Important 2", "This is Very important"),
  ];

class AnnouncementCarousel extends StatefulWidget {
  @override
    _AnnouncementCarouselWithIndicator createState() => _AnnouncementCarouselWithIndicator();
}
class _AnnouncementCarouselWithIndicator extends State<AnnouncementCarousel> {
  int _current = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
              child: Text("Announcements", style: TextStyle(fontSize: 20)))),
        CarouselSlider(
          height: 100.0,
          autoPlay: true,
          viewportFraction: 1.0,
          aspectRatio: MediaQuery.of(context).size.aspectRatio,
          onPageChanged: (index) {
            setState(() {
              _current = index;
            });
          },
          items: slides.map((i) {
          return Builder(
            builder: (BuildContext context) {
            return Column(
              children: [
                Container(width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(5, 5, 5, 10),
                  child: Text('${i.title}', style: TextStyle(fontSize: 20.0),)
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text('${i.text}', style: TextStyle(fontSize: 16.0),)
                )
              ]
            );
            }
          );
          }).toList(),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils.map<Widget>(slides, (index, url) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index ? Color.fromRGBO(0, 0, 0, 0.9) : Color.fromRGBO(0, 0, 0, 0.4)
                ),
              );
            }),
          )
      ]);
  }
}
