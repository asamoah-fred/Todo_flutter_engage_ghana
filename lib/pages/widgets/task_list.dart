import 'package:flutter/material.dart';
import 'package:todo_app/providers/add_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    Key key,
    @required this.taskVm,
  }) : super(key: key);

  final AddTask taskVm;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      separatorBuilder: (context, index) => SizedBox(height: 5),
      itemCount: taskVm.tasksList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => taskVm.setStatus(index),
                  child: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: taskVm.tasksList[index].isDone ? Colors.green : Color(0xffCBD5E0),
                      ),
                    ),
                    child: taskVm.tasksList[index].isDone
                        ? Icon(
                            Icons.check,
                            size: 12,
                            color: Colors.green,
                          )
                        : Container(),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskVm.tasksList[index].taskname,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            color: Color(0xff3A3A3A),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            decoration: taskVm.tasksList[index].isDone
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        taskVm.tasksList[index].duration ?? "",
                        style: TextStyle(fontSize: 12, color: Color(0xff3A3A3A)),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Color(0xff9c9c9c),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Label extends StatelessWidget {
  const Label({
    this.lblText,
  });
  final String lblText;

  @override
  Widget build(BuildContext context) {
    return Text(
      lblText,
      style: TextStyle(
        fontSize: 14,
        color: Color(0xff3A3A3A),
      ),
    );
  }
}
