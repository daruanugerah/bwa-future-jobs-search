import 'package:flutter/material.dart';
import 'package:future_jobs/models/category_model.dart';
import 'package:future_jobs/pages/category_page.dart';

import '../theme.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryCard(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              categoryModel,
            ),
          ),
        );
      },
      child: Container(
        width: 150,
        height: 200,
        margin: EdgeInsets.only(right: defaultMargin),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              categoryModel.imageUrl,
            ),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            categoryModel.name,
            style: whiteTextStyle.copyWith(
              fontSize: 18,
              fontWeight: medium,
            ),
          ),
        ),
      ),
    );
  }
}
