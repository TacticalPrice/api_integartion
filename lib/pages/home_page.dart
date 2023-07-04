import 'package:api_integration/pages/widgets/widgets_report_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Users'),


      ),
      body: _uisetup(),
    );

  }

  Widget _uisetup() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListView(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                children: [
                  
                  WidgetReportList()
                ],
              ),
            ),
          )
        ],
      ),

    );

  }
}