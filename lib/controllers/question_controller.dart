import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/views/score_screen.dart';

class QuestionController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // animate progress bar

  late AnimationController _animationController;
  late Animation _animation;
  // global animation accessibility
  Animation get animation => _animation;

  late PageController _pageController;
  PageController get pageController => _pageController;

  final List<Question> _questions = sampleData
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();

  List<Question> get questions => _questions;

  bool _isAnswered = false;
  bool get isAnswered => _isAnswered;

  late int _correctAns;
  int get correctAns => _correctAns;

  late int _selectedAns;
  int get selectedAns => _selectedAns;

  final RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => _questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => _numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // animation duration
    // fill progress bar within 60s
    _animationController =
        AnimationController(duration: const Duration(seconds: 60), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start animation
    // once 60secs is completed go to the next question
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // called before the controller is deleted from memory
  @override
  void onClose() {
    super.onClose();
    _animationController.dispose();
    _pageController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // once user press option it auto runs
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == selectedAns) _numOfCorrectAns++;

    // stops the counter
    _animationController.stop();
    update();

    // once user selects an ans it moves to next question after 3secs
    Future.delayed(const Duration(seconds: 3), () {
      nextQuestion();
    });
  }

  void nextQuestion(){
    if(_questionNumber.value != _questions.length){
      _isAnswered = false;
      _pageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.ease);

      // reset the counter
      _animationController.reset();

      // start animation again
      // once timer has ended go to next question
      _animationController.forward().whenComplete(nextQuestion);
    }

    else {
      Get.to(const ScoreScreen());
    }
  }

  void updateQuestionNum(int index){
    _questionNumber.value = index + 1;
  }
}
