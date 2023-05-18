import 'package:elera/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryChips extends StatelessWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.w),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 12.w,
          runAlignment: WrapAlignment.start,
          children: [
            ChoiceChip(
              selectedColor: AppColors.primaryColor,
              label: Text(
                'All',
              ),
              selected: true,
              onSelected: (value) {},
            ),
            Chip(
              label: Text('3D Design'),
            ),
            Chip(
              label: Text('Business'),
            ),
            Chip(
              label: Text('Programming'),
            ),
          ],
        ),
      ),
    );
  }
}
