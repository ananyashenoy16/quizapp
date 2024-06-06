import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz ,{super.key});
 final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/quiz-logo.png',
          width: 300,color:const Color.fromRGBO(255, 255, 255, 0.796),
        ),
        const SizedBox(
          height: 80,
        ),
         const Text(
          "learn flutter in fun way!",
          style: TextStyle( color: Colors.white),
        ),
        const SizedBox(height: 30,),                            
        
        OutlinedButton.icon(onPressed: (){
          startQuiz();
        },
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.white),
          icon:const Icon(Icons.arrow_right_alt),
        label:const Text("Start Quiz",
         ),),
      ],
    ));
  }
}
