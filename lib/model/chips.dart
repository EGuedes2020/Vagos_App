import 'package:flutter/material.dart';

class FilterChipData {
  final String label;
  final Color color;
  final IconData icon;
  final Color iconColor;
  final bool isSelected;

  const FilterChipData({
    @required this.label,
    @required this.color,
    @required this.icon,
    @required this.iconColor,
    this.isSelected = false,
  });

  FilterChipData copy({
    String label,
    Color color,
    IconData icon,
    Color iconColor,
    bool isSelected,
  }) =>
      FilterChipData(
        label: label ?? this.label,
        color: color ?? this.color,
        icon: icon ?? this.icon,
        iconColor: iconColor ?? this.iconColor,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is FilterChipData &&
              runtimeType == other.runtimeType &&
              label == other.label &&
              color == other.color &&
              icon == other.icon &&
              iconColor == other.iconColor &&
              isSelected == other.isSelected;

  @override
  int get hashCode => label.hashCode ^ color.hashCode ^ isSelected.hashCode;
}
