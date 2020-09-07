import 'package:bottombar_fab_centered_example/page/email_page.dart';
import 'package:bottombar_fab_centered_example/page/profile_page.dart';
import 'package:bottombar_fab_centered_example/page/search_page.dart';
import 'package:bottombar_fab_centered_example/page/settings_page.dart';
import 'package:bottombar_fab_centered_example/widget/tabbar_material_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title = 'BottomAppBar With Centered FAB';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(primarySwatch: Colors.deepOrange),
        home: MainPage(title: title),
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  final pages = <Widget>[
    SearchPage(),
    EmailPage(),
    ProfilePage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        extendBody: true,
        body: pages[index],
        bottomNavigationBar: TabBarMaterialWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print('Hello World'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      );

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
  }
}
