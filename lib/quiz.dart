
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget{
  const  Quiz({super.key});
  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}
class _QuizState extends State<Quiz>{
 var activeScreen='start-screen';
  List<String> selectedAnswers=[];
  // @override
  // void initState() {
  //     activeScreen=StartScreen(swtchScreen) ;
  //   super.initState();  
    void switchScreen(){
    setState(() {
       activeScreen='question-screen';
    });
  }
   void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    
    if(selectedAnswers.length == questions.length){
       setState(() {
        
         activeScreen='result-screen';
       });
    }
  }  
 
  @override
  Widget build(context) {
     if(activeScreen == 'result-screen'){
     ResultScreen(choosenAnswers:selectedAnswers);
  }
    return MaterialApp(
    home:Scaffold(
      body:  Container(
        decoration:const BoxDecoration(gradient: LinearGradient(
        colors: [Color.fromARGB(255, 8, 38, 233),
          Color.fromARGB(186, 12, 78, 233)],
           begin: Alignment.topLeft,
          end: Alignment.bottomRight,
      ),
        ),
 child: activeScreen == 'start-screen' ? StartScreen(switchScreen)
                     : activeScreen == 'question-screen'
                  ? Question(onSelectedAnswer: chooseAnswer)
                  : ResultScreen(choosenAnswers: selectedAnswers),         
      
    )
    )
  ) ;
  }
}