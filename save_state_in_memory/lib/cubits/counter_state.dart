part of 'counter_cubit.dart';

class CounterState {
  final int count;
  final bool isPlus;

  CounterState({required this.count, required this.isPlus});

  CounterState copyWith({
    required final int count,
    required final bool isPlus,
  }) {
    return CounterState(
      count: this.count,
      isPlus: this.isPlus
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'count': this.count,
      'isPlus': this.isPlus,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      count: map['count'] as int,
      isPlus: map['isPlus'] as bool,
    );
  }
}
