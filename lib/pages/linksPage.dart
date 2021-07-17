import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinksScreen extends StatelessWidget {
  late final ValueChanged onBackTapped;
  late final ValueChanged gotoIntroductionPage;
  late final ValueChanged gotoRandomFactsPage;
  late final ValueChanged gotoSkillsPage;
  late final ValueChanged gotoLinksPage;

  final double elevation = 5;
  final Color shadowYellow = Colors.yellowAccent;
  final Color shadowPink = Colors.pinkAccent;
  static const double logoSize = 64;

  LinksScreen({
    required this.onBackTapped,
    required this.gotoIntroductionPage,
    required this.gotoRandomFactsPage,
    required this.gotoSkillsPage,
    required this.gotoLinksPage,
  });

  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

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
            color: Colors.pinkAccent[100],
            iconSize: 35,
          ),
        ],
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
                          width: 800,
                          child: Wrap(
                              alignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              runSpacing: 10,
                              spacing: 10,
                              children: [
                                ElevatedButton(
                                  onPressed: () => _launchURL(
                                      'https://discord.com/users/325222935612620800'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.pink[100],
                                    shadowColor: shadowYellow,
                                    elevation: elevation,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(14),
                                          child: Image.asset(
                                            'images/logos/Discord.png',
                                            semanticLabel: 'Discord Logo',
                                          ),
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
                                                  "Discord",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  "Mogyuchi#0918",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => _launchURL(
                                      'https://twitter.com/Mogyuchi'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.pink[100],
                                    shadowColor: shadowYellow,
                                    elevation: elevation,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(14),
                                          child: Image.asset(
                                            'images/logos/Twitter.png',
                                            semanticLabel: 'Twitter Logo',
                                          ),
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
                                                  "Twitter",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  "@Mogyuchi",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () =>
                                      _launchURL('https://github.com/Mogyuchi'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.pink[100],
                                    shadowColor: shadowPink,
                                    elevation: elevation,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(14),
                                          child: Image.asset(
                                            'images/logos/Octocat.jpg',
                                            semanticLabel: 'Octocat',
                                          ),
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
                                                  "GitHub",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  "Mogyuchi",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () =>
                                      _launchURL('https://qiita.com/Mogyuchi'),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.pink[100],
                                    shadowColor: shadowPink,
                                    elevation: elevation,
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(14),
                                          child: Image.asset(
                                            'images/logos/Qiita.png',
                                            semanticLabel: 'Qiita Logo',
                                          ),
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
                                                  "Qiita",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Text(
                                                  "@Mogyuchi",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ]),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                /*Card(
                                  elevation: elevation,
                                  shadowColor: shadowPink,
                                  child: Container(
                                    margin: EdgeInsets.all(3),
                                    height: 70,
                                    width: 200,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(14),
                                          child: Image.asset(
                                            'images/logos/Twitter.png',
                                            semanticLabel: 'Twitter Logo',
                                            width: 64,
                                          ),
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
                                ),*/
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              onNotification: (notification) {
                if (notification.overscroll < -5) onBackTapped(null);
                return false;
              },
            ),
          ],
        ),
      ),
    );
  }
}
