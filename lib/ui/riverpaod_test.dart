import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class Counter extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  void increment() {
    state++;
  }
}

final counter2 = NotifierProvider<Counter, int>((){
  return Counter();
});


class RiverPodWidget extends ConsumerStatefulWidget {
  const RiverPodWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverPodWidgetState();
}

class _RiverPodWidgetState extends ConsumerState<RiverPodWidget> {
  @override
  Widget build(BuildContext context) {
    final count  = ref.watch(counter2);
    return Scaffold(
      appBar: AppBar(
        title: Text('Main$count'),
      ),
      body: Container(
        color: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(counter2.notifier).increment();
        }
      ),
    );
  }
}
