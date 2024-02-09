class Questionbank {
  int currentQuestionIndex = 0;
  int currentAnswerIndex = 0;
  int currentOptionIndex = 0;
  List<String> questions = [
    'Who is known as the "Queen of Pop?',
    'What is the powerhouse of the cell?',
    'Who is the co-founder of Tesla?',
    'Who directed the movie "Inception"?',
    'In which year did the Titanic sink?',
    'Which country won the FIFA World Cup in 2018?',
    'Who is the party chairman of PTI?',
  ];
  List<List<String>> options = [
    ['Madonna', 'Lady Gaga', 'Beyoncé', 'Adele'],
    ['Mitochondria', 'Nucleus', 'Ribosome', 'Endoplasmic Reticulum'],
    ['Mark Zuckerberg', 'Bill Gates', 'Jeff Bezos', 'Elon Musk'],
    [
      'Quentin Tarantino',
      'Steven Spielberg',
      'Christopher Nolan',
      'James Cameron'
    ],
    ['1911', '1912', '1913', '1914'],
    ['Brazil', 'Germany', 'France', 'Argentina'],
    ['Imran Khan', 'Nawaz Sharif', 'Zulfiqar Ali', 'Murad Saeed'],
  ];
  List<int> correctOptionIndices = [
    0,
    0,
    3,
    2,
    1,
    2,
    0,
  ];
  // 1, 1, 2];
}
