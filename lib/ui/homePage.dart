import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:sarowar/ui/web.dart';

import '../Firebase/contact.dart';
import '../constent/aboutData.dart';
import '../main.dart';
import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = ValueNotifier<bool>(true);
  late TextEditingController emailController;
  late TextEditingController nameController;
  late TextEditingController messagesController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    nameController = TextEditingController();
    messagesController = TextEditingController();

    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          MyApp.themeNotifier.value = ThemeMode.light;
        } else {
          MyApp.themeNotifier.value = ThemeMode.dark;
        }
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    messagesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print(width);

    return width <= 700
        ? mobile(height, width)
        : web(height: height, width: width, controller: _controller);
  }

  Container mobile(double height, double width) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SizedBox(
                  width: width / 30,
                ),
                Container(
                  width: width / 5,
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logoDark.png'))),
                ),
                SizedBox(
                  width: width / 80,
                ),
                Text("Sarowar",
                    style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold, fontSize: width / 10)),
              ]),
              Row(
                children: [
                  IconButton(
                      alignment: Alignment.center,
                      hoverColor: Colors.blueGrey.withOpacity(0.3),
                      padding: EdgeInsets.only(
                          left: width / 90,
                          right: width / 15,
                          bottom: width / 20),
                      icon: Icon(
                        MyApp.themeNotifier.value == ThemeMode.light
                            ? Icons.nightlight
                            : Icons.light_mode,
                        color: MyApp.themeNotifier.value == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        size: width / 10,
                      ),
                      onPressed: () {
                        setState(() {});
                        MyApp.themeNotifier.value =
                            MyApp.themeNotifier.value == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                      }),
                  SizedBox(
                    width: width / 50,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: height / 10,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: "Hi, I'm  ",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold, fontSize: width / 15)),
            TextSpan(
                text: "Sarowar Hossain",
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: width / 15,
                    color: Colors.blueGrey)),
          ])),
          SizedBox(
            height: height / 50,
          ),
          Text('Web Developer',
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold, fontSize: width / 15)),
          SizedBox(
            height: 40,
          ),
          Text("Specialized in all and Core Web ",
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold, fontSize: width / 35)),
          SizedBox(
            height: height / 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  bool result =
                      await InternetConnectionCheckerPlus().hasConnection;
                  if (result != true) {
                    return errorMsg(
                        'connection', "Your have no Internet connection ");
                  } else {
                    return open();
                  }
                },
                hoverColor: Colors.transparent,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 18, bottom: 18, left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'Contact Me',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: width / 20,
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context, MaterialPageRoute(builder: (_) => AboutMe())),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 18, bottom: 18, left: 25, right: 25),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    'About Me',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  errorMsg(String type, String msg) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            alignment: AlignmentDirectional.center,
            actionsOverflowDirection: VerticalDirection.down,
            actionsAlignment: MainAxisAlignment.spaceAround,
            scrollable: true,
            title: Text(type),
            content: Column(children: [
              Text(msg),
            ]),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ok'))
            ],
          ));
  open() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            alignment: AlignmentDirectional.center,
            actionsOverflowDirection: VerticalDirection.down,
            actionsAlignment: MainAxisAlignment.spaceAround,
            scrollable: true,
            title: Text('Contact',
                style: GoogleFonts.roboto(
                    fontSize: 30, fontWeight: FontWeight.bold)),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: GoogleFonts.roboto(),
                  )),
              ElevatedButton(
                  onPressed: () async {
                    bool result =
                        await InternetConnectionCheckerPlus().hasConnection;
                    if (result != true) {
                      Navigator.pop(context);
                      errorMsg('Submission', 'Your Internet Not Working');
                    } else {
                      Contact().contactMessage(nameController.text,
                          emailController.text, messagesController.text);
                      Timer(Duration(seconds: 2), () => Navigator.pop(context));
                    }
                  },
                  child: Text(
                    'Send',
                    style: GoogleFonts.roboto(),
                  )),
            ],
            content:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    bottom: 15,
                  ),
                  child: Text(
                    'Your Name',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: nameController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Name', border: InputBorder.none),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10, bottom: 15, top: 15),
                  child: Text(
                    'Contact Email',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Email', border: InputBorder.none),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10, bottom: 15, top: 15),
                  child: Text(
                    'Messages',
                    style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
                  )),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueGrey, width: 3),
                    borderRadius: BorderRadius.circular(10)),
                child: TextField(
                  controller: messagesController,
                  maxLines: 10,
                  decoration: InputDecoration(
                      hintText: 'Write Your Messages',
                      border: InputBorder.none),
                ),
              )
            ]),
          ));
}
