import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/model/model_quiz.dart';

class QuizScreen extends StatefulWidget {
  final List<Quiz> quizzes;
  const QuizScreen({Key? key, required this.quizzes}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  // 사용자의 정답을 담아놓을 리스트, 초기값은 -1, 총 3문제
  final List<int> _answers = [-1, -1, -1];
  // 각 1문제당 보기는 4개, 정답 선택하면 true로 바뀜
  final List<bool> _answerState = [false, false, false, false];
  // 현재 어떤 문제를 보고 있는지 알 수 있는 인덱스
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.fromLTRB(0, width * 0.024, 0, width * 0.024),
                child: Text(
                  '안녕하세요',
                  // 'Q${_currentIndex + 1}.',
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // width: width * 0.85,
          // height: height * 0.5),
        ),
      ),
    ));
  }
}

//   Widget _buildQuizCard(Quiz quiz, double width, double height) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           border: Border.all(
//             color: Colors.white,
//           )),
//     );
//   }
// }
