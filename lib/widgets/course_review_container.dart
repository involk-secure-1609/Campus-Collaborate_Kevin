import 'package:flutter/material.dart';

import '../screens/course_review_comments.dart';
import 'commonWidgets/common_container.dart';
import 'commonWidgets/skills_container.dart';

class CourseReviewContainer extends StatelessWidget {
  final String title;
  final String course;
  final String review;
  final String user;
  final String comments_size;
  final String rating;

  const CourseReviewContainer(
      {super.key,
      required this.title,
      required this.course,
      required this.review,
      required this.user,
      required this.comments_size,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      // Navigate to the CourseReviewScreen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CourseReviewComments(title: title, course: course, review: review, user: user, comments_size: comments_size)),
      );
    },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CommonContainer(
          children: [
            SkillContainer(skill: course),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(238, 238, 238, 1),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Image.asset(
                  'assets/circular_user.png',
                  height: 15,
                  width: 15,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  user,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              review,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(238, 238, 238, 1),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                GestureDetector(
                  child: const Icon(
                    Icons.keyboard_double_arrow_up_sharp,
                    size: 25,
                    color: Colors.green,
                  ),
                  onTap: (){},
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: const Icon(
                    Icons.keyboard_double_arrow_down_sharp,
                    size: 25,
                    color: Colors.red,
                  ),
                  onTap: (){},
                ),
                const SizedBox(
                  width: 130,
                ),
                Text(
                  comments_size,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color.fromRGBO(238, 238, 238, 1),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Image.asset(
                  'assets/comment_bubble.png',
                  height: 16,
                  width: 16,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
