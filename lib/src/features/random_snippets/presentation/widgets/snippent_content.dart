import '../../../../core/utils/app_palette.dart';
import '../../../../core/utils/app_size_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entities/snippet.dart';

class SnippetContent extends StatelessWidget {
  const SnippetContent({Key? key, required this.snippet}) : super(key: key);
  final Snippet snippet;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.r),
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppPalette.primary,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Text(
            snippet.content,
            style: TextStyle(color: Colors.white, height: 1.3, fontSize: 16.sp),
          ),
          10.heightBox,
          Text(
            snippet.author,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
