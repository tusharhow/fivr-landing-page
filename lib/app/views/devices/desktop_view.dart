import 'package:fivr_landing_page/app/components/vertical_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hover_animation/hover_animation.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  height: _size.height * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xff2051FF),
                        Color(0xffCDD4F0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            'FivR',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: _size.width * 0.04),
                            child: Text.rich(
                                strutStyle: StrutStyle(
                                    fontSize: _size.width * 0.05, height: 0.5),
                                TextSpan(
                                    text: 'INNOVATING FOR A\n',
                                    style: GoogleFonts.bebasNeue(
                                        fontSize: _size.width * 0.04,
                                        color: Colors.white),
                                    children: [
                                      TextSpan(
                                        text: 'SMARTER ',
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: _size.width * 0.04,
                                            color: Colors.white),
                                      ),
                                      TextSpan(
                                        text: 'TOMORROW',
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: _size.width * 0.04,
                                            color: Colors.black),
                                      ),
                                    ]))),
                      ),
                      SizedBox(
                        height: _size.height * 0.03,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: _size.width * 0.04),
                            child: Text.rich(
                                strutStyle: StrutStyle(
                                    fontSize: _size.width * 0.05, height: 0.01),
                                TextSpan(
                                    text:
                                        'At FivR, we believe in the power of technology\n',
                                    style: GoogleFonts.roboto(
                                        fontSize: _size.width * 0.01,
                                        color: Colors.black),
                                    children: [
                                      TextSpan(
                                        text:
                                            ' to transform lives and industries.  ',
                                        style: GoogleFonts.roboto(
                                            fontSize: _size.width * 0.01,
                                            color: Colors.white),
                                      ),
                                    ]))),
                      ),
                      SizedBox(
                        height: _size.height * 0.07,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: _size.width * 0.04),
                          child: HoverAnimation(
                            primaryColor: Colors.black,
                            hoverColor: Color(0xff2051FF),
                            size: const Size(180, 60),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                            onTap: () {},
                            child: Center(
                              child: Text(
                                'CONTACT US',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Container(
                  color: Colors.black,
                  height: _size.height * 0.7,
                  child: VerticalTextMenu(),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  height: _size.height * 0.61,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: _size.width * 0.08,
                          vertical: _size.height * 0.05),
                      child: Text(
                        "At FIVR, we are driven by the vision to revolutionize the way businesses operate across various sectors. Our mission is to deliver cutting-edge technology solutions that streamline logistics, enhance healthcare services, optimize financial operations, and transform educational experiences.",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: _size.height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: _size.height * 0.06,
                                left: _size.width * 0.02),
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 10),
                                Text('Our Mission',
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.white, fontSize: 20)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16 * 2),
                          Padding(
                            padding: EdgeInsets.only(
                                left: _size.width * 0.02,
                                right: _size.width * 0.03),
                            child: Text(
                              "At FivR, our mission is to drive innovation and efficiency across key sectors. We harness cutting-edge technology to solve complex challenges in logistics, healthcare, finance, and education. Our dedicated team works tirelessly to deliver scalable solutions that empower businesses and foster sustainable growth.",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: _size.height * 0.3,
                      color: Colors.green,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: _size.height * 0.05,
                                left: _size.width * 0.02),
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 10),
                                Text('Our Vision',
                                    style: GoogleFonts.bebasNeue(
                                        color: Colors.black, fontSize: 20)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16 * 2),
                          Padding(
                            padding: EdgeInsets.only(
                                left: _size.width * 0.02,
                                right: _size.width * 0.03),
                            child: Text(
                              "Our vision is to be the cornerstone of technological advancement, shaping the future of industry and commerce. We aim to create a world where seamless integration of technology solutions makes life easier, healthier, and more prosperous for all. ",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: _size.height * 0.70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/img3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Container(
                  height: _size.height * 0.7,
                  color: Color(0xff3B0D3C),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: _size.height * 0.07, left: _size.width * 0.05),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Our Focus Areas:',
                            style: GoogleFonts.bebasNeue(
                              color: Colors.white,
                              fontSize: _size.width * 0.02,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16 * 2),
                      Padding(
                        padding: EdgeInsets.only(
                            left: _size.width * 0.1,
                            right: _size.width * 0.03),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/box.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 16 * 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Logistics:',
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.015,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Revolutionizing supply chain management with AI-driven analytics and predictive modeling.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.01,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: Colors.white30,
                        thickness: 1,
                        indent: _size.width * 0.09,
                        endIndent: _size.width * 0.09,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.only(
                            left: _size.width * 0.09,
                            right: _size.width * 0.03),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/health.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 16 * 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Healthcare:',
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.015,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Empowering providers and patients with telemedicine platforms and personalized care.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.01,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: Colors.white30,
                        thickness: 1,
                        indent: _size.width * 0.09,
                        endIndent: _size.width * 0.09,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.only(
                            left: _size.width * 0.09,
                            right: _size.width * 0.03),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/finance.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 16 * 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Finance:',
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.015,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Securing transactions and financial data with blockchain technology and advanced cybersecurity.",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.01,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Divider(
                        color: Colors.white30,
                        thickness: 1,
                        indent: _size.width * 0.09,
                        endIndent: _size.width * 0.09,
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: EdgeInsets.only(
                            left: _size.width * 0.09,
                            right: _size.width * 0.03),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/education.svg',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(width: 16 * 2),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Education:',
                                  style: GoogleFonts.bebasNeue(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.015,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Shaping the future of learning through immersive educational technologies and e-learning tools",
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                    fontSize: _size.width * 0.01,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          
        ],
      ),
    ));
  }
}

// class CustomButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         print('Button Pressed');
//       },
//       child: ClipPath(
//         clipper: CustomClipperPath(),
//         child: Container(
//           color: Colors.black,
//           width: 200,
//           padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
//           child: Center(
//             child: Text(
//               'CONTACT US',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CustomClipperPath extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     path.moveTo(0, 0);
//     path.lineTo(size.width - 16, 0); // Cut top right corner
//     path.lineTo(size.width, 20);
//     path.lineTo(size.width, size.height);
//     path.lineTo(16, size.height); // Cut bottom left corner
//     path.lineTo(0, size.height - 20);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return false;
//   }
// }
