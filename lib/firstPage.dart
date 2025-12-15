// import 'package:flutter/material.dart';

// class Firstpage extends StatelessWidget {
//   const Firstpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Container(
//         child: Column(
//           children: [
//             SizedBox(height: 120.0),
//             Center(
//               child: Image.asset(
//                 "images/OIP.jpg",
//                 height: 200,
//                 width: 200,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             SizedBox(height: 30.0),

//             Text(
//               "From Bowl to Soul We've Got IT All",
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//             ),

//             SizedBox(height: 30.0),

//             Padding(
//               padding: EdgeInsets.only(left: 20.0, right: 20.0),
//               child: Text(
//                 "Buy the Best food packate with health and nutriltion for your beloved pet",

//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.black54,
//                   fontSize: 18.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),

//             SizedBox(height: 50.0),

//             Container(
//               height: 60,
//               width: 360,
//               decoration: BoxDecoration(
//                 color: Color.fromRGBO(21, 134, 110, 1),
//                 borderRadius: BorderRadius.circular(120),
//               ),
//               child: Center(
//                 child: Text(
//                   "Create Account",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),

//             SizedBox(height: 20),
//             Container(
//               height: 60,
//               width: 360,
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Color.fromRGBO(21, 134, 110, 1), // your color
//                   width: 2, // border thickness
//                 ),

//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(120),
//               ),

//               child: Center(
//                 child: Text(
//                   "Create Account",
//                   style: TextStyle(color: Color.fromRGBO(21, 134, 110, 1)),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class Firstpage extends StatelessWidget {
  const Firstpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          children: [
            //  full cover image
            Container(
              width: double.infinity,
              height: 350,
              child: Image.asset(
                "images/Screenshot 2025-12-15 113527.png",
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(height: 30.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "From Bowl to Soul We've Got IT All",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),

            SizedBox(height: 30.0),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Buy the Best food packate with health and nutriltion for your beloved pet",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            SizedBox(height: 50.0),

            // Filled Button
            Container(
              height: 50,
              width: 360,
              decoration: BoxDecoration(
                color: Color.fromRGBO(21, 134, 110, 1),
                borderRadius: BorderRadius.circular(120),
              ),
              child: Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Outlined Button
            Container(
              height: 60,
              width: 360,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromRGBO(21, 134, 110, 1),
                  width: 2,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(120),
              ),
              child: Center(
                child: Text(
                  "Create Account",
                  style: TextStyle(
                    color: Color.fromRGBO(21, 134, 110, 1),
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
