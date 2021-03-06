import 'package:clean_code_snippets/src/core/utils/app_palette.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {
  final VoidCallback? onPress;
  const ErrorWidget({Key? key, this.onPress}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppPalette.primary,
            size: 150,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          child: const Text(
            'something went wrong ',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
        ),
        const Text(
          'Please Try Again',
          style: TextStyle(
              color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Container(
          height: 55,
          width: MediaQuery.of(context).size.width * .55,
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: ElevatedButton(
            onPressed: () {
              if (onPress != null) {
                onPress!();
              }
            },
            style: ElevatedButton.styleFrom(
                primary: AppPalette.primary,
                elevation: 500,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text(
              'Reload Screen',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
        )
      ],
    );
  }
}
