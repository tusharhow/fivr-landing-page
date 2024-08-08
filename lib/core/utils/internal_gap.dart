import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

double gap(BuildContext context) => getValueForScreenType<double>(
      context: context,
      desktop: 20,
      tablet: 16,
      mobile: 16,
    );

SizedBox hGap(BuildContext context) => SizedBox(width: gap(context));
SizedBox vGap(BuildContext context) => SizedBox(height: gap(context));
Widget vGapBlack(BuildContext context) => ColoredBox(
      color: Colors.black,
      child: SizedBox(
        height: gap(context),
      ),
    );
