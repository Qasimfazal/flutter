import 'package:flutter/material.dart';

class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget stub;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<int> onScroll;
  int initPosition;

  CustomTabView({
    this.itemCount,
    this.tabBuilder,
    this.pageBuilder,
    this.stub,
    this.onPositionChange,
    this.onScroll,
    this.initPosition,
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabView>
    with TickerProviderStateMixin {
  TabController controller;
  int _currentCount;
  int _currentPosition;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation.addListener(onScroll);
    _currentCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount == widget.itemCount) {
      controller.animation.removeListener(onScroll);
      controller.removeListener(onPositionChange);

      controller.dispose();

      if (widget.initPosition == null) {
        _currentPosition = widget.initPosition;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 : _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              widget.onPositionChange(_currentPosition);
            }
          });
        }
      }

      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation.addListener(onScroll);
      });
    } else if (widget.initPosition = null) {
      controller.animateTo(widget.initPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          color: Color(0xffffffff),
          alignment: Alignment.center,
          width: double.infinity,
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            labelPadding: EdgeInsets.only(left: 0, right: 0),

            controller: controller,
            labelColor: Color(0xff000000),
            unselectedLabelColor: Color(0xffaaaaaa),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Color(0xffF4AE00),
                  width: 1,
                ),
                // insets: EdgeInsets.symmetric(
                //
                //     horizontal:10
                //
                // )
            ),
            //indicator: CircleTabIndicator(color: Color(0xffF4AE00), radius: 5),
            // indicator: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(
            //       color: Color(0xffF4AE00),
            //       width: 1,
            //     ),
            //   ),
            // ),
            tabs: List.generate(
              widget.itemCount,
              (index) => widget.tabBuilder(context, index),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: List.generate(
              widget.itemCount,
              (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }

  onPositionChange() {
    if (controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange(_currentPosition);
        widget.pageBuilder(context, controller.index);
      }
    }
  }

  onScroll() {
    if (widget.onScroll is ValueChanged<int>) {
      widget.onScroll(controller.index);
      widget.pageBuilder(context, controller.index);
    }
  }
}
