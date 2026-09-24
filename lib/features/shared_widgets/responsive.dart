class Responsive {
  static const double tabletBreakpoint = 600;
  static const double desktopBreakpoint = 1024;

  static bool isTablet(double width) =>
      width >= tabletBreakpoint && width < desktopBreakpoint;

  static bool isDesktop(double width) => width >= desktopBreakpoint;

  static bool isWide(double width) => width >= tabletBreakpoint;

  static int columnCount(double width) {
    if (width >= desktopBreakpoint) return 3;
    if (width >= tabletBreakpoint) return 2;
    return 1;
  }

  static double contentMaxWidth(double width) {
    if (isWide(width)) return double.infinity;
    return 480;
  }
}
