import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CandidateAiAnalysisPage extends StatelessWidget {
  const CandidateAiAnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    final overviewItems = [
      {"title": "个人信息", "icon": Icons.person, "count": "2 条待优化"},
      {"title": "教育经历", "icon": Icons.school, "count": "1 条待优化"},
      {"title": "工作经历", "icon": Icons.work, "count": "3 条待优化"},
      {"title": "技能标签", "icon": Icons.code, "count": "1 条待优化"},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "AI 优化建议",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        actions: [
          Row(
            children: [
              Icon(
                Icons.history,
                size: 16.sp,
                color: Theme.of(context).colorScheme.primary,
              ),

              4.horizontalSpace,

              Text(
                "历史建议",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp,
                ),
              ),

              20.horizontalSpace,
            ],
          ),
        ],
      ),
      body: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// AI Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF6F2FF), Color(0xFFF8F8FF)],
                  ),
                ),
                child: Row(
                  children: [
                    /// 左边
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 24, // 34 -> 24
                                backgroundColor: Colors.deepPurple.shade100,
                                child: const Icon(
                                  Icons.person,
                                  size: 26, // 38 -> 26
                                  color: Colors.deepPurple,
                                ),
                              ),
                              const SizedBox(width: 12),

                              /// 名字
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "IceProgrammer",
                                    style: TextStyle(
                                      fontSize: 18, // 24 -> 18
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Row(
                                    children: [
                                      _tag(
                                        "目前可随时到岗",
                                        Colors.green.shade50,
                                        Colors.green,
                                      ),
                                      const SizedBox(width: 6),
                                      _tag(
                                        "23岁",
                                        Colors.deepPurple.shade50,
                                        Colors.deepPurple,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),

                          const SizedBox(height: 16),

                          const Text(
                            "根据你的资料，AI 已为你生成专属优化建议，\n提升个人竞争力，获得更多机会！",
                            style: TextStyle(
                              height: 1.5,
                              color: Colors.black87,
                              fontSize: 13, // 15 -> 13
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// 右边插画
                    Container(
                      width: 80, // 120 -> 80
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.auto_awesome,
                        color: Colors.deepPurple,
                        size: 40, // 60 -> 40
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              /// 综合评分
              Container(
                padding: const EdgeInsets.all(16), // 24 -> 16
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Row(
                  children: [
                    /// 左边
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "综合优化评分",
                            style: TextStyle(
                              fontSize: 16, // 20 -> 16
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 12),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                "78",
                                style: TextStyle(
                                  fontSize: 48, // 64 -> 48
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "/100",
                                  style: TextStyle(
                                    fontSize: 18, // 26 -> 18
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Icon(
                                Icons.arrow_upward,
                                size: 14,
                                color: Colors.deepPurple.shade600,
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Text(
                                  "比同类用户高出 32%，继续优化可冲击 90+",
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    height: 1.4,
                                    fontSize: 12, // 缩小说明文字
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 16),

                    /// 圆形分数
                    SizedBox(
                      width: 80, // 120 -> 80
                      height: 80,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(
                              value: 0.78,
                              strokeWidth: 8, // 10 -> 8
                              backgroundColor: Colors.deepPurple.shade50,
                              valueColor: AlwaysStoppedAnimation(
                                Colors.deepPurple.shade600,
                              ),
                            ),
                          ),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "78",
                                style: TextStyle(
                                  fontSize: 24, // 32 -> 24
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "优秀",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "优化建议概览",
                style: TextStyle(
                  fontSize: 20, // 28 -> 20
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 16),

              /// 概览
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: overviewItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 1.1, // 1.2 -> 1.1 给出更多垂直空间防止溢出
                ),
                itemBuilder: (context, index) {
                  final item = overviewItems[index];

                  return Container(
                    padding: const EdgeInsets.all(14), // 18 -> 14
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 42, // 54 -> 42
                          height: 42,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            item["icon"] as IconData,
                            color: Colors.deepPurple.shade600,
                            size: 22, // 28 -> 22
                          ),
                        ),

                        const Spacer(),

                        Text(
                          item["title"] as String,
                          style: const TextStyle(
                            fontSize: 15, // 18 -> 15
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          item["count"] as String,
                          style: TextStyle(
                            color: Colors.orange.shade700,
                            fontWeight: FontWeight.w600,
                            fontSize: 12, // 缩小字体防止越界
                          ),
                        ),

                        const SizedBox(height: 8),

                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: 0.45,
                            minHeight: 4, // 6 -> 4
                            backgroundColor: Colors.grey.shade200,
                            valueColor: AlwaysStoppedAnimation(
                              Colors.orange.shade400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              /// 建议卡片
              const SuggestionSection(
                icon: Icons.person,
                title: "个人信息",
                count: "2 条建议",
                suggestionTitle: "完善个人简介，突出你的技术优势",
                desc: "你的简介较为简短，建议补充技术栈、项目经验或个人特色，让招聘官快速了解你的优势。",
                tag: "重要",
                acceptCount: "已有 128 人采纳",
              ),

              const SizedBox(height: 16),

              const SuggestionSection(
                icon: Icons.school,
                title: "教育经历",
                count: "1 条建议",
                suggestionTitle: "补充在校项目或相关课程",
                desc: "添加相关课程、竞赛或项目经验，能更好展示你的学习能力和实践经验。",
                tag: "建议",
                acceptCount: "已有 86 人采纳",
              ),

              const SizedBox(height: 16),

              const SuggestionSection(
                icon: Icons.work,
                title: "工作经历",
                count: "3 条建议",
                suggestionTitle: "增加项目成果的数据化表达",
                desc: "建议在工作经历中增加性能提升、用户增长、效率优化等数据，让你的经历更有说服力。",
                tag: "推荐",
                acceptCount: "已有 203 人采纳",
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _tag(String text, Color bg, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 10, // 12 -> 10
        ),
      ),
    );
  }
}

class SuggestionSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;
  final String suggestionTitle;
  final String desc;
  final String tag;
  final String acceptCount;

  const SuggestionSection({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
    required this.suggestionTitle,
    required this.desc,
    required this.tag,
    required this.acceptCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16), // 22 -> 16
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          /// header
          Row(
            children: [
              Icon(
                icon,
                color: Colors.deepPurple.shade600,
                size: 24, // 28 -> 24
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18, // 24 -> 18
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Text(
                count,
                style: TextStyle(
                  color: Colors.deepPurple.shade600,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.keyboard_arrow_up,
                color: Colors.deepPurple.shade600,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// suggestion
          Container(
            padding: const EdgeInsets.all(14), // 18 -> 14
            decoration: BoxDecoration(
              color: const Color(0xFFF9F9FC),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "✨",
                      style: TextStyle(fontSize: 18), // 22 -> 18
                    ),
                    const SizedBox(width: 8),

                    Expanded(
                      child: Text(
                        suggestionTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15, // 18 -> 15
                        ),
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: Colors.deepPurple.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 11, // 12 -> 11
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    height: 1.5,
                    fontSize: 13, // 15 -> 13
                  ),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14, // 18 -> 14
                        vertical: 8, // 12 -> 8
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "去优化",
                        style: TextStyle(
                          color: Colors.deepPurple.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Icon(
                      Icons.thumb_up_alt_outlined,
                      size: 16, // 18 -> 16
                      color: Colors.grey.shade600,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      acceptCount,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
