import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:salla7ly/core/theming/app_color.dart';
import 'package:salla7ly/core/theming/app_style.dart';

class RadioQuestion extends StatefulWidget {
  const RadioQuestion({
    super.key,
    required this.question,
    required this.options,
  });

  final String question;
  final List<String> options;

  @override
  State<RadioQuestion> createState() => _RadioQuestionState();
}

class _RadioQuestionState extends State<RadioQuestion> {
  String? answer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          widget.question,
          textAlign: TextAlign.right,
          style: AppStyles.bold16Primary,
        ),

        ...widget.options.map((option) {
          return Row(
            children: [
              Radio<String>(
                value: option,
                groupValue: answer,
                activeColor: AppColors.primaryColor,
                onChanged: (value) {
                  setState(() {
                    answer = value;
                  });
                },
              ),
              Text(option, style: AppStyles.bold16Primary),
            ],
          );
        }),
      ],
    );
  }
}
