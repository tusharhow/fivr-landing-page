import 'package:fivr_landing_page/app/components/fade_transition.dart';
import 'package:fivr_landing_page/app/components/hoverable_container.dart';
import 'package:fivr_landing_page/app/components/tem_member_card.dart';
import 'package:fivr_landing_page/app/components/text_animation.dart';
import 'package:fivr_landing_page/app/components/vertical_menu.dart';
import 'package:fivr_landing_page/app/models/user_model.dart';
import 'package:fivr_landing_page/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hover_animation/hover_animation.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final List<User> users = [
    User(
        image: 'assets/images/user1.png',
        name: 'Alice',
        profession: 'Developer'),
    User(image: 'assets/images/user2.png', name: 'Bob', profession: 'Designer'),
    User(
        image: 'assets/images/user3.png',
        name: 'Charlie',
        profession: 'Product Manager'),
    User(
        image: 'assets/images/user4.png',
        name: 'Diana',
        profession: 'Marketing'),
    User(
        image: 'assets/images/user1.png',
        name: 'Edward',
        profession: 'Analyst'),
    User(image: 'assets/images/user1.png', name: 'Fiona', profession: 'Sales'),
    User(image: 'assets/images/user1.png', name: 'George', profession: 'HR'),
    User(
        image: 'assets/images/user1.png',
        name: 'Hannah',
        profession: 'Customer Support'),
    User(
        image: 'assets/images/user1.png',
        name: 'Ian',
        profession: 'Consultant'),
    User(
        image: 'assets/images/user1.png',
        name: 'Jack',
        profession: 'Team Lead'),
  ];
  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 200,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: 1,
                  child: FadeAnimation(
                    intervalStart: 0.1,
                    child: Container(
                      height: _size.height * 0.7,
                      decoration: const BoxDecoration(
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
                          const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.all(40.0),
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
                                padding:
                                    EdgeInsets.only(left: _size.width * 0.04),
                                child: Text.rich(
                                    strutStyle: StrutStyle(
                                        fontSize: _size.width * 0.05,
                                        height: 0.5),
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
                                padding:
                                    EdgeInsets.only(left: _size.width * 0.04),
                                child: Text.rich(
                                    strutStyle: StrutStyle(
                                        fontSize: _size.width * 0.05,
                                        height: 0.01),
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
                              padding:
                                  EdgeInsets.only(left: _size.width * 0.04),
                              child: HoverAnimation(
                                primaryColor: Colors.black,
                                hoverColor: const Color(0xff2051FF),
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
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1000),
                opacity: 1,
                child: FadeAnimation(
                  intervalStart: 0.1,
                  child: Container(
                    color: Colors.black,
                    height: _size.height * 0.7,
                    child: const VerticalTextMenu(),
                  ),
                ),
              ))
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: 1,
                  child: FadeAnimation(
                    intervalStart: 0.2,
                    child: Container(
                      height: _size.height * 0.61,
                      decoration: const BoxDecoration(
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
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 1000),
                      opacity: 1,
                      child: FadeAnimation(
                        intervalStart: 0.3,
                        child: Container(
                          height: _size.height * 0.3,
                          decoration: const BoxDecoration(
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
                                    const SizedBox(width: 10),
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
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 1000),
                      opacity: 1,
                      child: FadeAnimation(
                        intervalStart: 0.4,
                        child: Container(
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
                                    const SizedBox(width: 10),
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
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: 1,
                  child: FadeAnimation(
                    intervalStart: 0.5,
                    child: Container(
                      height: _size.height * 0.75,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/img3.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: 1,
                  child: FadeAnimation(
                    intervalStart: 0.6,
                    child: Container(
                      height: _size.height * 0.75,
                      color: const Color(0xff3B0D3C),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: _size.height * 0.07,
                                left: _size.width * 0.05),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Our Focus Areas:',
                                style: GoogleFonts.bebasNeue(
                                  color: Colors.white,
                                  fontSize: _size.width * 0.025,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: _size.width * 0.09),
                            child: Column(
                              children: [
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/box.svg',
                                  'Logistics:',
                                  'Revolutionizing supply chain management with AI-driven analytics and predictive modeling.',
                                ),
                                buildDivider(_size),
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/health.svg',
                                  'Healthcare:',
                                  'Empowering providers and patients with telemedicine platforms and personalized care.',
                                ),
                                buildDivider(_size),
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/finance.svg',
                                  'Finance:',
                                  'Securing transactions and financial data with blockchain technology and advanced cybersecurity.',
                                ),
                                buildDivider(_size),
                                buildHoverableFocusArea(
                                  context,
                                  'assets/icons/education.svg',
                                  'Education:',
                                  'Shaping the future of learning through immersive educational technologies and e-learning tools.',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            height: _size.height * 0.8,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                  Colors.white.withOpacity(0.0),
                  Colors.black.withOpacity(0.0),
                  Colors.black,
                ],
                stops: [0.0, 0.58, 0.6, 0.6, 1.0],
              ),
            ),
            child: Column(
              children: [
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: 1,
                  child: FadeAnimation(
                    intervalStart: 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: _size.width * 0.1,
                            top: _size.width * 0.055,
                          ),
                          child: Text(
                            'Our Team',
                            style: GoogleFonts.bebasNeue(fontSize: 40),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            right: _size.width * 0.1,
                            top: _size.width * 0.055,
                          ),
                          child: Text(
                            "We're engineers, designers, strategists, and problem-solvers, united\nby a common goal: to deliver impactful technology solutions.",
                            style: GoogleFonts.roboto(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16 * 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _scrollLeft();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/left_arrow.svg',
                          height: 15,
                          width: 15,
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          _scrollRight();
                        },
                        child: SvgPicture.asset(
                          'assets/icons/right_arrow.svg',
                          height: 15,
                          width: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.065,
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 1000),
                  opacity: 1,
                  child: FadeAnimation(
                    intervalStart: 0.8,
                    child: SizedBox(
                      height: 350,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TeamMemberCard(user: user),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: _size.height * 0.5,
            width: _size.width,
            color: Colors.black,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: _size.width * 0.1,
                    top: _size.width * 0.055,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Our portfolio',
                      style: GoogleFonts.bebasNeue(
                          fontSize: 40, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: _size.height * 0.065,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  Widget buildHoverableFocusArea(
      BuildContext context, String iconPath, String title, String description) {
    Size _size = MediaQuery.of(context).size;

    return HoverableContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              iconPath,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: _size.width * 0.015,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: _size.width * 0.0085,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDivider(Size _size) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Divider(
          color: Colors.white30,
          thickness: 1,
          indent: _size.width * 0.01,
          endIndent: _size.width * 0.014,
        ),
        const SizedBox(height: 10),
      ],
    );
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
