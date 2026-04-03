import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/model/edge.dart';
import 'package:flutter_force_directed_graph/model/graph.dart';
import 'package:flutter_force_directed_graph/model/node.dart';
import 'package:flutter_force_directed_graph/widget/force_directed_graph_controller.dart';
import 'package:flutter_force_directed_graph/widget/force_directed_graph_widget.dart';

/// 知识图谱 todo 可新增方法功能
class CustomKnowGraph extends StatefulWidget {
  final List<String> nodeList;
  final String rootNode;
  final Color rootColor;
  final Color nodeColor;
  final Color edgeColor;
  final double borderRadius;
  const CustomKnowGraph({
    super.key,
    required this.nodeList,
    required this.rootNode,
    required this.rootColor,
    required this.nodeColor,
    required this.edgeColor,
    this.borderRadius = 10,
  });

  @override
  State<CustomKnowGraph> createState() => _CustomKnowGraphState();
}

class _CustomKnowGraphState extends State<CustomKnowGraph> {
  late final ForceDirectedGraphController<String> _controller;

  @override
  void initState() {
    super.initState();

    // 创建 Graph
    final graph = ForceDirectedGraph<String>();
    // 创建中心节点
    final rootNode = Node<String>(widget.rootNode);
    graph.addNode(rootNode);

    for (String nodeName in widget.nodeList) {
      final node = Node<String>(nodeName);
      graph.addNode(node);
      // 创建边
      graph.addEdge(Edge(rootNode, node));
    }

    // controller
    _controller = ForceDirectedGraphController(graph: graph);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.needUpdate();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      child: InteractiveViewer(
        child: ForceDirectedGraphWidget(
          controller: _controller,
          // 节点 UI
          nodesBuilder: (context, data) {
            final isRoot = data == widget.rootNode;
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isRoot ? widget.rootColor : widget.nodeColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                data,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            );
          },
          // 边 UI
          edgesBuilder: (context, a, b, distance) {
            return Container(
              width: distance,
              height: 2,
              color: widget.edgeColor,
            );
          },
        ),
      ),
    );
  }
}
