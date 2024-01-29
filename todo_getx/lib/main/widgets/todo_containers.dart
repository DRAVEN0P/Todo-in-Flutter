import 'package:flutter/material.dart';

class TodoContainer extends StatelessWidget {
  const TodoContainer({
    super.key,
    required this.title,
    required this.id,
    required this.date,
  });
  final String title;
  final String date;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 5,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        width: MediaQuery.of(context).size.width - 20,
        height: 50,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
              Text(
                date.substring(0, 10),
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
