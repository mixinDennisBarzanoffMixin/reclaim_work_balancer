import 'package:flutter/material.dart';

class ReclaimDragHandle extends StatelessWidget {
  const ReclaimDragHandle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15 * 0.6,
      child: GridView.count(
        crossAxisCount: 2, 
        mainAxisSpacing: 2, 
        crossAxisSpacing: 2, 
        shrinkWrap: true,
        children: [
        for (int i = 0; i < 6; i++)
          Container(
            width: 1.3,
            height: 1.3,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xff757575),
            ),
          ),
      ]),
    );
  }
}