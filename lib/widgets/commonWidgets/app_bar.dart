import 'package:campuscollaborate/constants/themes.dart';
import 'package:campuscollaborate/locator.dart';
import 'package:flutter/material.dart';

PreferredSize customAppBar(String title, {bool vertRequired=true}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: AppBar(
      backgroundColor: Themes.getColors(ColorsValues.LIGHT_GREY_COLOR),
      leading: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            GestureDetector(
              child: Image.asset(
                'assets/back_arrow.png',
              ),
              onTap: () {
                navigationService.pop();
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ],
        ),
      ),
      actions: [
        vertRequired==true?GestureDetector(
            child: Icon(
              Icons.more_vert,
              color: Themes.getColors(ColorsValues.ORANGE_COLOR),
              size: 30,
            )):const SizedBox(width: 0,)
      ],
      leadingWidth: double.infinity,
      elevation: 0,
    ),
  );
}
