import 'package:fivr_landing_page/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeamMemberCard extends StatefulWidget {
  final User user;

  const TeamMemberCard({super.key, required this.user});

  @override
  _TeamMemberCardState createState() => _TeamMemberCardState();
}

class _TeamMemberCardState extends State<TeamMemberCard> {
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
        child: Container(
         
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(

            children: [
              Image.asset(
                widget.user.image,
                height: 250,
                width: 220,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.user.name,
                  style:   GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 3,
                  ),
                  
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.user.profession,
                  style:  GoogleFonts.roboto(
                    color: Colors.grey[300],
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}