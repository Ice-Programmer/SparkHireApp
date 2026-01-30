import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';
import 'package:spark_hire_app/model/information/geo_info.dart';

class GeoEditPage extends StatefulWidget {
  final GeoDetailInfo? geoDetailInfo;
  const GeoEditPage({super.key, this.geoDetailInfo});

  @override
  State<GeoEditPage> createState() => _GeoEditPageState();
}

class _GeoEditPageState extends State<GeoEditPage> {
  bool _isRegionSelected = false;
  
  Map<String, dynamic> geoInfo = {
    "firstGeoLevelId": null,
    "secondGeoLevelId": null,
    "thirdGeoLevelId": null,
    "forthGeoLevelId": null,
    "address": "请先选择所属区域",
    "latitude": 30.274085,
    "longitude": 120.155070,
  };

  late MapController _mapController;
  LatLng _currentCenter = LatLng(30.274085, 120.155070);

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _selectRegion() async {
    setState(() {
      _isRegionSelected = true;
      geoInfo["firstGeoLevelId"] = 1;
      geoInfo["secondGeoLevelId"] = 11;
      geoInfo["thirdGeoLevelId"] = 86;
      geoInfo["address"] = "浙江省杭州市余杭区五常街道";
      _currentCenter = LatLng(30.274085, 120.155070);
      _mapController.move(_currentCenter, 15.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("位置编辑", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Step 1: 行政区划选择框 (前置条件)
          _buildStepOneSelector(),

          // Step 2: 地图微调区域 (受控于 _isRegionSelected)
          _buildStepTwoMap(),

          // Step 3: 底部详情确认
          _buildBottomDetail(),
        ],
      ),
    );
  }

  // 第一步：级联选择点击区域
  Widget _buildStepOneSelector() {
    return Container(
      padding: EdgeInsets.all(16.w),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(4.r)),
                child: Text("STEP 1", style: TextStyle(color: Colors.white, fontSize: 10.sp)),
              ),
              8.horizontalSpace,
              Text("选择行政区域", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
            ],
          ),
          10.verticalSpace,
          GestureDetector(
            onTap: _selectRegion,
            child: Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: _isRegionSelected ? Colors.blue.withOpacity(0.05) : Colors.grey[100],
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: _isRegionSelected ? Colors.blue : Colors.transparent, width: 1),
              ),
              child: Row(
                children: [
                  Icon(Icons.account_balance_outlined, size: 20.sp, color: _isRegionSelected ? Colors.blue : Colors.grey),
                  12.horizontalSpace,
                  Expanded(
                    child: Text(
                      _isRegionSelected ? "浙江省 / 杭州市 / 余杭区 / 五常街道" : "点击选择 省 / 市 / 区 / 街道",
                      style: TextStyle(
                        fontSize: 15.sp, 
                        color: _isRegionSelected ? Colors.black : Colors.grey,
                        fontWeight: _isRegionSelected ? FontWeight.w500 : FontWeight.normal
                      ),
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 第二步：地图区域
  Widget _buildStepTwoMap() {
    return Expanded(
      child: Stack(
        children: [
          // 当未选择区域时，地图变灰且禁止交互
          Opacity(
            opacity: _isRegionSelected ? 1.0 : 0.4,
            child: AbsorbPointer(
              absorbing: !_isRegionSelected,
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: _currentCenter,
                  initialZoom: 15.0,
                  onPositionChanged: (position, hasGesture) {
                    if (hasGesture) {
                      setState(() {
                        geoInfo['latitude'] = position.center.latitude;
                        geoInfo['longitude'] = position.center.longitude;
                      });
                    }
                  },
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://webrd0{s}.is.autonavi.com/appmaptile?lang=zh_cn&size=1&scale=1&style=8&x={x}&y={y}&z={z}',
                    subdomains: const ['1', '2', '3', '4'],
                  ),
                ],
              ),
            ),
          ),
          
          // 中心指示器
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: Icon(
                Icons.location_on, 
                color: _isRegionSelected ? Colors.redAccent : Colors.grey, 
                size: 40.sp
              ),
            ),
          ),

          // 未激活时的提示遮罩（可选）
          if (!_isRegionSelected)
            Container(
              color: Colors.black.withOpacity(0.05),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.r)),
                child: Text("请先完成 STEP 1 以解锁地图微调", style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
              ),
            ),
        ],
      ),
    );
  }

  // 第三步：底部详情区
  Widget _buildBottomDetail() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("确认详细地址", style: TextStyle(fontSize: 14.sp, color: Colors.grey, fontWeight: FontWeight.bold)),
          12.verticalSpace,
          
          Text(
            _isRegionSelected ? geoInfo['address'] : "等待选择区域...",
            style: TextStyle(
              fontSize: 16.sp, 
              fontWeight: FontWeight.w600,
              color: _isRegionSelected ? Colors.black : Colors.grey[400]
            ),
          ),
          
          15.verticalSpace,
          
          Row(
            children: [
              _buildTag("LAT: ${geoInfo['latitude'].toStringAsFixed(4)}"),
              8.horizontalSpace,
              _buildTag("LNG: ${geoInfo['longitude'].toStringAsFixed(4)}"),
            ],
          ),
          
          24.verticalSpace,
          
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: _isRegionSelected ? () {
                print("最终保存: $geoInfo");
              } : null, // 未选区域时禁用按钮
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                disabledBackgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
                elevation: 0,
              ),
              child: Text(
                _isRegionSelected ? "确认位置" : "请先选择区域", 
                style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(4.r)),
      child: Text(label, style: TextStyle(fontSize: 11.sp, color: Colors.grey[600], fontFamily: 'monospace')),
    );
  }
}