import 'package:flutter/material.dart';
import 'question.dart';
import 'Splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Questionbank questionBank = Questionbank();
  int currentQuestionIndex = 0;
  int correctAnswerScore = 0;
  int totalScore = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[900],
      appBar: AppBar(
        title: const Text(
          'Quiz App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[900],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(12),
            child: const Center(
              child: Text(
                'Welcome To A Quiz App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(60),
                  topLeft: Radius.circular(60),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Text(
                      questionBank.questions[currentQuestionIndex],
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        questionBank.options[currentQuestionIndex].length,
                    itemBuilder: (context, index) {
                      String option =
                          questionBank.options[currentQuestionIndex][index];
                      return TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white70),
                        ),
                        onPressed: () {
                          setState(() {
                            if (index ==
                                questionBank.correctOptionIndices[
                                    currentQuestionIndex]) {
                              correctAnswerScore++;
                            }
                            if (currentQuestionIndex <
                                questionBank.questions.length - 1) {
                              currentQuestionIndex++;
                            } else {
                              totalScore = correctAnswerScore * 10;
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: const Text('Total Score'),
                                  content:
                                      Text('Your total score is: $totalScore'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        correctAnswerScore = 0;
                                        currentQuestionIndex = 0;
                                        totalScore = 0;

                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              );
                            }
                          });
                        },
                        child: Text(
                          option,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
