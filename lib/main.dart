import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'theme_bloc/theme.dart';

void main() {
  Bloc.observer = SimpleBlocDelegate();
  runApp(MyApp());
}

class SimpleBlocDelegate extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print(error);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => changeThemeBloc,
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: _buildWithTheme
        ));
  }

  Widget _buildWithTheme(BuildContext context, ThemeState state) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: state.themeData,
        home: MyHomePage(title: 'Flutter Bloc Pattern Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              onPressed: changeThemeBloc.onLightThemeChange,
              child: Text('Light Theme'),
            ),

            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              onPressed: changeThemeBloc.onDarkThemeChange,
              child: Text('Dark Theme'),
            ),

          ],
        ),
      ),
    );
  }
}
