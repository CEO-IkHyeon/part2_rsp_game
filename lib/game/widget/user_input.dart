import 'package:flutter/cupertino.dart';

import 'enum.dart';
import 'input_card.dart';

class UserInput extends StatelessWidget {
  final bool isDone;
  final InputType? userInput;
  final Function(InputType) callback;

  const UserInput({this.userInput, required this.callback, required this.isDone, super.key});

  @override
  Widget build(BuildContext context) {
    // 게임이 진행될 때와 진행되지 않을 때에 따라서 UI를 다르게 설정
    if (isDone) {
      return Row(
        children: [
          const Expanded(child: SizedBox.shrink()),
          Expanded(child: InputCard(child: Image.asset(userInput!.path))),
          const Expanded(child: SizedBox.shrink()),

        ],
      );
    }

    return Row(
      children: _getInputs(callback),
    );
  }

  List<Widget> _getInputs(Function(InputType) callback) {
    return InputType.values
        .map((type) => InputCard(
              callback: () => callback.call(type),
              child: Image.asset(type.path, width: 55,),
            ))
        .toList();
  }
}
