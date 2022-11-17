import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../Firebase/contact.dart';
import '../constent/aboutData.dart';
import '../main.dart';

class web extends StatefulWidget {
  web({
    Key? key,
    required this.height,
    required this.width,
    required ValueNotifier<bool> controller,
  })  : _controller = controller,
        super(key: key);

  final double height;
  final double width;
  final ValueNotifier<bool> _controller;

  @override
  State<web> createState() => _webState();
}

class _webState extends State<web> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          // nav menu
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(children: [
                    SizedBox(
                      width: widget.width / 30,
                    ),
                    Container(
                      width: widget.width / 20,
                      height: widget.height / 10,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/logoDark.png'))),
                    ),
                    SizedBox(
                      width: widget.width / 30,
                    ),
                    Text("Sarowar",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: widget.width / 20)),
                  ]),
                  // Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: widget.width / 100,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'About Me',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: widget.width / 100,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'About Me',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )),
                      SizedBox(
                        width: widget.width / 100,
                      ),
                      AdvancedSwitch(
                        controller: widget._controller,
                        width: 80,
                        activeChild: Icon(Icons.light_mode),
                        inactiveColor: Color.fromARGB(255, 227, 131, 22),
                        activeColor: Color.fromARGB(255, 175, 21, 206),
                        inactiveChild: Icon(Icons.nightlight),
                      ),
                      SizedBox(
                        width: widget.width / 30,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: widget.height / 10,
              ),
            ],
          ),
          // nav menu

          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, I'm",
                      style: GoogleFonts.roboto(
                          fontSize: widget.width / 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Sarowar ",
                      style: GoogleFonts.roboto(
                          fontSize: widget.width / 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    ),
                    Text(
                      "Web Developer",
                      style: GoogleFonts.roboto(
                          fontSize: widget.width / 15,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            open();
                          },
                          hoverColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.only(
                                top: 18, bottom: 18, left: 25, right: 25),
                            decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(50)),
                            child: Text(
                              'Contact Me',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widget.width / 20,
                        ),
                      ],
                    )
                  ],
                ),
                Spacer(),
                Stack(
                  children: [
                    Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/pattern.png'))),
                    ),
                    Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/images/hero.jpg')),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(180),
                            bottomRight: Radius.circular(180),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),

          Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'About',
                style: GoogleFonts.roboto(
                    fontSize: 50, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 310,
                color: Color.fromARGB(255, 232, 240, 243),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      crossAxisCount: 4,
                      childAspectRatio: 1),
                  itemCount: AboutData().data.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                        color: MyApp.themeNotifier.value == ThemeMode.light
                            ? Colors.white.withOpacity(0.9)
                            : Colors.blueGrey.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                color: Color(0xff04c2c9),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              AboutData().data[index].icon,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                          Text(
                            AboutData().data[index].name,
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0, top: 10),
                            child: Text(AboutData().data[index].text),
                          ),
                        ]),
                  ),
                ),
              ),
            ],
          ),
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
            actionsAlignment: MainAxisAlignment.spaceBetween,
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
