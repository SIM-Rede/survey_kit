import 'package:flutter/material.dart';
import 'package:survey_kit/src/widget/emoji_text_widget.dart';

class SelectionListTile extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isSelected;

  const SelectionListTile({
    Key? key,
    required this.text,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: ListTile(
            title: EmojiText(
              text: text,
              textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: isSelected
                        ? Colors.blue
                        : Theme.of(context).textTheme.headlineSmall?.color,
                  ),
            ),
            trailing: isSelected
                ? Icon(
                    Icons.check,
                    size: 32,
                    color: isSelected ? Colors.blue : Colors.black,
                  )
                : Container(
                    width: 32,
                    height: 32,
                  ),
            onTap: () => onTap.call(),
          ),
        ),
        Divider(
          color: Colors.grey,
        ),
      ],
    );
  }
}
