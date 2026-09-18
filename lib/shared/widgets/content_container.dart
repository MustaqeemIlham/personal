import 'package:flutter/material.dart';
import '../../core/constants/layout_constants.dart';

/// Centers content in a narrow, editorial-style column with responsive
/// side padding. Desktop content never exceeds [LayoutConstants.maxContentWidth];
/// on tablet/mobile the side padding shrinks so the column reads almost
/// full-width.
class ContentContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? verticalPadding;
  final Color? background;

  const ContentContainer({
    super.key,
    required this.child,
    this.verticalPadding,
    this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: background,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final hPad = LayoutConstants.horizontalPaddingFor(constraints.maxWidth);
          return Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: LayoutConstants.maxContentWidth),
              padding: (verticalPadding ?? EdgeInsets.zero).add(
                EdgeInsets.symmetric(horizontal: hPad),
              ),
              child: child,
            ),
          );
        },
      ),
    );
  }
}
