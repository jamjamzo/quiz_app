import 'package:flutter/material.dart';
import 'package:quiz_app/model/model_quiz.dart';
import 'package:quiz_app/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizzes = [
    Quiz.fromMap({
      'title': 'test1',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test2',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    }),
    Quiz.fromMap({
      'title': 'test3',
      'candidates': ['a', 'b', 'c', 'd'],
      'answer': 0
    })
  ];

  @override
  Widget build(BuildContext context) {
    /// MediaQuery로 Size 읽어서 변수에 담아준다
    /// width, height : 너비, 높이 불러온다
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    // 현재 기기에 해당하는 너비와 높이를 통해 화면을 구성
    // 직사각형의 면적 공식 : 가로 x 세로
    return SafeArea(
      child: Scaffold(
        // 앱 상단
        appBar: AppBar(
          title: Text('My Quiz APP'),
          backgroundColor: Colors.deepPurple,
          leading: Container(),
        ),
        body: Column(
          // 행과 열 모두 가운데 정렬
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              //pubspec.yaml>assets에서 공유할 수 있는 파일 경로 만들어주기
              child: Image.asset(
                'images/jamjamzo_Quiz.png',
                width: width * 0.8,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              "Flutter Quiz App",
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Let's solve the quiz!\nPlease Press the Start button.",
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            // 안내 문구 Widget 불러오기
            // 하단에 Method를 만들어주어 반복작업할 수 있게 만들어줌
            _buildStep(width, "1. Solve the 3 Quizzes"),
            _buildStep(
                width, "2. Choose an answer and then \n     Press the 'Next'"),
            _buildStep(
                width, "3. Challenge Yourself to Achieve a Perfect Score "),
            Padding(
              padding: EdgeInsets.all(width * 0.048),
            ),
            // Quiz 시작 버튼 만들어주기
            Container(
                padding: EdgeInsets.only(bottom: width * 0.036),
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // 버튼을 클릭하면 실행하는 함수
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            quizzes: quizzes,
                          ),
                        ),
                      );
                    },
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            Size(width * 0.8, height * 0.05)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.deepPurple)),
                    child: Text(
                      "Start Quiz!",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // 안내사항 | Widget으로 추출(Extract Method)
  // 해당 문제를 풀기 전에 설명창 추가
  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        width * 0.048,
        width * 0.024,
        width * 0.048,
        width * 0.024,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(
            padding: EdgeInsets.only(right: width * 0.024),
          ),
          Text(title),
        ],
      ),
    );
  }
}
