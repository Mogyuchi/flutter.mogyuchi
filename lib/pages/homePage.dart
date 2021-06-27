import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
/*
class MyHomePage extends Page {
  late final ValueChanged onFABTapped;
  late final ValueChanged onTapped;

  MyHomePage({
    required this.onFABTapped,
    required this.onTapped,
  }) : super(key: ValueKey('HomePage'));
  Route createRoute(BuildContext context) {
    return PageRouteBuilder(
      settings: this,
      transitionDuration: Duration(seconds: 3),
      pageBuilder: (context, animation, animation2) {
        Animatable<Offset> tween;
        tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
        final curveTween = CurveTween(curve: Curves.fastOutSlowIn);
        return SlideTransition(
          position: animation.drive(curveTween).drive(tween),
          child: MyHomeScreen(
            onFABTapped: onFABTapped,
            onTapped: onTapped,
          ),
        );
      },
    );
  }
}*/

class MyHomeScreen extends StatelessWidget {
  late final ValueChanged onFABTapped;
  late final ValueChanged onTapped;
  late final ValueChanged gotoIntroductionPage;
  late final ValueChanged gotoRandomFactsPage;
  late final ValueChanged gotoSkillsPage;
  late final ValueChanged gotoLinksPage;

  MyHomeScreen({
    required this.onFABTapped,
    required this.onTapped,
    required this.gotoIntroductionPage,
    required this.gotoRandomFactsPage,
    required this.gotoSkillsPage,
    required this.gotoLinksPage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('もぎゅち'),
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
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(4),
                                child: ClipOval(
                                  child: Container(
                                    color: Colors.pink[50],
                                    child: SvgPicture.asset(
                                      'images/avatar.svg',
                                      height: 300,
                                    ),
                                  ),
                                ),
                              ),
                              /**                            Column(
                                      children: [
                                      Text("I am"),
                                      Text(
                                      "A high schooler \n A software engineer \n A illustrator")
                                      ],
                                      )
                                   */
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              onNotification: (notification) {
                if (notification.overscroll > 5)
                  onTapped(null);
                else {}
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
                onPressed: () => onTapped(null),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
