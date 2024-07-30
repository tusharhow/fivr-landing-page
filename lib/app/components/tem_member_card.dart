import 'package:fivr_landing_page/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamMemberCard extends StatefulWidget {
  final User user;

  const TeamMemberCard({super.key, required this.user});

  @override
  TeamMemberCardState createState() => TeamMemberCardState();
}

class TeamMemberCardState extends State<TeamMemberCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: 220,
              child: AspectRatio(
                aspectRatio: 384 / 370,
                child: Image.asset(
                  widget.user.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SelectableText(
              widget.user.name,
              style: GoogleFonts.bebasNeue(
                fontSize: 20,
                color: Colors.white,
                letterSpacing: 3,
              ),
            ),
            SelectableText(
              widget.user.profession,
              style: GoogleFonts.roboto(
                color: Colors.grey[300],
                fontSize: 13,
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn()
          .flipV(begin: -.05, perspective: .5)
          .flipH(begin: -.05, perspective: .5),
    );
  }
}
