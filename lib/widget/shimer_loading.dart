// import 'package:flutter/material.dart';
// import 'package:smartboom_tv/platform/constant/static.dart';
// import 'package:smartboom_tv/platform/widget/shimmer.dart';
//
// class ShimmerLoading extends StatefulWidget {
//   const ShimmerLoading({
//     Key? key,
//     required this.isLoading,
//     required this.child,
//   }) : super(key: key);
//
//   final bool isLoading;
//   final Widget child;
//
//   @override
//   _ShimmerLoadingState createState() => _ShimmerLoadingState();
// }
//
// class _ShimmerLoadingState extends State<ShimmerLoading> {
//
//   Listenable? _shimmerChanges;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     if (_shimmerChanges != null) {
//       _shimmerChanges!.removeListener(_onShimmerChange);
//     }
//     _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
//     if (_shimmerChanges != null) {
//       _shimmerChanges!.addListener(_onShimmerChange);
//     }
//   }
//
//   @override
//   void dispose() {
//     _shimmerChanges?.removeListener(_onShimmerChange);
//     super.dispose();
//   }
//
//   void _onShimmerChange() {
//     if (widget.isLoading) {
//       setState(() {
//         // update the shimmer painting.
//       });
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     if (!widget.isLoading) {
//       return widget.child;
//     }
//
//     return ShaderMask(
//       blendMode: BlendMode.srcATop,
//       shaderCallback: (bounds) {
//         return shimmerGradient.createShader(bounds);
//       },
//       child: widget.child,
//     );
//   }
// }