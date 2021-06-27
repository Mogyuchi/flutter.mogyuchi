import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mogyuchi/page_transitions_theme.dart';
import 'package:mogyuchi/pages/RandomFacts.dart';
import 'package:mogyuchi/pages/homePage.dart';
import 'package:mogyuchi/pages/introductionPage.dart';
import 'package:mogyuchi/pages/linksPage.dart';
import 'package:mogyuchi/pages/skillsPage.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppRouterDelegate _routerDelegate = AppRouterDelegate();
  AppRouteInformationParser _routeInformationParser =
      AppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Mogyuchi',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          pageTransitionsTheme: const PageTransitionsTheme(
              builders: <TargetPlatform, PageTransitionsBuilder>{
                TargetPlatform.android: CustomTransitionsBuilder(),
                TargetPlatform.fuchsia: CustomTransitionsBuilder(),
                TargetPlatform.iOS: CustomTransitionsBuilder(),
                TargetPlatform.linux: CustomTransitionsBuilder(),
                TargetPlatform.macOS: CustomTransitionsBuilder(),
                TargetPlatform.windows: CustomTransitionsBuilder(),
              })),
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}

class AppRouteInformationParser extends RouteInformationParser<AppRoutePath> {
  @override
  Future<AppRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);
    if (uri.pathSegments.length == 0) {
      return AppRoutePath.home();
    }

    if (uri.pathSegments.length == 1) {
      switch (uri.pathSegments[0]) {
        case 'introduction':
          return AppRoutePath.introduction();
        case 'randomFacts':
          return AppRoutePath.randomFacts();
        case 'skills':
          return AppRoutePath.skills();
        case 'links':
          return AppRoutePath.links();
        default:
          return AppRoutePath.unknown();
      }
    }
    return AppRoutePath.unknown();
  }

  @override
  RouteInformation? restoreRouteInformation(AppRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isIntroductionPage) {
      return RouteInformation(location: '/introduction');
    }
    if (path.isRandomFactsPage) {
      return RouteInformation(location: '/randomFacts');
    }
    if (path.isSkillsPage) {
      return RouteInformation(location: '/skills');
    }
    if (path.isLinksPage) {
      return RouteInformation(location: '/links');
    }
    return null;
  }
}

class AppRouterDelegate extends RouterDelegate<AppRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  late String? _selectedPage;
  bool show404 = false;

  List<String> pages = ['introduction', 'randomFacts', 'skills', 'links'];

  AppRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  AppRoutePath get currentConfiguration {
    if (show404) {
      return AppRoutePath.unknown();
    }
    switch (_selectedPage) {
      case 'introduction':
        return AppRoutePath.introduction();
      case 'randomFacts':
        return AppRoutePath.randomFacts();
      case 'skills':
        return AppRoutePath.skills();
      case 'links':
        return AppRoutePath.links();
      default:
        return AppRoutePath.home();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('HomePage'),
          child: MyHomeScreen(
            onFABTapped: _contactButtonTapped,
            onTapped: _gotoIntroductionPage,
            gotoIntroductionPage: _gotoIntroductionPage,
            gotoRandomFactsPage: _gotoRandomFactsPage,
            gotoSkillsPage: _gotoSkillsPage,
            gotoLinksPage: _gotoLinksPage,
          ),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedPage == 'introduction')
          MaterialPage(
            key: ValueKey('introduction'),
            child: IntroductionScreen(
              onFABTapped: _contactButtonTapped,
              onBackTapped: _gobackHomePage,
              onNextTapped: _gotoRandomFactsPage,
              gotoIntroductionPage: _gotoIntroductionPage,
              gotoRandomFactsPage: _gotoRandomFactsPage,
              gotoSkillsPage: _gotoSkillsPage,
              gotoLinksPage: _gotoLinksPage,
              // isNext: _isNext,
            ),
          )
        else if (_selectedPage == 'randomFacts')
          MaterialPage(
            key: ValueKey('RandomFacts'),
            child: RandomFactsScreen(
              onFABTapped: _contactButtonTapped,
              onBackTapped: _gobackIntroductionPage,
              onNextTapped: _gotoSkillsPage,
              gotoIntroductionPage: _gotoIntroductionPage,
              gotoRandomFactsPage: _gotoRandomFactsPage,
              gotoSkillsPage: _gotoSkillsPage,
              gotoLinksPage: _gotoLinksPage,
              //  isNext: _isNext,
            ),
          )
        else if (_selectedPage == 'skills')
          MaterialPage(
            key: ValueKey('skills'),
            child: SkillsScreen(
              onFABTapped: _contactButtonTapped,
              onBackTapped: _gobackRandomFactsPage,
              onNextTapped: _gotoLinksPage,
              gotoIntroductionPage: _gotoIntroductionPage,
              gotoRandomFactsPage: _gotoRandomFactsPage,
              gotoSkillsPage: _gotoSkillsPage,
              gotoLinksPage: _gotoLinksPage,
              //  isNext: _isNext,
            ),
          )
        else if (_selectedPage == 'links')
          MaterialPage(
            key: ValueKey('links'),
            child: LinksScreen(
              onBackTapped: _gobackSkillsPage,
              gotoIntroductionPage: _gotoIntroductionPage,
              gotoRandomFactsPage: _gotoRandomFactsPage,
              gotoSkillsPage: _gotoSkillsPage,
              gotoLinksPage: _gotoLinksPage,
            ),
          )
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        _selectedPage = null;
        show404 = false;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(AppRoutePath path) async {
    if (path.isUnknown) {
      _selectedPage = null;
      show404 = true;
      return;
    }

    if (path.isIntroductionPage) {
      _selectedPage = pages[0];
    } else if (path.isRandomFactsPage) {
      _selectedPage = pages[1];
    } else if (path.isSkillsPage) {
      _selectedPage = pages[2];
    } else if (path.isLinksPage) {
      _selectedPage = pages[3];
    } else {
      _selectedPage = null;
    }
    show404 = false;
  }

  bool _isNext = true;
  void _contactButtonTapped(dynamic) {
    _selectedPage = 'links';
    notifyListeners();
  }

  void _gobackHomePage(dynamic) {
    _selectedPage = null;
    notifyListeners();
  }

  void _gotoIntroductionPage(dynamic) {
    _selectedPage = 'introduction';
    _isNext = true;
    notifyListeners();
  }

  void _gobackIntroductionPage(dynamic) {
    _selectedPage = 'introduction';
    _isNext = false;
    notifyListeners();
  }

  void _gotoRandomFactsPage(dynamic) {
    _selectedPage = 'randomFacts';
    _isNext = true;
    notifyListeners();
  }

  void _gobackRandomFactsPage(dynamic) {
    _selectedPage = 'randomFacts';
    _isNext = false;
    notifyListeners();
  }

  void _gotoSkillsPage(dynamic) {
    _selectedPage = 'skills';
    _isNext = true;
    notifyListeners();
  }

  void _gobackSkillsPage(dynamic) {
    _selectedPage = 'skills';
    _isNext = false;
    notifyListeners();
  }

  void _gotoLinksPage(dynamic) {
    _selectedPage = 'links';
    notifyListeners();
  }
}

class AppRoutePath {
  final String? page;
  final bool isUnknown;

  AppRoutePath.home()
      : page = null,
        isUnknown = false;

  AppRoutePath.introduction()
      : page = 'introduction',
        isUnknown = false;

  AppRoutePath.randomFacts()
      : page = 'randomFacts',
        isUnknown = false;

  AppRoutePath.skills()
      : page = 'skills',
        isUnknown = false;

  AppRoutePath.links()
      : page = 'links',
        isUnknown = false;

  AppRoutePath.unknown()
      : page = null,
        isUnknown = true;

  bool get isHomePage => page == null;

  bool get isIntroductionPage => page == 'introduction';

  bool get isRandomFactsPage => page == 'randomFacts';

  bool get isSkillsPage => page == 'skills';

  bool get isLinksPage => page == 'links';
}

// https://medium.com/flutter/learning-flutters-new-navigation-and-routing-system-7c9068155ade

class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}
