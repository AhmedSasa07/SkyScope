import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class sectionHeadings extends StatelessWidget {
  const sectionHeadings({
    super.key, required this.title, this.buttonTitle = "See all",  required this.color, required this.showActionButton, this.onPressed,
  });
  final String title , buttonTitle;
  final Color color;
  final bool showActionButton;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //first title
          Text(title,
            style:TextStyle(color: color,fontSize: 22.h,fontWeight: FontWeight.w600,) ,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          TextButton(onPressed: onPressed,
              child: Row(
                children: [
                  Text(buttonTitle,
                    style:TextStyle(color: color,fontSize: 14.h,fontWeight: FontWeight.w500,) ,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,),
                  SizedBox(width: 7.w,),
                  if (showActionButton) Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(228, 228, 228, 0.52),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.transparent),
                    ),
                    child: Icon(
                      color: Colors.black,
                      Icons.arrow_forward_ios_rounded,
                      size: 16.sp,
                    ),
                  )
                ],
              ))

        ],
      ),
    );
  }
}