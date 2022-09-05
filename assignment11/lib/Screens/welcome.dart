// import '../components/background.dart';
// import 'package:flutter/material.dart';
// import '../components/roundButton.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

// class Welcome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           CustomPaint(
//             size: MediaQuery.of(context).size,
//             painter: Background(),
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Hero(
//                       tag: 'logo',
//                       child: Container(
//                         width: 50,
//                         child: Image.asset(
//                           'assets/icons/logo.png',
//                           fit: BoxFit.scaleDown,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 4),
//                     AnimatedTextKit(
//                       animatedTexts: [
//                         TypewriterAnimatedText(
//                           'Expense Tracker',
//                           textStyle: TextStyle(
//                             fontSize: 35.0,
//                             fontWeight: FontWeight.w900,
//                           ),
//                           speed: Duration(milliseconds: 150),
//                         )
//                       ],
//                       repeatForever: true,
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 48.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Hero(
//                       tag: 'sign-up',
//                       child: RoundButton(
//                         color: Colors.green.shade600,
//                         onPressed: () =>
//                             Navigator.pushNamed(context, '/signup'),
//                         title: 'SIGN UP',
//                       ),
//                     ),
//                     Hero(
//                       tag: 'login',
//                       child: RoundButton(
//                         color: Colors.lightGreen.shade900,
//                         onPressed: () => Navigator.pushNamed(context, '/login'),
//                         title: 'LOGIN',
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
