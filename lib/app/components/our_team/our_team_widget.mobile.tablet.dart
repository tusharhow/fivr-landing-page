import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../models/user_model.dart';
import 'widgets/arrows.dart';
import 'widgets/tem_member_card.mobile.dart';

class OurTeamMobileTabletWidget extends HookConsumerWidget {
  const OurTeamMobileTabletWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        scrollController.offset - 370,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    }

    void scrollRight() {
      scrollController.animateTo(
        scrollController.offset + 370,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    }

    return AnimatedBox(
      detectedKey: 'OUR TEAM TITLE',
      builder: (con, visible) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            key: AppKeys.teamKey,
            padding: getValueForScreenType(
              context: context,
              mobile: const EdgeInsets.only(
                left: 20,
                top: 66,
              ),
              tablet: const EdgeInsets.only(
                left: 36,
                top: 56,
                right: 36,
              ),
            ),
            child: !visible
                ? const SizedBox(height: 80)
                : Text(
                    'Our Team',
                    style: GoogleFonts.bebasNeue(fontSize: 60),
                  )
                    .animate()
                    .scaleX(
                      alignment: Alignment.centerLeft,
                      duration: 600.milliseconds,
                    )
                    .slideX(),
          ),
          const SizedBox(height: 15),
          !visible
              ? const SizedBox(height: 30)
              : Padding(
                  padding: getValueForScreenType(
                    context: context,
                    mobile:
                        const EdgeInsets.only(left: 20, top: 66, bottom: 32),
                    tablet: const EdgeInsets.only(
                        left: 36, top: 16, right: 42, bottom: 75),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: "                                ",
                      children: const [
                        TextSpan(
                          text:
                              "We're engineers, designers, strategists, and problem-solvers, united by a common goal: to deliver impactful technology solutions.",
                          mouseCursor: SystemMouseCursors.text,
                        ),
                      ],
                      style: GoogleFonts.roboto(
                        fontSize: 24,
                        height: 1.4,
                      ),
                    ),
                  ).animate().fadeIn(),
                ),

          //, Arrows
          Arrows(
            visible: visible,
            scrollLeft: () {
              scrollLeft();
            },
            scrollRight: () {
              scrollRight();
            },
          ),

          SizedBox(
            height: 490,
            child: !visible
                ? const SizedBox(height: 490)
                : ListView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    children: List.generate(
                      users.length,
                      (index) {
                        final user = users[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TeamMemberCardMobile(user: user),
                        );
                      },
                    )
                        .animate(
                            delay: 100.milliseconds, interval: 100.milliseconds)
                        .flipH()
                        .scale()
                        .fadeIn(),
                  ),
          ),
        ],
      ),
    );
  }
}
