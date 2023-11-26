import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wanandroid/ui/project/provider/project_provider.dart';
import 'package:flutter/cupertino.dart';

class ProjectPage extends ConsumerStatefulWidget {
  const ProjectPage(this.cid, {Key? key}) : super(key: key);

  final int cid;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectPageState();
}

class _ProjectPageState extends ConsumerState<ProjectPage> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final cid = widget.cid;
    final projects = ref.watch(projectNotifierProvider.call(cid));
    return Scaffold(
      body: EasyRefresh(
        header: const CupertinoHeader(),
        footer: const CupertinoFooter(
            processedDuration: Duration(milliseconds: 500)),
        callLoadOverOffset: 100.h,
        refreshOnStart: true,
        onLoad: () async {
          final res = await ref
              .read(projectNotifierProvider.call(cid).notifier)
              .loadMore();
          return res ? IndicatorResult.success : IndicatorResult.fail;
        },
        onRefresh: () async {
          final res = await ref
              .read(projectNotifierProvider.call(cid).notifier)
              .refresh();
          return res ? IndicatorResult.success : IndicatorResult.fail;
        },
        child: ListView.builder(
          itemCount: projects.projectArticles.length,
          itemBuilder: (context, index) {
            final data = projects.projectArticles[index];
            return SizedBox(height: 80.h, child: Text(data.title));
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
