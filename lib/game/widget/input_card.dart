import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part2_rsp_game/game/widget/enum.dart';

class InputCard extends StatelessWidget {
  final Widget child;
  final VoidCallback? callback; // 클릭이 안되는 부분을 위해서 nullable로 세팅

  const InputCard({
    this.callback,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: () => callback?.call(), child: InputContents(child: child));
  }
}

class InputContents extends StatelessWidget {
  const InputContents({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey, width: 8)
      ),
      child: child,
    );
  }
}