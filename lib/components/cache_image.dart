import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spark_hire_app/components/full_screen_gallery.dart';

class CacheImage extends StatelessWidget {
  final double? height;
  final double? width;
  final String imageUrl;
  final double borderRadius;
  final bool canView;
  final double maxHeight;
  final double maxWidth;

  final List<String>? galleryImages;
  final int index;

  const CacheImage({
    super.key,
    this.height,
    this.width,
    required this.imageUrl,
    this.borderRadius = 0,
    this.canView = false,
    this.maxHeight = double.infinity,
    this.maxWidth = double.infinity,
    this.galleryImages, // 可选
    this.index = 0, // 默认为0
  });

  bool get _isSvg => imageUrl.toLowerCase().split('?').first.endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // 只有在 canView 为 true 且有图片地址时才响应点击
      onTap:
          (canView && imageUrl.isNotEmpty)
              ? () => _openFullScreen(context)
              : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: maxHeight, maxWidth: maxWidth),
          child: _buildImageContent(context),
        ),
      ),
    );
  }

  Widget _buildImageContent(BuildContext context) {
    if (imageUrl.isEmpty) return _buildPlaceholder();

    if (_isSvg) {
      return SvgPicture.network(
        imageUrl,
        height: height,
        width: width,
        fit: BoxFit.cover,
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
    return Container(width: width, height: height, color: Colors.grey[200]);
  }

  void _openFullScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder:
            (_, animation, secondaryAnimation) => FullScreenGallery(
              // 如果提供了 galleryImages 就用列表，否则就用当前单图组成的列表
              images: galleryImages ?? [imageUrl],
              initialIndex: index,
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
