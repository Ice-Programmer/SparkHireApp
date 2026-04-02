import 'package:flutter/material.dart';
import 'package:flutter_force_directed_graph/flutter_force_directed_graph.dart';

class GraphDemo extends StatefulWidget {
  const GraphDemo({super.key});

  @override
  State<GraphDemo> createState() => _GraphDemoState();
}

class _GraphDemoState extends State<GraphDemo> {
  late final ForceDirectedGraphController<String> _controller;

  @override
  void initState() {
    super.initState();

    // 1️⃣ 创建 Graph
    final graph = ForceDirectedGraph<String>();

    // 2️⃣ 手动创建 Node（重点！）
    final backend = Node<String>('Backend');
    final java = Node<String>('Java');
    final spring = Node<String>('Spring');
    final mysql = Node<String>('MySQL');
    final redis = Node<String>('Redis');

    // 3️⃣ 加入 graph
    graph.addNode(backend);
    graph.addNode(java);
    graph.addNode(spring);
    graph.addNode(mysql);
    graph.addNode(redis);

    // 4️⃣ 创建 Edge（重点！）
    graph.addEdge(Edge(backend, java));
    graph.addEdge(Edge(backend, spring));
    graph.addEdge(Edge(spring, mysql));
    graph.addEdge(Edge(spring, redis));

    // 5️⃣ controller
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
    return ForceDirectedGraphWidget(
      controller: _controller,

      // ✅ 节点 UI
      nodesBuilder: (context, data) {
        final isRoot = data == 'Backend';

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: isRoot ? Colors.blue : Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            data,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      },

      // ✅ 边 UI
      edgesBuilder: (context, a, b, distance) {
        return Container(
          width: distance,
          height: 2,
          color: Colors.grey,
        );
      },
    );
  }
}