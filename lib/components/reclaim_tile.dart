import 'package:flutter/material.dart';

import 'drag_handles.dart';

class ReclaimTile extends StatelessWidget {
  const ReclaimTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const ReclaimDragHandle(),
      const SizedBox(width: 10),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Task Name',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 5),
            Text(
              'Task Description',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      const SizedBox(width: 10),
      Text(
        '1:00',
        style: Theme.of(context).textTheme.headline6,
      ),
    ],);
  }
}