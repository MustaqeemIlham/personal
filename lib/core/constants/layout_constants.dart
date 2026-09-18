class LayoutConstants {
  // Narrow, editorial content width — the page never stretches edge to edge.
  static const double maxContentWidth = 960;
  static const double tabletBreakpoint = 900;
  static const double mobileBreakpoint = 600;

  static const double desktopHorizontalPadding = 40;
  static const double tabletHorizontalPadding = 28;
  static const double mobileHorizontalPadding = 18;

  static double horizontalPaddingFor(double width) {
    if (width < mobileBreakpoint) return mobileHorizontalPadding;
    if (width < tabletBreakpoint) return tabletHorizontalPadding;
    return desktopHorizontalPadding;
  }
}
