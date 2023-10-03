import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:window_manager/window_manager.dart';

Future<String> loadAsset() async {
  return await rootBundle.loadString('assets/config.json');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(450, 900),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
  loadAsset();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musiconet',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black,
          secondary: Colors.black
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 32),
          headline2: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 14),
          button: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          subtitle1: TextStyle(color: Colors.grey),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget logoSection = Container(
    child: Image.asset('assets/images/logo.png', semanticLabel: 'Musiconet Logo'),
    width: 200,
    height: 200,
  );


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            logoSection,
            Column(
              children: [
                Text(
                  'Welcome to Musiconet',
                  style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.headline1),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Empowering Musicians: Connecting, Collaborating and Cultivating Musical Excellence',
                  style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.headline2),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextButton(
                    onPressed: null,
                    child: Text('Log in',
                      style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.button, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                    ),
                    borderRadius: const BorderRadius.all(
                        Radius.circular(50.0) //                 <--- border radius here
                    ),
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: TextButton(
                    onPressed: null,
                    child: Text('Join now',
                        style: GoogleFonts.inter(textStyle: Theme.of(context).textTheme.button, color: Colors.white),
                    ),
                  ),
                ),
              ],
            )
            /*
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            */
          ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
