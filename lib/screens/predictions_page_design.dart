import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:camera_app/utilities/constants.dart';
import 'package:camera_app/utilities/top_button_with_padding.dart';

class PageDesign extends StatefulWidget {
  @override
  _PageDesignState createState() => _PageDesignState();
}

class _PageDesignState extends State<PageDesign> {
  String _diseaseName = 'Bacterial Spot';
  String _reasonForDisease = 'Insects';
  String _paragraph =
      """ Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.""";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // print(size);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFA9BBBC),
        body: Scrollbar(
          child: ListView(
            restorationId: 'report_page',
            padding: EdgeInsets.all(15.0),
            children: [
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TopButtonWithPadding(
                      size: size,
                      child: Text(
                        'Recommended Medicine',
                        style: kReportPageTextStyle,
                      ),
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                      onPressed: () {},
                    ),
                    TopButtonWithPadding(
                      size: size,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Agency',
                            style: kReportPageTextStyle,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 30.0),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFF1B4449),
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                width: size.width * 0.9,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '  Report',
                            style: kReportTextStyle,
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // TODO: Image should be cropped accordingly
                    Container(
                      height: 250.0,
                      width: 250.0,
                      color: Colors.white24,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Disease Name: $_diseaseName',
                      style: kReportTextStyle,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Reason for Cause: $_reasonForDisease',
                      style: kReportTextStyle,
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                        '$_paragraph',
                        style: kParagraphTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          onTap: (value) {},
        ),
      ),
    );
  }
}
