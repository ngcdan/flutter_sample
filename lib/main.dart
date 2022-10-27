import 'package:flutter/material.dart';
import 'strings.dart' as strings;
import 'dart:convert';
import 'package:http/http.dart' as http;

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
  // dynamic keyword tells that the list could hold anything
  var _members = <Member>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  Future<void> _loadData() async {
    //const dataUrl = 'https://api.github.com/orgs/raywenderlich/members';
    //final response = await http.get(Uri.parse(dataUrl));

    List<String> dataList = ['dan', 'nhat'];

    // calling setState to rebuild UI
    setState(() {
      //_members = json.decode(response.body) as List;
      for(String item in dataList) {
        print(item);
        Member member = Member(item);
        _members.add(member);
      }
    });
  }

  // method call loadData when state is first created
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Widget _buildRow(int i) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(title: Text(_members[i].loginId, style: _biggerFont)),
    );
  }

  // primary place where construct widgets.
  @override
  Widget build(BuildContext context) {
    // a container for Material Design widgets.
    return Scaffold(
      appBar: AppBar(
        title: const Text(strings.appTitle),
      ),
      body: ListView.separated(
        itemCount: _members.length,
        itemBuilder: (BuildContext ctx, int pos) {
         return _buildRow(pos);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },),
    );
  }
}

class Member {
  Member(this.loginId);
  final String loginId;
}

