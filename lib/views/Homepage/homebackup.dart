// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:restro_web/widgets/CenterdView/centeredView.dart';
// import 'package:restro_web/widgets/NavigationBar/navigationBar.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//           child: Column(
//         children: [
//           firstSection(context),
//           secondSection(context),
//         ],
//       )),
//     );
//   }

//   Container secondSection(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           children: [
//             // Background SVG
//             Positioned.fill(
//               child: SvgPicture.asset(
//                 'svgs/background2.svg', // Path to your SVG file
//                 fit: BoxFit.cover, // Adjust the fit as needed
//               ),
//             ),
//             // Foreground content
//           ],
//         ));
//   }

//   Container firstSection(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           children: [
//             // Background SVG
//             Positioned.fill(
//               child: SvgPicture.asset(
//                 'svgs/background1.svg', // Path to your SVG file
//                 fit: BoxFit.cover, // Adjust the fit as needed
//               ),
//             ),
//             // Foreground content
//             CenteredView(
//                 child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 NavigationBarC(),
//                 Expanded(
//                     child: Row(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 20),
//                       // color: Colors.grey.shade500,
//                       width: MediaQuery.of(context).size.width * 0.6,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(

//                               child: Text(
//                                 "AUTHENTIC MEDITERRANEAN \nCUISINE",
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.lato().fontFamily,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 14,
//                                     color: Color.fromRGBO(228, 198, 32, 1),
//                                     letterSpacing: 1.2),
//                               )),
//                                 Container(
//                                   margin: EdgeInsets.only(top: 5),

//                               child: Text(
//                                 "LaVie Mediterranean \nGrill",
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.montserrat().fontFamily,
//                                     fontWeight: FontWeight.w900,

//                                     fontSize: 32,
//                                     color: Colors.white,
//                                     letterSpacing: 1.2),
//                               )),
//                                Container(

//                               child: Text(
//                                 "Cras justo odio, dapibus ac facilisis in, egestas \neget quam etiam porta sem malesuada.",
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.montserrat().fontFamily,
//                                     fontWeight: FontWeight.w300,

//                                     fontSize: 22,
//                                     color: Colors.white,
//                                     letterSpacing: 1.2),
//                               )),
//                               Container(

//                               child: Text(
//                                 "more info",
//                                 style: TextStyle(
//                                     fontFamily: GoogleFonts.montserrat().fontFamily,
//                                     fontWeight: FontWeight.w300,

//                                     fontSize: 19,
//                                     color: Color.fromRGBO(228, 198, 32, 1),
//                                     letterSpacing: 1.2),
//                               )),
//                               Container(
//                                 // color: Colors.black,
//                                 width: 850,
//                                 height: 317,
//                                 child: Stack(
//                                   children: [
//                                     // Fading effect on the left and right
//                                     Positioned.fill(
//                                       child: ShaderMask(
//                                         shaderCallback: (Rect rect) {
//                                           return LinearGradient(
//                                             begin: Alignment.centerLeft,
//                                             end: Alignment.centerRight,
//                                             colors: [
//                                               Colors.white.withOpacity(0.9), // Match background
//                                               Colors.white,
//                                               Colors.white,
//                                               Colors.white.withOpacity(0.9), // Match background
//                                             ],
//                                             stops: [0.0, 0.1, 0.9, 1.0],
//                                           ).createShader(rect);
//                                         },
//                                         blendMode: BlendMode.dstIn,
//                                         child: PageView.builder(
//                                           controller: PageController(viewportFraction: 0.3),
//                                           itemCount: 5,
//                                           itemBuilder: (context, index) {
//                                             return carouselItem(index);
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       color: Colors.blue,
//                       child: Column(),
//                     ),
//                   ],
//                 ))
//               ],
//             )),
//           ],
//         ));
//   }

//     Widget carouselItem(int index) {
//     // Sample data for the carousel
//     final foodItems = ['Grill Kebab', 'Tornado Burger', 'Hummus', 'Fries', 'Pizza'];

//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           color: index == 1 ? Colors.white : Color(0xFFE8F5E9), // Taller item white, others light green
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black12,
//               blurRadius: 10,
//               offset: Offset(0, 5),
//             ),
//           ],
//         ),
//         width: 200,
//         height: index == 1 ? 300 : 250, // Main container is taller
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 100,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 foodItems[index],
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
