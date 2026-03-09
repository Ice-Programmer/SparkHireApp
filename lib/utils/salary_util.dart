class SalaryUtil {
  static String formatSalary(int value) {
    if (value >= 1000_00) {
      return '${(value / 10000).toStringAsFixed(value % 10000 == 0 ? 0 : 1)}w';
    }
    if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(value % 1000 == 0 ? 0 : 1)}k';
    }
    return value.toString();
  }
}
