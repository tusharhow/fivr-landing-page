import 'package:fivr_landing_page/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TeamMemberCardMobile extends HookConsumerWidget {
  final User user;

  const TeamMemberCardMobile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = useState(false);
    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: AnimatedScale(
        scale: isHovered.value ? 1.07 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              // height: 250,
              // width: 220,
              height: 384,
              width: 370,
              child: Image.asset(
                user.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.name,
              style: GoogleFonts.bebasNeue(
                fontSize: 35,
                color: Colors.white,
                letterSpacing: 3,
                height: 1.6,
              ),
            ),
            Text(
              user.profession,
              style: GoogleFonts.roboto(
                color: Colors.grey[300],
                fontSize: 22,
                height: 1,
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn()
          .flipV(begin: -.1, perspective: .5)
          .flipH(begin: -.1, perspective: .5),
    );
  }
}
