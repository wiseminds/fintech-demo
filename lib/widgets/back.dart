import 'package:example/constants/svg_strings.dart';
import 'package:example/core/extensions/extensions/context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Back extends StatelessWidget {
  final Color? color;
  const Back({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkResponse(
      onTap: Navigator.of(context).pop,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, top: 8.0, bottom: 8.0),
        child: SvgPicture.string(
          SvgStrings.back,
          color: color ?? context.bodyText1!.color,
        ),
      ),
    );
  }
}
