import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class verticalProductCard extends StatelessWidget {
  const verticalProductCard({super.key,});


  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IntrinsicWidth(
        child: Container(
          height: 80.h,
          decoration: BoxDecoration(
          color: CupertinoColors.activeBlue,
           borderRadius: BorderRadius.vertical(
           top: Radius.circular(35.r),
             bottom: Radius.circular(35.r),
        ),),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/images/thunderstorm.png",height: 40.h,),
                Text(
                  '50°',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
