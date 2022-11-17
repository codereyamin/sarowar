import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constent/aboutData.dart';
import '../main.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              'About',
              style:
                  GoogleFonts.roboto(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: height - 20,
              color: Color.fromARGB(255, 232, 240, 243),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 2,
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
      ),
    );
  }
}
