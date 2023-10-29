import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final Gradient gradient;
  final String textContent;
  final String logo;
  const SocialButton({
    super.key,
    required this.gradient,
    required this.textContent,
    required this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 35.0,
          decoration: BoxDecoration(
            gradient: gradient,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(32),
              ),
              child: Center(
                  child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 25),
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (Rect bounds) {
                        return gradient.createShader(bounds);
                      },
                      child: Image.network(
                        logo,
                        scale: 2.5,
                      ),
                    ),
                  ),
                  Text(textContent),
                ],
              )),
            ),
          )),
    );
  }
}
