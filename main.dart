import 'package:demoapp/src/favorites.dart';
import 'package:demoapp/src/notifiers/hn_api.dart';
import 'package:demoapp/src/notifiers/prefs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'myPages/firstPage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider<LoadingTabsCount>(
          builder: (_) => LoadingTabsCount(),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<MyDatabase>(builder: (_) => MyDatabase()),
        ChangeNotifierProvider(
          builder: (context) => HackerNewsNotifier(
            // TODO(filiph): revisit when ProxyProvider lands
            // https://github.com/rrousselGit/provider/issues/46
            Provider.of<LoadingTabsCount>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(builder: (_) => PrefsNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<LoadingTabsCount>(
          builder: (_) => LoadingTabsCount(),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<MyDatabase>(builder: (_) => MyDatabase()),
        ChangeNotifierProvider(
          builder: (context) => HackerNewsNotifier(
            // TODO(filiph): revisit when ProxyProvider lands
            // https://github.com/rrousselGit/provider/issues/46
            Provider.of<LoadingTabsCount>(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(builder: (_) => PrefsNotifier()),
      ],
      child: MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

