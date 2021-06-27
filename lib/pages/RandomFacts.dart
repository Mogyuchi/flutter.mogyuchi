import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RandomFactsScreen extends StatelessWidget {
  late final ValueChanged onFABTapped;
  late final ValueChanged onBackTapped;
  late final ValueChanged onNextTapped;
  late final ValueChanged gotoIntroductionPage;
  late final ValueChanged gotoRandomFactsPage;
  late final ValueChanged gotoSkillsPage;
  late final ValueChanged gotoLinksPage;
  final double elevation = 5;
  final Color shadowColor = Colors.pinkAccent;
  RandomFactsScreen({
    required this.onFABTapped,
    required this.onBackTapped,
    required this.onNextTapped,
    required this.gotoIntroductionPage,
    required this.gotoRandomFactsPage,
    required this.gotoSkillsPage,
    required this.gotoLinksPage,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("もぎゅち"),
        actions: <Widget>[
          IconButton(
            onPressed: () => gotoIntroductionPage(null),
            tooltip: 'Introduction',
            icon: Icon(Icons.chat),
          ),
          IconButton(
            onPressed: () => gotoRandomFactsPage(null),
            tooltip: 'Random Facts',
            icon: Icon(Icons.table_rows),
            color: Colors.pinkAccent[100],
            iconSize: 35,
          ),
          IconButton(
            onPressed: () => gotoSkillsPage(null),
            tooltip: 'Skills',
            icon: Icon(Icons.handyman),
          ),
          IconButton(
            onPressed: () => gotoLinksPage(null),
            tooltip: 'Links',
            icon: Icon(Icons.link),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'contact',
        child: Icon(
          Icons.account_circle_outlined,
          size: 50,
          color: Colors.white,
        ),
        onPressed: () => onFABTapped('hoge'),
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            NotificationListener<OverscrollNotification>(
              child: NotificationListener<OverscrollNotification>(
                child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
                      child: Center(
                        child: Container(
                          width: 700,
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 5,
                              spacing: 5,
                              children: [
                                Card(
                                  elevation: elevation,
                                  shadowColor: shadowColor,
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/people_search.svg',
                                          semanticsLabel: 'people_search',
                                          width: 64,
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Pronouns",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text("ae/aer"),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: elevation,
                                  shadowColor: shadowColor,
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/heart.svg',
                                          semanticsLabel: 'heart',
                                          width: 64,
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "SO",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text("Omnisexual"),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: elevation,
                                  shadowColor: shadowColor,
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/pride.svg',
                                          semanticsLabel: 'pride',
                                          width: 64,
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "GI",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text("Girl"),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: elevation,
                                  shadowColor: shadowColor,
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/japan.svg',
                                          semanticsLabel: 'japan',
                                          width: 64,
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Nation",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text("Japan"),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: elevation,
                                  shadowColor: shadowColor,
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/developer.svg',
                                          semanticsLabel: 'developer',
                                          width: 64,
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Workstation",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text("iPad Pro 4th gen"),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: elevation,
                                  shadowColor: shadowColor,
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'images/birthday.svg',
                                          semanticsLabel: 'birthday',
                                          width: 64,
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(2),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Birthday",
                                                  style:
                                                      TextStyle(fontSize: 20),
                                                ),
                                                Text("Sep 18, 2002"),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              onNotification: (notification) {
                if (notification.overscroll < -5)
                  onBackTapped(null);
                else if (notification.overscroll > 5) onNextTapped(null);
                return false;
              },
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                child: Text(
                  'Tap to Next Page',
                  style: TextStyle(color: Colors.pink[50]),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  onPrimary: Colors.pink[100],
                  elevation: 0,
                  minimumSize: Size(MediaQuery.of(context).size.width, 100),
                ),
                onPressed: () => onNextTapped(null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
