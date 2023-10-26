import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarFavPageContainer extends StatelessWidget {
  const AppBarFavPageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container( 
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 10,
            ),
            const Text('Select city'),
            SvgPicture.asset(
              "plus.svg",
              height: 30,
              width: 30,
            )
          ]
        ), 
      ),
    );
  }
}