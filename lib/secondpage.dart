import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:onepiconewordgame/main.dart';
import 'package:onepiconewordgame/winpage.dart';

class nextpage extends StatefulWidget {
  const nextpage({Key? key}) : super(key: key);

  @override
  _nextpageState createState() => _nextpageState();
}

class _nextpageState extends State<nextpage> {
  String imagepath = "";
  List imagelist = [];

  String speling = "";
  List answerlist = [];
  List toplist = [];
  List abcdlist = [];
  List bottomlist = [];
  Uint8List? audiobytes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initImages();
  }

  Future _initImages() async {
    String audioasset = "audio/incoi.wav";
    ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    // >> To get paths you need these 2 lines

    final imagePaths = manifestMap.keys
        .where((String key) => key.contains('image/'))
        .where((String key) => key.contains('.webp'))
        .toList();

    setState(() {
      imagelist = imagePaths;
      print(imagelist);
    });
    int rr = Random().nextInt(imagelist.length);
    imagepath = imagelist[rr];

    // imagepath = "image/apple.webp";
    print(imagepath);
    // List<String> list = imagepath.split("/"); // [image, apple.webp]
    // print(list);
    // String s1 = list[1]; //"apple.webp"
    // List list2 = s1.split("\."); // [apple, webp]
    // print(list2);
    // String s2 = list2[0]; // "apple"

    speling = imagepath.split("/")[1].split("\.")[0];
    print(speling);
    answerlist = speling.split(""); // [a, p, p, l, e]
    print(answerlist);
    toplist = List.filled(answerlist.length, "");
    print(toplist);

    String abcd = "abcdefghijklmnopqrstuvwxyz";
    abcdlist = abcd.split("");
    print(abcdlist);
    abcdlist.shuffle();
    print(abcdlist);
    bottomlist = abcdlist.getRange(0, 10 - answerlist.length).toList();

    print(bottomlist);

    bottomlist.addAll(answerlist);
    bottomlist.shuffle();

    print(bottomlist);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.purple,
        appBar: AppBar(
          title: Center(child: Text("1pick1word")),
          leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) {
                    return Homepage();
                  },
                ));
              },
              icon: Icon(Icons.arrow_back_ios_rounded)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 5),
                color: Colors.grey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    height: 200,
                    width: double.infinity,
                    child: Image.asset(imagepath),
                  ),
                ],
              ),
            ),
            Card(elevation: 20,
              child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepPurple, width: 5),
                    color: Colors.grey,
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1),
                    scrollDirection: Axis.horizontal,
                    itemCount: toplist.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              if (toplist[index] != "") {
                                bottomlist[map[index]] = toplist[index];
                                toplist[index] = "";
                                // audioPlayer.playBytes(audiobytes!);
                              }
                            });
                          },
                          child: Container(
                            height: 50,
                            color: Colors.white,
                            width: 50,
                            margin: EdgeInsets.all(10),
                            child: Center(
                              child: Text("${toplist[index]}",style: TextStyle(fontSize: 50,color: Colors.green)),
                            ),
                          ));
                    },
                  )),
            ),
            Container(
              height: 140,
              color: Colors.deepOrange,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    if (index == 10) {
                      return InkWell(
                        onTap: () async {
                          await flutterTts.speak(speling);
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.black),
                          child: Center(
                            child: Icon(
                              Icons.lightbulb,
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                      );
                    } else if (index == 11) {
                      return InkWell(
                        onTap: () async {
                          for (int i = 0; i < answerlist.length; i++) {
                            await Future.delayed(Duration(seconds: 2));
                            await flutterTts.speak(answerlist[i]);
                          }
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(color: Colors.black),
                          child: Center(
                            child: Icon(
                              Icons.lightbulb,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < toplist.length; i++) {
                              // audioPlayer.playBytes(audiobytes!);
                              if (toplist[i] == "") {
                                toplist[i] = bottomlist[index];
                                bottomlist[index] = "";
                                map[i] = index;
                                print(map);

                                break;
                              }
                            }
                            if (toplist.isNotEmpty) {
                              if (toplist.toString() == answerlist.toString()) {
                                setState(() {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                    builder: (context) {
                                      return winningpage();
                                    },
                                  ));
                                });
                              }
                            }
                          });
                        },
                        child: Center(
                          child: Text(
                            "${bottomlist[index]}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Map map = {};
  FlutterTts flutterTts = FlutterTts();
  AudioPlayer audioPlayer = AudioPlayer();
}
