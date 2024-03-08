import 'package:flutter/material.dart';
// import 'package:testsdk/common/utils/colors.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  final double? height;
  final double? width;

  const CustomContainer({
    Key? key,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    var w = widget.width ?? MediaQuery.of(context).size.width;
    var h = widget.height ?? MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black,
          width: 1,
        )
      ),
      //color: ColorsContants.textColor3,
      height: h,
      width: w,
      child: widget.child,
    );
  }
}
