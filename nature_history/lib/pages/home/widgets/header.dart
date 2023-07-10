import 'package:flutter/material.dart';
import 'package:nature_history/pages/home/styles.dart';

Widget Header() {
  return Row(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RichText(
            text: TextSpan(
              text: 'Find ',
              style: Styles.textHeading,
              children: <TextSpan>[
                TextSpan(
                  text: 'knowledge ',
                  style: Styles.textHeadingPrimary,
                ),
                TextSpan(
                  text: 'that \ninterests you,',
                  style: Styles.textHeading,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 450,
            child: Text(
              "Here there is a lot of knowledge about flowers, both ornamental flowers and flowers that are only available in nature.",
              style: Styles.textDescription,
              maxLines: 3,
            ),
          )
        ],
      ),
      Spacer(),
      Container(
        padding: EdgeInsets.all(25),
        width: 400,
        decoration: Styles.containerBox,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                text: 'Wellcome,',
                style: Styles.textBoxHeading,
                children: <TextSpan>[
                  TextSpan(text: '\nSofia Eleane!', style: Styles.textBoxName),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "is there anything you want to find here?",
              style: Styles.textBoxDescription,
            ),
            SizedBox(height: 40),
            TextField(decoration: Styles.containerSearch)
          ],
        ),
      )
    ],
  );
}