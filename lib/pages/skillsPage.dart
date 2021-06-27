import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  late final ValueChanged onFABTapped;
  late final ValueChanged onBackTapped;
  late final ValueChanged onNextTapped;
  late final ValueChanged gotoIntroductionPage;
  late final ValueChanged gotoRandomFactsPage;
  late final ValueChanged gotoSkillsPage;
  late final ValueChanged gotoLinksPage;

  SkillsScreen({
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
          ),
          IconButton(
            onPressed: () => gotoSkillsPage(null),
            tooltip: 'Skills',
            icon: Icon(Icons.handyman),
            color: Colors.pinkAccent[100],
            iconSize: 35,
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
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: Center(
                      child: Text('まだ、よわよわなので書くことないです。'),
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
