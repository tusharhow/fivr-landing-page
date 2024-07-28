import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user_model.dart';
import 'tem_member_card.dart';

class OurTeamWidget extends HookConsumerWidget {
  const OurTeamWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    final scrollController = useScrollController();

    final List<User> users = [
      User(
          image: 'assets/images/user1.png',
          name: 'Alice',
          profession: 'Developer'),
      User(
          image: 'assets/images/user2.png',
          name: 'Bob',
          profession: 'Designer'),
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
      User(
          image: 'assets/images/user1.png', name: 'Fiona', profession: 'Sales'),
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

    void scrollLeft() {
      scrollController.animateTo(
        scrollController.offset - 200,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOut,
      );
    }

    void scrollRight() {
      scrollController.animateTo(
        scrollController.offset + 200,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Container(
      height: size.height * 1.5,
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
          stops: const [0.0, 0.58, 0.6, 0.6, 1.0],
        ),
      ),
      child: Column(
        children: [
          //, Our Team
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
                    scrollLeft();
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
                    scrollRight();
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
              controller: scrollController,
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
          SizedBox(
            height: size.height * 0.5,
            width: size.width,
            // color: Colors.black,
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
          ),
        ],
      ),
    );
  }
}
