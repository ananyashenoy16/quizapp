import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
// import 'package:google_fonts/google_fonts.dart';

class Question extends StatefulWidget {
  const Question({super.key, required this.onSelectedAnswer});

  final void Function (String answer) onSelectedAnswer;
  @override
  State<Question> createState() {
    return _QuestionState();
  }
}

class _QuestionState extends State<Question> {
 var currentQuestionIndex =0;

 void answerQuestion(String selectedAnswers){
  widget.onSelectedAnswer(selectedAnswers);
  setState(() {
    currentQuestionIndex++;

  });
 }
  @override
  Widget build(context) {
    final currentQuestion=questions[currentQuestionIndex];
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const  EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, //take the full width
          children: [
          
             Text(currentQuestion.text,
            style:const TextStyle(fontSize: 30,color: Colors.white), 
            textAlign:TextAlign.center,
            ),
           
            const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer){
              return AnswerButton(onTap:(){
                answerQuestion(answer);
              },answerText:answer);
            }
            )
      
          ],
        ),
      ),
    );
  }
}
