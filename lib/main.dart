import 'package:flutter/material.dart';
import 'strings.dart' as strings;

void main() => runApp(const GHFlutterApp());

class GHFlutterApp extends StatelessWidget {
  const GHFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: strings.appTitle,
      theme: ThemeData.dark(useMaterial3: true),
      home: const GHFlutter(),
    );
  }
}

class GHFlutter extends StatefulWidget {
  const GHFlutter({Key? key}) : super(key: key);

  // to create the stateful widget's state object
  @override
  State<GHFlutter> createState() => _GHFlutterState();
}

// the underscore mean this class is file-private, can't be imported into other files
class _GHFlutterState extends State<GHFlutter> {

  // primary place where construct widgets.
  @override
  Widget build(BuildContext context) {
    // a container for Material Design widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.appTitle),
      ),
      body: const Text(strings.appTitle),
    );
  }
}

