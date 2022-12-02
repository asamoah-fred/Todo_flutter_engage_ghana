import 'package:flutter/material.dart';

class EmptyTaskState extends StatelessWidget {
  const EmptyTaskState({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/illustration.png'),
          SizedBox(
            height: 40,
          ),
          Text(
            'Add your first task',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xff3A3A3A),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            'Note what you want to get done and tick them off as you complete them',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff9C9C9C),
            ),
          ),
        ],
      );
  }
}

