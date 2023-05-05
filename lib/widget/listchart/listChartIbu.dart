import 'dart:ffi';

final List<ChartData> underWeight = [
  ChartData(1, 1, 2),
  ChartData(2, 1, 2),
  ChartData(3, 1, 2),
  ChartData(4, 1, 2),
  ChartData(5, 1, 2),
  ChartData(6, 1, 2),
  ChartData(7, 1, 2),
  ChartData(8, 1, 2),
  ChartData(9, 1, 2),
  ChartData(10, 1, 2),
  ChartData(11, 1, 2),
  ChartData(12, 1, 2),
  ChartData(13, 1, 2),
  ChartData(14, 1, 2),
  ChartData(15, 1.44, 2.59),
  ChartData(16, 1.88, 3.18),
  ChartData(17, 2.32, 3.77),
  ChartData(18, 2.76, 4.36),
  ChartData(19, 3.2, 4.95),
  ChartData(20, 3.64, 5.54),
  ChartData(21, 4.08, 6.13),
  ChartData(22, 4.52, 6.72),
  ChartData(23, 4.96, 7.31),
  ChartData(24, 5.4, 7.9),
  ChartData(25, 5.84, 8.49),
  ChartData(26, 6.28, 9.08),
  ChartData(27, 6.72, 9.67),
  ChartData(28, 7.16, 10.26),
  ChartData(29, 7.6, 10.85),
  ChartData(30, 8.04, 11.44),
  ChartData(31, 8.48, 12.03),
  ChartData(32, 8.92, 12.62),
  ChartData(33, 9.36, 13.21),
  ChartData(34, 9.8, 13.8),
  ChartData(35, 10.24, 14.39),
  ChartData(36, 10.68, 14.98),
  ChartData(37, 11.12, 15.57),
  ChartData(38, 11.56, 16.16),
  ChartData(39, 12, 16.75),
  ChartData(40, 12.44, 17.34),
  ChartData(41, 12.88, 17.93),
];

final List<ChartData> normalWeight = [
  ChartData(1, 1, 2),
  ChartData(2, 1, 2),
  ChartData(3, 1, 2),
  ChartData(4, 1, 2),
  ChartData(5, 1, 2),
  ChartData(6, 1, 2),
  ChartData(7, 1, 2),
  ChartData(8, 1, 2),
  ChartData(9, 1, 2),
  ChartData(10, 1, 2),
  ChartData(11, 1, 2),
  ChartData(12, 1, 2),
  ChartData(13, 1, 2),
  ChartData(14, 1, 2),
  ChartData(15, 1.39, 2.52),
  ChartData(16, 1.78, 3.04),
  ChartData(17, 2.17, 3.56),
  ChartData(18, 2.56, 4.08),
  ChartData(19, 2.95, 4.6),
  ChartData(20, 3.34, 5.12),
  ChartData(21, 3.73, 5.64),
  ChartData(22, 4.12, 6.16),
  ChartData(23, 4.51, 6.68),
  ChartData(24, 4.9, 7.2),
  ChartData(25, 5.29, 7.72),
  ChartData(26, 5.68, 8.24),
  ChartData(27, 6.07, 8.76),
  ChartData(28, 6.46, 9.28),
  ChartData(29, 6.85, 9.8),
  ChartData(30, 7.24, 10.32),
  ChartData(31, 7.63, 10.84),
  ChartData(32, 8.02, 11.36),
  ChartData(33, 8.41, 11.88),
  ChartData(34, 8.8, 12.4),
  ChartData(35, 9.19, 12.92),
  ChartData(36, 9.58, 13.44),
  ChartData(37, 9.97, 13.96),
  ChartData(38, 10.36, 14.48),
  ChartData(39, 10.75, 15),
  ChartData(40, 11.14, 15.52),
  ChartData(41, 11.53, 16.04),
];

final List<ChartData> overWeight = [
  ChartData(1, 1, 2),
  ChartData(2, 1, 2),
  ChartData(3, 1, 2),
  ChartData(4, 1, 2),
  ChartData(5, 1, 2),
  ChartData(6, 1, 2),
  ChartData(7, 1, 2),
  ChartData(8, 1, 2),
  ChartData(9, 1, 2),
  ChartData(10, 1, 2),
  ChartData(11, 1, 2),
  ChartData(12, 1, 2),
  ChartData(13, 1, 2),
  ChartData(14, 1, 2),
  ChartData(15, 1.23, 2.35),
  ChartData(16, 1.46, 2.7),
  ChartData(17, 1.69, 3.05),
  ChartData(18, 1.92, 3.4),
  ChartData(19, 2.15, 3.75),
  ChartData(20, 2.38, 4.1),
  ChartData(21, 2.61, 4.45),
  ChartData(22, 2.84, 4.8),
  ChartData(23, 3.07, 5.15),
  ChartData(24, 3.3, 5.5),
  ChartData(25, 3.53, 5.85),
  ChartData(26, 3.76, 6.2),
  ChartData(27, 3.99, 6.55),
  ChartData(28, 4.22, 6.9),
  ChartData(29, 4.45, 7.25),
  ChartData(30, 4.68, 7.6),
  ChartData(31, 4.91, 7.95),
  ChartData(32, 5.14, 8.3),
  ChartData(33, 5.37, 8.65),
  ChartData(34, 5.6, 9),
  ChartData(35, 5.83, 9.35),
  ChartData(36, 6.06, 9.7),
  ChartData(37, 6.29, 10.05),
  ChartData(38, 6.52, 10.4),
  ChartData(39, 6.75, 10.75),
  ChartData(40, 6.98, 11.1),
  ChartData(41, 7.21, 11.45),
];

final List<ChartData> obeseWeight = [
  ChartData(1, 1, 2),
  ChartData(2, 1, 2),
  ChartData(3, 1, 2),
  ChartData(4, 1, 2),
  ChartData(5, 1, 2),
  ChartData(6, 1, 2),
  ChartData(7, 1, 2),
  ChartData(8, 1, 2),
  ChartData(9, 1, 2),
  ChartData(10, 1, 2),
  ChartData(11, 1, 2),
  ChartData(12, 1, 2),
  ChartData(13, 1, 2),
  ChartData(14, 1, 2),
  ChartData(15, 1.17, 2.27),
  ChartData(16, 1.34, 2.54),
  ChartData(17, 1.51, 2.81),
  ChartData(18, 1.68, 3.08),
  ChartData(19, 1.85, 3.35),
  ChartData(20, 2.02, 3.62),
  ChartData(21, 2.19, 3.89),
  ChartData(22, 2.36, 4.16),
  ChartData(23, 2.53, 4.43),
  ChartData(24, 2.7, 4.7),
  ChartData(25, 2.87, 4.97),
  ChartData(26, 3.04, 5.24),
  ChartData(27, 3.21, 5.51),
  ChartData(28, 3.38, 5.78),
  ChartData(29, 3.55, 6.05),
  ChartData(30, 3.72, 6.32),
  ChartData(31, 3.89, 6.59),
  ChartData(32, 4.06, 6.86),
  ChartData(33, 4.23, 7.13),
  ChartData(34, 4.4, 7.4),
  ChartData(35, 4.57, 7.67),
  ChartData(36, 4.74, 7.94),
  ChartData(37, 4.91, 8.21),
  ChartData(38, 5.08, 8.48),
  ChartData(39, 5.25, 8.75),
  ChartData(40, 5.42, 9.02),
  ChartData(41, 5.59, 9.29),
];

class ChartData {
  ChartData(this.xValue, this.lowValue, this.highValue);
  final num xValue;
  final double lowValue;
  final double highValue;
}
