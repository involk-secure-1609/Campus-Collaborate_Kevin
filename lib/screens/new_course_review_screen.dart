import 'package:campuscollaborate/widgets/commonWidgets/app_bar.dart';
import 'package:flutter/material.dart';

class CourseReview extends StatefulWidget {
  const CourseReview({super.key});

  @override
  CourseReviewState createState() => CourseReviewState();
}

class CourseReviewState extends State<CourseReview> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('New Course Review'),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Course Code and Name',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: textController1,
                    decoration: InputDecoration(
                      hintText: 'Course Code:Code Name',
                      filled: true,
                      fillColor: const Color.fromRGBO(85, 85, 85, 1),
                      // Set the desired grey color
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        // Set text color to white
                        fontSize: 16, // Set the desired font size
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Set the radius to 10 pixels
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      // You can also adjust the input text style if needed
                      // hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Review Title',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                child: SizedBox(
                  height: 50,
                  width: 300,
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    controller: textController2,
                    decoration: InputDecoration(
                      hintText: 'Title for your review',
                      filled: true,
                      fillColor: const Color.fromRGBO(85, 85, 85, 1),
                      // Set the desired grey color
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        // Set text color to white
                        fontSize: 16, // Set the desired font size
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Set the radius to 10 pixels
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      // You can also adjust the input text style if needed
                      // hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Review Description',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                child: SizedBox(
                  height: 200,
                  width: 300,
                  child: TextField(
                    maxLines: 6,
                    style: const TextStyle(color: Colors.white),
                    controller: textController3,
                    decoration: InputDecoration(
                      hintText: 'Full Review Content',
                      filled: true,
                      fillColor: const Color.fromRGBO(85, 85, 85, 1),
                      // Set the desired grey color
                      hintStyle: const TextStyle(
                        color: Color.fromRGBO(170, 170, 170, 1),
                        // Set text color to white
                        fontSize: 16, // Set the desired font size
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        // Set the radius to 10 pixels
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      // You can also adjust the input text style if needed
                      // hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(45, 15, 10, 0),
                child: GestureDetector(
                  onTap: () {
                    // Handle the tap event
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(224, 140, 56, 1),
                      borderRadius: BorderRadius.circular(
                          100.0), // Set the radius to 100 pixels
                    ),
                    child: const Center(
                      child: Text(
                        'PUBLISH REVIEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
