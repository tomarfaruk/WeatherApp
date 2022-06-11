import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import '../../../../resources/k_images.dart';

class FlareAnimationWidget extends StatelessWidget {
  const FlareAnimationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: 300,
      width: size.width,
      child: const FlareActor(
        Kimages.flareAsets,
        fit: BoxFit.contain,
        animation: "roll",
      ),
    );
  }
}
