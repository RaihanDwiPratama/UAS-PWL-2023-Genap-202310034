import 'package:flutter/material.dart';
import 'package:nature_history/pages/detail/styles.dart';
import 'package:nature_history/utils/colors.dart';

class ContainerLeft extends StatelessWidget {
  const ContainerLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 25,
            color: AppColors.icons,
          ),
        ),
        SizedBox(height: 150),
        RichText(
          text: TextSpan(
            text: 'Find ',
            style: Styles.heading,
            children: <TextSpan>[
              TextSpan(text: 'knowledge ', style: Styles.subHeading),
              TextSpan(text: 'that\ninterests you,', style: Styles.heading),
            ],
          ),
        ),
        Container(
          width: 420,
          margin: EdgeInsets.only(top: 10),
          child: Text(
            "Here there is a lot of knowledge about flowers, both ornamental flowers and flowers that are only available in nature.",
            style: Styles.textDescription,
            maxLines: 3,
          ),
        ),
      ],
    );
  }
}
