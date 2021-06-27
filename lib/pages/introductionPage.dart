import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  late final ValueChanged onFABTapped;
  late final ValueChanged onBackTapped;
  late final ValueChanged onNextTapped;
  late final ValueChanged gotoIntroductionPage;
  late final ValueChanged gotoRandomFactsPage;
  late final ValueChanged gotoSkillsPage;
  late final ValueChanged gotoLinksPage;

  IntroductionScreen({
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
            color: Colors.pinkAccent[100],
            iconSize: 35,
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
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.pink[50],
                        ),
                        child: Text('''こんにちは。もぎゅちと言います。
男子校に通ってるけど、JKです。
本名は好きくないので、如何を問わず「もぎゅち」と呼んでくれたらありがたいです。'''),
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
