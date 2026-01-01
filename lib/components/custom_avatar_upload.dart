import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spark_hire_app/components/full_screen_gallery.dart';

class CustomAvatarUpload extends StatefulWidget {
  final String? avatar; // 允许为空，处理初始状态
  final double width; // 修正拼写 widget -> width
  final double height;
  final double radius; // 修正拼写 radious -> radius
  final double iconSize;
  final bool enableIcon;

  // 新增回调：当图片被选中时，将二进制数据和文件名传出去
  final Function(Uint8List fileBytes, String filename)? onImageSelected;

  const CustomAvatarUpload({
    super.key,
    this.width = 100,
    this.height = 100,
    this.radius = 50,
    required this.avatar,
    this.iconSize = 20, // 调整了默认大小，7太小了
    this.enableIcon = true,
    this.onImageSelected,
  });

  @override
  State<CustomAvatarUpload> createState() => _CustomAvatarUploadState();
}

class _CustomAvatarUploadState extends State<CustomAvatarUpload> {
  final ImagePicker _picker = ImagePicker();
  File? _localAvatarFile; // 用于本地预览

  Widget _buildEditIcon() {
    if (!widget.enableIcon) {
      return const SizedBox.shrink();
    }
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(widget.iconSize),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2.w),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.camera_alt,
          size: widget.iconSize * 2,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildAvatarImage() {
    if (_localAvatarFile != null) {
      return Image.file(
        _localAvatarFile!,
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
      );
    }

    if (widget.avatar != null && widget.avatar!.isNotEmpty) {
      return CachedNetworkImage(
        width: widget.width,
        height: widget.height,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => Container(
              color: Colors.grey[200],
              child: const Center(
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
        errorWidget:
            (context, url, error) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.person, color: Colors.grey),
            ),
        imageUrl: widget.avatar!,
      );
    }

    // 默认占位图
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.grey[200],
      child: Icon(Icons.person, size: widget.width / 2, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showPickAvatarSheet,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(widget.radius),
            child: _buildAvatarImage(),
          ),
          _buildEditIcon(),
        ],
      ),
    );
  }

  void _showPickAvatarSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.avatar != null || _localAvatarFile != null)
                ListTile(
                  leading: const Icon(Icons.photo_library_outlined),
                  title: Text(AppLocalizations.of(context)!.previewPictureText),
                  onTap: () {
                    Navigator.pop(context); // 关掉弹窗再跳转
                    _openFullScreen(context);
                  },
                ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text(AppLocalizations.of(context)!.pickImageText),
                onTap: () {
                  Navigator.pop(context);
                  _pickAvatar(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickAvatar(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        imageQuality: 80,
        maxWidth: 800,
      );

      if (image == null) return;

      final File file = File(image.path);
      final Uint8List bytes = await file.readAsBytes();
      final String filename = image.name;

      setState(() {
        _localAvatarFile = file;
      });

      if (widget.onImageSelected != null) {
        widget.onImageSelected!(bytes, filename);
      }
    } catch (e) {
      debugPrint("Error picking avatar: $e");
    }
  }

  void _openFullScreen(BuildContext context) {
    // 优先展示本地图片，如果没有则展示网络图片
    ImageProvider imageProvider;
    if (_localAvatarFile != null) {
      imageProvider = FileImage(_localAvatarFile!);
    } else {
      imageProvider = CachedNetworkImageProvider(widget.avatar!);
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => FullScreenGallery(
              images: [widget.avatar ?? ""],
              initialIndex: 0,
            ),
      ),
    );
  }
}
