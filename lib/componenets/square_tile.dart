import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String character;
  final int index;
  final Function onTap;
  final bool tapped;
  final bool dimmed;

  SquareTile(
      {this.character, this.index, this.onTap, this.tapped, this.dimmed});

  @override
  Widget build(BuildContext context) {
    Color inactiveColor = Theme.of(context).colorScheme.surface;
    Color activeColor = Theme.of(context).colorScheme.primaryVariant;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          if (!tapped) {
            onTap(index);
          }
        },
        child: Opacity(
          opacity: dimmed ? 0.5 : 1.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              color: tapped ? activeColor : inactiveColor,
              child: Center(
                child: Text(
                  character,
                  style: TextStyle(fontSize: 48.0),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
