import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:part2_rsp_game/game/widget/enum.dart';
import 'package:part2_rsp_game/game/widget/user_input.dart';
import 'package:part2_rsp_game/game/widget/user_input.dart';

import 'widget/cpu_input.dart';
import 'widget/game_result.dart';

class GameBody extends StatefulWidget {
  const GameBody({super.key});

  @override
  State<GameBody> createState() => _GameBodyState();
}

class _GameBodyState extends State<GameBody> {
  late bool isDone; // 게임이 진행되었는지 진행되지 않았는지 알기 위한 변수
  InputType? _userInput; // 초반에는 유저의 input을 알 수 없으니 nullable로 설정
  late InputType _cpuInput; // cpu input

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isDone = false;
    setCpuInput();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // isDone 매개변수 선언  -> 게임의 진행 여부를 전달받을 수 있음
        Expanded(
          child: CpuInput(isDone: isDone, cpuInput: _cpuInput),
        ),
        Expanded(
          child: GameResult(
            isDone: isDone,
            result: getResult(),
            callback: reset,
          ),
        ),
        Expanded(
            child: UserInput(
          isDone: isDone,
          callback: setUserInput,
          userInput: _userInput,
        )),
      ],
    );
  }

  void setUserInput(InputType userInput) {
    setState(() {
      isDone = true; // 유저가 값을 설정했다는 것은 isDone 이라고 볼 수 있음
      _userInput = userInput;
    });
  }

  void setCpuInput() {
    final random = Random();
    _cpuInput = InputType.values[random.nextInt(3)];
  }

  void reset() {
    setState(() {
      isDone = false;
      setCpuInput();
    });
  }

  Result? getResult() {
    if (_userInput == null) return null;

    switch (_userInput!) {
      case InputType.rock:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.draw;
          case InputType.scissors:
            return Result.playerWin;
          case InputType.paper:
            return Result.cpuWin;
        }

      case InputType.scissors:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.cpuWin;
          case InputType.scissors:
            return Result.draw;
          case InputType.paper:
            return Result.playerWin;
        }
      case InputType.paper:
        switch (_cpuInput) {
          case InputType.rock:
            return Result.playerWin;
          case InputType.scissors:
            return Result.cpuWin;
          case InputType.paper:
            return Result.draw;
        }
    }
  }
}
