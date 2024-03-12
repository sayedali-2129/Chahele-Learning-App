import 'dart:developer';

import 'package:flutter/material.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  State<ExampleScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExampleScreen> {
  List<int?> selectedOptions =
      List.filled(4, null); // List to store selected option for each question

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, questionIndex) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: Offset(0, 2),
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
              ),
              child: ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Question ${questionIndex + 1}",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "• Please add your content here. Keep it short and simple. And smile 😊",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Options",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Column(
                      children: List.generate(4, (optionIndex) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOptions[questionIndex] =
                                  optionIndex; // Update selected option for the current question
                              log('Selected option for Question ${questionIndex + 1}: ${optionIndex + 1}');
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  selectedOptions[questionIndex] == optionIndex
                                      ? Colors.grey.withOpacity(0.3)
                                      : Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            height: 40,
                            width: screenWidth,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Row(
                                children: [
                                  Text(
                                    "Option ${optionIndex + 1}",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
