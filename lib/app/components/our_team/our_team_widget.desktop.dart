import 'package:auto_size_text/auto_size_text.dart';
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
import 'widgets/tem_member_card.dart';

class OurTeamDesktopWidget extends HookConsumerWidget {
  const OurTeamDesktopWidget({super.key});

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
        scrollController.offset - 284,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    }

    void scrollRight() {
      scrollController.animateTo(
        scrollController.offset + 284,
        duration: const Duration(milliseconds: 800),
        curve: Curves.fastOutSlowIn,
      );
    }

    return Column(
      children: [
        //, Our Team
        AnimatedBox(
          detectedKey: 'OUR TEAM TITLE DEK',
          builder: (con, visible) => Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 136.w,
                  left: 130.w,
                  right: 140.w,
                  bottom: 40,
                ),
                child: Row(
                  key: AppKeys.teamKey,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    !visible
                        ? const SizedBox()
                        : AutoSizeText(
                            'Our Team',
                            style: GoogleFonts.bebasNeue(fontSize: 80),
                          )
                            .animate()
                            .scaleX(
                                alignment: Alignment.centerLeft,
                                duration: 600.milliseconds)
                            .slideX(),
                    // SizedBox(width: 600.w),
                    SizedBox(
                      width: 790.w,
                      child: !visible
                          ? const SizedBox()
                          : AutoSizeText.rich(
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
                                  fontSize: 35.sp,
                                  height: 1.6,
                                ),
                                mouseCursor: SystemMouseCursors.text,
                              ),
                              maxLines: 4,
                            ).animate().fadeIn(),
                    ),
                  ],
                ),
              ),

              //, Arrows
              Padding(
                padding: EdgeInsets.only(right: 156.w),
                child: !visible
                    ? SizedBox(height: 15.h)
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
            ],
          ),
        ),

        45.verticalSpace,

        AnimatedBox(
          detectedKey: 'OUR TEAM USERS DEK',
          builder: (con, visible) => AspectRatio(
            aspectRatio: 1920.w / 420,
            child: !visible
                ? const SizedBox(height: 15)
                : ListView.separated(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return TeamMemberCard(user: user);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 64),
                  ),
          ),
        ),
      ],
    );
  }
}
