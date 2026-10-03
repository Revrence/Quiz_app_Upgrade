import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/past_results_screen.dart';

class Quiz extends StatefulWidget {

  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
  
}

class _QuizState extends State<Quiz> {
List<String> selectedAnswers = [];

var activeScreen = 'start-screen';

  // Widget? activeScreen;
  // // @override
  // // void initState() {//changes initialization logic
  // //   activeScreen = StartScreen(switchScreen);
  // //   super.initState();
  // // }

  void switchScreen() {
    setState(() {
      activeScreen =  'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState((){
          activeScreen = 'results-screen';
          
      });
    }
  }

  void restartQuiz(){
    setState((){
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }
  // Part of Upgrade #1
  void mainMenu(){
    setState((){
      selectedAnswers = [];
      activeScreen = 'start-screen';
    });
  }
  void pastResults(){
    setState((){
      activeScreen = 'past-results-screen';
    });
  }

  @override
  Widget build(context) {

    Widget screenWidget = StartScreen(switchScreen, pastResults);
    if(activeScreen == 'questions-screen') {
    screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }
    if(activeScreen == 'results-screen'){
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
        mainMenu: mainMenu,
        );
    
    }
    //part of upgrade #2
    if(activeScreen == 'past-results-screen'){
      screenWidget =  PastResultsScreen(mainMenu: mainMenu);
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 37, 7, 71),
                  Color.fromARGB(255, 92, 13, 144),  
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child:  screenWidget
            
                // activeScreen == 'start-screen' // turnary operator to switch between screens
                // ? StartScreen(switchScreen)
                // : const QuestionsScreen(),
            
                //activeScreen,//initialization logic
          ),
        ),
     );
   
  }
}