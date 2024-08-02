import 'package:fivr_landing_page/app/components/animated_box.dart';
import 'package:fivr_landing_page/core/utils/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          detectedKey: 'OUR TEAM TITLE',
          builder: (con, visible) => Column(
            children: [
              Row(
                key: AppKeys.teamKey,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 130,
                      top: 136,
                    ),
                    child: !visible
                        ? const SizedBox()
                        : SelectableText(
                            'Our Team',
                            style: GoogleFonts.bebasNeue(fontSize: 80.sp),
                          )
                            .animate()
                            .scaleX(
                                alignment: Alignment.centerLeft,
                                duration: 600.milliseconds)
                            .slideX(),
                  ),
                  600.horizontalSpace,
                  Expanded(
                    child: !visible
                        ? const SizedBox()
                        : Padding(
                            padding: EdgeInsets.only(top: 136.h),
                            child: SelectableText.rich(
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
                            ).animate().fadeIn(),
                          ),
                  ),
                  140.horizontalSpace,
                ],
              ),

              //, Arrows
              Padding(
                padding: const EdgeInsets.only(right: 156),
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
          detectedKey: 'OUR TEAM USERS',
          builder: (con, visible) => AspectRatio(
            aspectRatio: 1920 / 420,
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
