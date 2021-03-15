import 'package:flutter/material.dart';
import 'package:text_drawable_flutter/text_drawable_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Drawable Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text Drawable Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextDrawable(
                  text: 'Vishal Makasana',
                  padding: EdgeInsets.all(12),
                  length: 1,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Vishal Makasana')
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextDrawable(
                  text: 'Vishal Makasana',
                  padding: EdgeInsets.all(12),
                  length: 2,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Vishal Makasana')
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextDrawable(
                  text: 'Vishal Makasana',
                  boxShape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  length: 2,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Vishal Makasana')
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextDrawable(
                  text: 'Vishal H Makasana',
                  boxShape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  length: 3,
                ),
                SizedBox(
                  width: 8,
                ),
                Text('Vishal H Makasana')
              ],
            )
          ],
        ),
      ),
    );
  }
}
