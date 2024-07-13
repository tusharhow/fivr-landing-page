import 'package:fivr_landing_page/app/components/hoverable_container.dart';
import 'package:fivr_landing_page/app/components/tem_member_card.dart';
import 'package:fivr_landing_page/app/components/vertical_menu.dart';
import 'package:fivr_landing_page/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hover_animation/hover_animation.dart';
import 'package:visibility_detector/visibility_detector.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  final List<Widget> _widgets = [];
  final Set<int> _loadedWidgetIndices = {};
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);

    // Initialize the list with placeholders
    for (int i = 0; i < 9; i++) {
      _widgets.add(_buildPlaceholderWidget(i));
    }
  }

  void _scrollListener() {
    // Detect which widgets are in view
    for (int index = 0; index < _widgets.length; index++) {
      if (!_loadedWidgetIndices.contains(index) && _isWidgetInView(index)) {
        _loadWidget(index);
      }
    }
  }

  bool _isWidgetInView(int index) {
    final double itemPosition =
        index * 100.0; // Assuming each widget has a fixed height of 100
    final double viewportHeight = _scrollController.position.viewportDimension;
    final double offset = _scrollController.offset;

    return itemPosition >= offset - viewportHeight &&
        itemPosition <= offset + viewportHeight;
  }

  Widget buildHoverableFocusArea(
      BuildContext context, String iconPath, String title, String description) {
    Size size = MediaQuery.of(context).size;

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
                      fontSize: size.width * 0.015,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: size.width * 0.0085,
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

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 200,
      duration: const Duration(milliseconds: 1000),
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

  Widget buildDivider(Size size) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Divider(
          color: Colors.white30,
          thickness: 1,
          indent: size.width * 0.01,
          endIndent: size.width * 0.014,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPlaceholderWidget(int index) {
    return VisibilityDetector(
      key: Key('placeholder-$index'),
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0 &&
            !_loadedWidgetIndices.contains(index)) {
          _loadWidget(index);
        }
      },
      child: Container(
        height: 100, // Placeholder height
        color: Colors.grey[300],
        child: Center(child: Text('Loading $index...')),
      ),
    );
  }

  void _loadWidget(int index) {
    if (_loadedWidgetIndices.contains(index)) return;

    setState(() {
      _loadedWidgetIndices.add(index); // Mark widget as loaded
      _widgets[index] =
          _buildActualWidget(index); // Replace placeholder with actual widget
    });
  }

  Widget _buildActualWidget(int index) {
    final size = MediaQuery.of(context).size;
    Widget child;

    switch (index) {
      case 0:
        child = Row(
          children: [
            Expanded(
              flex: 10,
              child: Container(
                height: size.height * 0.7,
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
                      height: size.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.04),
                        child: Text.rich(
                          strutStyle: StrutStyle(
                              fontSize: size.width * 0.05, height: 0.5),
                          TextSpan(
                            text: 'INNOVATING FOR A\n',
                            style: GoogleFonts.bebasNeue(
                                fontSize: size.width * 0.04,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                text: 'SMARTER ',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: size.width * 0.04,
                                    color: Colors.white),
                              ),
                              TextSpan(
                                text: 'TOMORROW',
                                style: GoogleFonts.bebasNeue(
                                    fontSize: size.width * 0.04,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.04),
                        child: Text.rich(
                          strutStyle: StrutStyle(
                              fontSize: size.width * 0.05, height: 0.01),
                          TextSpan(
                            text:
                                'At FivR, we believe in the power of technology\n',
                            style: GoogleFonts.roboto(
                                fontSize: size.width * 0.01,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                text: ' to transform lives and industries.  ',
                                style: GoogleFonts.roboto(
                                    fontSize: size.width * 0.01,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.07,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: size.width * 0.04),
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
            const SizedBox(width: 10),
            Expanded(
              child: Container(
                color: Colors.black,
                height: size.height * 0.7,
                child: const VerticalTextMenu(),
              ),
            ),
          ],
        );
        break;
      case 1:
        child = Column(
          children: [
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: size.height * 0.61,
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
                            horizontal: size.width * 0.08,
                            vertical: size.height * 0.05),
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
                const SizedBox(width: 10),
                Expanded(
                    child: Column(
                  children: [
                    Container(
                      height: size.height * 0.3,
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
                                top: size.height * 0.06,
                                left: size.width * 0.02),
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
                                left: size.width * 0.02,
                                right: size.width * 0.03),
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
                    const SizedBox(height: 10),
                    Container(
                      height: size.height * 0.3,
                      color: Colors.green,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.05,
                                left: size.width * 0.02),
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
                                left: size.width * 0.02,
                                right: size.width * 0.03),
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
                ))
              ],
            ),
          ],
        );
        break;
      case 2:
        child = Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: size.height * 0.75,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/img3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: size.height * 0.75,
                    color: const Color(0xff3B0D3C),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.07, left: size.width * 0.05),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Our Focus Areas:',
                              style: GoogleFonts.bebasNeue(
                                color: Colors.white,
                                fontSize: size.width * 0.025,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.09),
                          child: Column(
                            children: [
                              buildHoverableFocusArea(
                                context,
                                'assets/icons/box.svg',
                                'Logistics:',
                                'Revolutionizing supply chain management with AI-driven analytics and predictive modeling.',
                              ),
                              buildDivider(size),
                              buildHoverableFocusArea(
                                context,
                                'assets/icons/health.svg',
                                'Healthcare:',
                                'Empowering providers and patients with telemedicine platforms and personalized care.',
                              ),
                              buildDivider(size),
                              buildHoverableFocusArea(
                                context,
                                'assets/icons/finance.svg',
                                'Finance:',
                                'Securing transactions and financial data with blockchain technology and advanced cybersecurity.',
                              ),
                              buildDivider(size),
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
              ],
            ),
          ],
        );
        break;
      case 3:
        child = Column(
          children: [
            const SizedBox(height: 10),
            Container(
              height: size.height * 0.8,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: size.width * 0.1,
                          top: size.width * 0.055,
                        ),
                        child: Text(
                          'Our Team',
                          style: GoogleFonts.bebasNeue(fontSize: 40),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: size.width * 0.1,
                          top: size.width * 0.055,
                        ),
                        child: Text(
                          "We're engineers, designers, strategists, and problem-solvers, united\nby a common goal: to deliver impactful technology solutions.",
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.15,
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
                    height: size.height * 0.065,
                  ),
                  SizedBox(
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
                ],
              ),
            ),
          ],
        );
        break;
      case 4:
        child = Column(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width,
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: size.width * 0.1,
                      top: size.width * 0.055,
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
                    height: size.height * 0.065,
                  ),
                ],
              ),
            )
          ],
        );
        break;
      case 5:
        child = Container(
          color: Colors.orange,
          height: size.height * 0.1,
          width: size.width * 0.8,
          child: Center(child: Text('Orange Container')),
        );
        break;
      case 6:
        child = Container(
          color: Colors.teal,
          height: size.height * 0.1,
          width: size.width * 0.8,
          child: Center(child: Text('Teal Container')),
        );
        break;
      case 7:
        child = Container(
          color: Colors.pink,
          height: size.height * 0.1,
          width: size.width * 0.8,
          child: Center(child: Text('Pink Container')),
        );
        break;
      case 8:
        child = Container(
          color: Colors.brown,
          height: size.height * 0.1,
          width: size.width * 0.8,
          child: Center(child: Text('Brown Container')),
        );
        break;
      default:
        child = Container(
          color: Colors.grey,
          height: size.height * 0.1,
          width: size.width * 0.8,
          child: Center(child: Text('Grey Container')),
        );
    }

    return _FadeInWidget(
      key: Key('widget-$index'),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: _widgets,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class _FadeInWidget extends StatefulWidget {
  final Widget child;

  const _FadeInWidget({required Key key, required this.child})
      : super(key: key);

  @override
  __FadeInWidgetState createState() => __FadeInWidgetState();
}

class __FadeInWidgetState extends State<_FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isVisible = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: widget.key!,
      onVisibilityChanged: (visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0 && !_isVisible) {
          _controller.forward();
          setState(() {
            _isVisible = true;
          });
        } else if (visibilityInfo.visibleFraction == 0 && _isVisible) {
          _controller.reset();
          setState(() {
            _isVisible = false;
          });
        }
      },
      child: FadeTransition(
        opacity: _animation,
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
