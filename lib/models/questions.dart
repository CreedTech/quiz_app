class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({required this.id, required this.question, required this.answer, required this.options});
}

const List sampleData = [
  {
    "id": 1,
    "question": "Flutter is an open-source software development kit created by__________.",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When was Flutter released by Google?",
    "options": ['Jun 2017', 'Jun 2018', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "When was Flutter released by Google?",
    "options": ['Jun 2017', 'Jun 2018', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "A memory location that holds a single letter or number is called______.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 5,
    "question": "Flutter is an open-source software development kit created by__________.",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "Flutter is an open-source software development kit created by__________.",
    "options": ['Apple', 'Google', 'Facebook', 'Microsoft'],
    "answer_index": 2,
  },
];