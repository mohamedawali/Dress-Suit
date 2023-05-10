import 'package:flutter/material.dart';

snackBar(int time, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        backgroundColor: Colors.lightBlue,
        content: Row(
          children: const [
            CircularProgressIndicator(
              color: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(left: 150),
              child: Text(
                'جاري التحميل',
                style: TextStyle(fontSize: 20, fontFamily: 'ar'),
              ),
            ),
          ],
        ),
        duration: Duration(seconds: time)),
  );
}