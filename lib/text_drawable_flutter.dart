library text_drawable_flutter;

import 'package:flutter/material.dart';

import 'color_generator.dart';
import 'contrast_helper.dart';

class TextDrawable extends StatefulWidget {
  /// The text supplied.
  final String text;

  final int length;

  /// Height of the [TextDrawable] widget.
  final double height;

  /// Width of the [TextDrawable] widget.
  final double width;

  /// `TextStyle` for the `text` to be displayed.
  final TextStyle textStyle;

  /// Background color to for the widget.
  /// If not specified, a random color will be generated.
  final Color backgroundColor;

  /// Shape of the widget.
  /// Defaults to `BoxShape.circle`.
  final BoxShape boxShape;

  /// Border radius of the widget.
  /// Only specify this if `boxShape == BoxShape.circle`.
  final BorderRadiusGeometry borderRadius;

  /// Creates a customizable [TextDrawable] widget.
  TextDrawable({
    Key key,
    @required this.text,
    this.length = 1,
    this.height = 48,
    this.width = 48,
    this.textStyle,
    this.backgroundColor,
    this.boxShape = BoxShape.circle,
    this.borderRadius,
  }) : super(key: key) {
    assert(
      boxShape == BoxShape.rectangle || borderRadius == null,
      "Set boxShape = BoxShape.rectangle when borderRadius is specified",
    );
  }

  @override
  _TextDrawableState createState() => _TextDrawableState();
}

class _TextDrawableState extends State<TextDrawable> {
  Color backgroundColor;

  @override
  void initState() {
    backgroundColor =
        widget.backgroundColor ?? ColorGenerator().getRandomColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double contrast = ContrastHelper.contrast([
      backgroundColor.red,
      backgroundColor.green,
      backgroundColor.blue,
    ], [
      255,
      255,
      255
    ] /** white text */);

    return Container(
      alignment: Alignment.center,
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: widget.boxShape,
        borderRadius: widget.borderRadius,
      ),
      child: Text(
        getInitials(),
        style: widget.textStyle?.copyWith(
              color: contrast > 1.8 ? Colors.white : Colors.black,
            ) ??
            TextStyle(
              fontSize: 18,
              color: contrast > 1.8 ? Colors.white : Colors.black,
            ),
      ),
    );
  }

  String getInitials() {
    String text = widget.text;
    int limitTo = widget.length;
    try {
      var buffer = StringBuffer();

      if (text.trim().length == 0) return '';

      var split = text.split(' ');
      if (split.length == 1) return text.substring(0, 1);

      for (var i = 0; i < split.length; i++) {
        String temp = split.elementAt(i);
        if (temp.isEmpty) continue;
        buffer.write(split.elementAt(i).substring(0, 1));
      }

      if (buffer.toString().length >= limitTo)
        return buffer.toString().substring(0, limitTo);
      else
        return buffer.toString();
    } catch (e) {
      print(e);
      return text.substring(0, 1);
    }
  }
}
