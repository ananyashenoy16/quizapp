
import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen({super.key,required this.choosenAnswers});

final List<String> choosenAnswers;

List<Map<String,Object>> getSummaryData(){
  final List<Map<String,Object>>  summary =[];

  for(var i=0;i<choosenAnswers.length;i++){
    summary.add({
      'question_index':i,
       'question':questions[i].text,
        'correct_answer':questions[i].answers[0],
        'user_answer':choosenAnswers[i]
    });
  }
  return summary;
}
  @override
  Widget build(BuildContext context){
    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data) {
      return data['user_answer']==data['correct_answer'];
    }).length;
    return  SizedBox(
      width: double.infinity,
      child: Container(
        margin: const  EdgeInsets.all(40.0),
        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [ 
             Text('you answered $numCorrectQuestions out of $numTotalQuestions answers correctly'),
            const SizedBox(height: 30,),
           QuestionsSummary(getSummaryData()),
            const SizedBox(height: 30,),
             TextButton(onPressed:(){}, child: const Text('Restart Quiz'),)

          
        ]),
      )
    );
  }
}