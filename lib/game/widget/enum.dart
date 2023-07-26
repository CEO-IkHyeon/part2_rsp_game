
const assetPath = 'assets/images';

enum InputType {
  rock,
  scissors,
  paper;

  // input type에서 path를 불러올 때 이미지 경로를 받아올 수 있다
   String get path => '$assetPath/$name.png';

}


enum Result {
  playerWin('Player 승리'),
  draw('무승부'),
  cpuWin('Player 패배');

  const Result(this.displayString);

  final String displayString;
}
