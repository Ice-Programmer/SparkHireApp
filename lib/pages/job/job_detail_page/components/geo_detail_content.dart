import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:spark_hire_app/model/information/geo_info.dart';

class JobLocationMapCard extends StatelessWidget {
  final GeoDetailInfo geoInfo;

  const JobLocationMapCard({super.key, required this.geoInfo});

  @override
  Widget build(BuildContext context) {
    final bool hasLocation =
        geoInfo.latitude != null && geoInfo.longitude != null;
    final LatLng centerLatLng =
        hasLocation
            ? LatLng(geoInfo.latitude!, geoInfo.longitude!)
            : const LatLng(39.9042, 116.4074);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.15),
          width: 0.5,
        ),
        // 添加极轻微的阴影提升卡片质感
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8.r,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 上半部分：地图预览
            if (hasLocation)
              SizedBox(
                height: 140.h,
                width: double.infinity,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: centerLatLng,
                    initialZoom: 14.0,
                    // 禁用地图内的所有交互，防止和页面的垂直滚动冲突
                    interactionOptions: const InteractionOptions(
                      flags: InteractiveFlag.none,
                    ),
                  ),
                  children: [
                    // 底图
                    TileLayer(
                      urlTemplate:
                          'https://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
                      subdomains: const ['1', '2', '3', '4'],
                    ),
                    // 标记层：显示定位 Icon
                    MarkerLayer(
                      markers: [
                        Marker(
                          point: centerLatLng,
                          width: 40.w,
                          height: 40.h,
                          child: Icon(
                            Icons.location_on,
                            color: Theme.of(context).colorScheme.primary,
                            size: 32.r,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            // 下半部分：地址文本与导航按钮
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "${geoInfo.secondGeoLevelName ?? ''} ${geoInfo.thirdGeoLevelName ?? ''} ${geoInfo.forthGeoLevelName ?? ''}",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          geoInfo.address ?? "暂无详细地址",
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.grey[700],
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  12.horizontalSpace,

                  // 导航/查看按钮
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12.r),
                    child: Container(
                      padding: EdgeInsets.all(12.r),
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withValues(alpha: 0.08),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.navigation_outlined, // 换成导航图标，更有行动暗示
                        color: Theme.of(context).colorScheme.primary,
                        size: 22.r,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
