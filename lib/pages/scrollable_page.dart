import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollablePage extends StatefulWidget {
  @override
  _ScrollablePageState createState() => _ScrollablePageState();
}

class _ScrollablePageState extends State<ScrollablePage> {
  ScrollController _controller;
  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Scrollable area'),
        ),
        body: CupertinoScrollbar(
          controller: _controller,
          child: ListView.builder(
            controller: _controller,
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Yazza: $index'),
              );
            },
          ),
        ),
      ),
    );
  }
}
