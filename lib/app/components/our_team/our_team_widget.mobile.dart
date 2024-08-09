import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user_model.dart';
import 'widgets/tem_member_card.mobile.dart';

class OurTeamMobileWidget extends HookConsumerWidget {
  const OurTeamMobileWidget({super.key});

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
        key: AppKeys.teamKey,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 66,
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
                  padding: const EdgeInsets.only(left: 20, right: 10),
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
          const SizedBox(height: 32),

          //, Arrows
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: !visible
                ? const SizedBox(height: 30)
                : Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          scrollLeft();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset(
                            'assets/icons/left_arrow.svg',
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                      16.horizontalSpace,
                      InkWell(
                        onTap: () {
                          scrollRight();
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset(
                            'assets/icons/right_arrow.svg',
                            height: 15.h,
                            width: 15.w,
                          ),
                        ),
                      ),
                    ],
                  )
                    .animate()
                    .fadeIn()
                    .scaleX(
                        alignment: Alignment.centerRight,
                        duration: 600.milliseconds)
                    .slideX(begin: 1, end: 0),
          ),
          const SizedBox(height: 25),
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
