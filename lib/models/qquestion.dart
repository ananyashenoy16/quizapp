class QuizQuestion{
 const QuizQuestion(this.text ,this.answers);

 final String text;
 final List<String> answers;

//to shufle the list of answers
 List<String> getShuffledAnswers() {
 final shuffledList =List.of(answers);
 shuffledList.shuffle();
 return shuffledList;
 }
}