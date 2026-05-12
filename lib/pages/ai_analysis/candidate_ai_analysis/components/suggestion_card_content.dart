import 'package:flutter/material.dart';

class SuggestionCardContent extends StatelessWidget {
  const SuggestionCardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
