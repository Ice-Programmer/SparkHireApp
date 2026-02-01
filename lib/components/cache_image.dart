import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // 必须引入
import 'package:spark_hire_app/components/full_screen_gallery.dart';

class CacheImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final double borderRadius;
  final bool canView;
  final double maxHeight;
  final double maxWidth;

  const CacheImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.borderRadius = 0,
    this.canView = false,
    this.maxHeight = double.infinity,
    this.maxWidth = double.infinity,
  });

  // 判断是否为 SVG
  bool get _isSvg => imageUrl.toLowerCase().split('?').first.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: canView ? () => _openFullScreen(context) : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: maxHeight,
            maxWidth: maxWidth,
          ),
          child: _buildImageContent(context),
        ),
      ),
    );
  }

  Widget _buildImageContent(BuildContext context) {
    if (_isSvg) {
      return SvgPicture.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
        // SVG 的加载占位
        placeholderBuilder: (context) => _buildPlaceholder(),
      );
    }

    return CachedNetworkImage(
      height: height,
      width: width,
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
    );
  }

  void _openFullScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (_, animation, secondaryAnimation) => FullScreenGallery(
          images: [imageUrl],
          initialIndex: 0,
        ),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut),
              ),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 150),
      ),
    );
  }
}