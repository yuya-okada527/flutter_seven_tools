import 'package:flutter/material.dart';
import 'package:flutter_calculator/pages/calculator_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final Map<String, Function> _tools = {
    "Calculator": () => const Calculator(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seven Tools App"),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: _tools.length,
          itemBuilder: (context, index) {
            var key = _tools.keys.elementAt(index);
            return ElevatedButton(
              child: Text(key),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return _tools[key]!();
                  })
                );
              },
            );
          }
        ),
      ),
    );
  }
}