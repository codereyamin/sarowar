// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

// import '../Firebase/contact.dart';

// class ContactPage extends StatefulWidget {
//   const ContactPage({super.key});

//   @override
//   State<ContactPage> createState() => _ContactPageState();
// }

// class _ContactPageState extends State<ContactPage> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   late TextEditingController emailController;
//   late TextEditingController nameController;
//   late TextEditingController messagesController;

//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     nameController = TextEditingController();
//     messagesController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     emailController.dispose();
//     nameController.dispose();
//     messagesController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Contact',
//             style:
//                 GoogleFonts.roboto(fontSize: 30, fontWeight: FontWeight.bold)),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
//         alignment: Alignment.center,
//         width: width,
//         height: height - 20,
//         child: Column(children: [
//           Form(
//             key: formKey,
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Container(
//                   padding: EdgeInsets.only(
//                     left: 10,
//                     bottom: 15,
//                   ),
//                   child: Text(
//                     'Your Name',
//                     style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
//                   )),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blueGrey, width: 3),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: TextFormField(
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) {
//                     if (value!.isEmpty || value == null) {
//                       return 'Please enter your user name.';
//                     }
//                   },
//                   controller: nameController,
//                   maxLines: 1,
//                   decoration: InputDecoration(
//                       hintText: 'Enter Your Name', border: InputBorder.none),
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.only(left: 10, bottom: 15, top: 15),
//                   child: Text(
//                     'Contact Email',
//                     style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
//                   )),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blueGrey, width: 3),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty || value == null) {
//                       return 'Please enter your user Email';
//                     }
//                   },
//                   controller: emailController,
//                   decoration: InputDecoration(
//                       hintText: 'Enter Your Email', border: InputBorder.none),
//                 ),
//               ),
//               Container(
//                   padding: EdgeInsets.only(left: 10, bottom: 15, top: 15),
//                   child: Text(
//                     'Messages',
//                     style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
//                   )),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.blueGrey, width: 3),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty || value == null) {
//                       return 'Please enter your Message';
//                     }
//                   },
//                   controller: messagesController,
//                   maxLines: 10,
//                   decoration: InputDecoration(
//                       hintText: 'Write Your Messages',
//                       border: InputBorder.none),
//                 ),
//               )
//             ]),
//           ),
//           Spacer(),
//           Padding(
//             padding: const EdgeInsets.only(left: 10.0, right: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       // Navigator.pop(context);
//                       final FormState? form = formKey.currentState;
//                     },
//                     child: Text(
//                       'Cancel',
//                       style: GoogleFonts.roboto(),
//                     )),
//                 ElevatedButton(
//                     onPressed: () async {
//                       bool result =
//                           await InternetConnectionCheckerPlus().hasConnection;

//                       if (nameController.toString().isNotEmpty &&
//                           emailController.toString().isNotEmpty &&
//                           messagesController.toString().isNotEmpty) {
//                         if (result == true) {
//                           Contact().contactMessage(nameController.text,
//                               emailController.text, messagesController.text);
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                             content: const Text(' No Internet Connection'),
//                             action:
//                                 SnackBarAction(label: "Ok", onPressed: () {}),
//                           ));
//                         }
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text("All feld requird"),
//                         ));
//                       }
//                     },
//                     child: Text(
//                       'Send',
//                       style: GoogleFonts.roboto(),
//                     )),
//               ],
//             ),
//           )
//         ]),
//       ),
//     );
//   }
//   //  void validateAndSave() {
//   //   final FormState form = _formkey.currentState;
//   //   if (form.validate()) {
//   //     print('Form is valid');
//   //   } else {
//   //     print('Form is invalid');
//   //   }
//   // }
// }
