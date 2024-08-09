import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterEmailText extends StatelessWidget {
  const FooterEmailText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 150.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          60.verticalSpace,
          SelectableText(
            'Sign up for our email list',
            style: GoogleFonts.bebasNeue(
              fontSize: 45.sp,
              color: Colors.white,
            ),
          )
              .animate(delay: 300.milliseconds)
              .fadeIn()
              .scaleX(alignment: Alignment.center),
          40.verticalSpace,
          SizedBox(
            width: 540.w,
            child: Theme(
              data: ThemeData(primaryColor: Colors.white),
              child: TextField(
                style: TextStyle(
                  fontSize: 25.sp,
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  hintText: 'Enter You Email',
                  hintStyle: TextStyle(
                    fontSize: 25.sp,
                    color: Colors.white,
                  ),
                  suffixIcon: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: Text(
                      'SENT',
                      style: GoogleFonts.bebasNeue(fontSize: 20.sp),
                    ),
                  ),
                ),
              )
                  .animate(delay: 300.milliseconds)
                  .fadeIn()
                  .scaleY(alignment: Alignment.center),
            ),
          ),
        ],
      ),
    );
  }
}
