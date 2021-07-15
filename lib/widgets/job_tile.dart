import 'package:flutter/material.dart';
import 'package:future_jobs/models/job_model.dart';
import 'package:future_jobs/pages/detail_page.dart';

import '../theme.dart';

class JobTile extends StatelessWidget {
  final JobModel jobModel;

  JobTile(this.jobModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(jobModel),
          ),
        );
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            jobModel.companyLogo,
            width: 44,
          ),
          SizedBox(
            width: 24,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobModel.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  jobModel.companyName,
                  style: greyTextStyle,
                ),
                SizedBox(
                  height: 18,
                ),
                Divider(
                  thickness: 1,
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
