import 'package:flutter/widgets.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({
    Key? key,
    this.width,
    this.height,
    // this.padding,
    // this.margin,
    this.decoration,
    this.foregroundDecoration,
    this.transformAlignment,
    this.child,
    this.clipBehaviour = Clip.none,
    this.constraints,
    this.transform,
    this.alignment,
  }) : super(key: key);
  final double? width;
  final double? height;
  // final AppEdgeInsets? padding;
  // final AppEdgeInsets? margin;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final AlignmentGeometry? alignment;
  final AlignmentGeometry? transformAlignment;
  final Widget? child;
  final Clip clipBehaviour;
  final BoxConstraints? constraints;
  final Matrix4? transform;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(10),
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      alignment: alignment,
      clipBehavior: clipBehaviour,
      constraints: constraints,
      transform: transform,
      transformAlignment: transformAlignment,
      child: child,
    );
  }
}
