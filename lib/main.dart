import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onepiconewordgame/secondpage.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          "1 Pic 1 Word",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 100,
              //  height: appbarheight * 0.3,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("image/game_top.png"))),
            ),
            Container(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                    builder: (context) {
                      return nextpage();
                    },
                  ));
                },
              ),
              height: 100,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("image/group1.png"))),
            ),
            Container(
              child: InkWell(),
              height: 100,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("image/croup_2.png"))),
            ),
            Container(
              child: InkWell(),
              height: 100,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("image/croup_3.png"))),
            ),
            Container(
              child: InkWell(),
              height: 100,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("image/croup_4.png"))),
            ),
            Container(
              child: InkWell(),
              height: 100,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage("image/croup_5.png"))),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:onepiconewordgame/secondpage.dart';
//
// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false,
//     home: game(),
//   ));
// }
//
// class game extends StatefulWidget {
//   const game({Key? key}) : super(key: key);
//
//   @override
//   _gameState createState() => _gameState();
// }
//
// class _gameState extends State<game> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           InkWell(
//             onTap: () {
//               Navigator.push(context,MaterialPageRoute(builder: (context) {
//                 return nextpage();
//               },));
//             },
//             child: Container(
//               height: 150,
//               width: 200,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage("image/croup_1.png"),
//                       fit: BoxFit.fill)),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
