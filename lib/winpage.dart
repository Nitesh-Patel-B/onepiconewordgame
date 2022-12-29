import 'package:flutter/material.dart';
import 'package:onepiconewordgame/secondpage.dart';

class winningpage extends StatefulWidget {
  const winningpage({Key? key}) : super(key: key);

  @override
  _winningpageState createState() => _winningpageState();
}

class _winningpageState extends State<winningpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("image/win.png"))),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return nextpage();
                  },
                ));
              },
              child: Text("CONTINUE"))
        ],
      ),
    );
  }
}
