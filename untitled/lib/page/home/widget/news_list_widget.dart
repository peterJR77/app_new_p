import 'package:flutter/material.dart';
import 'package:untitled/core/models/source_model.dart';
import 'package:untitled/page/home/widget/articles_List_Widget.dart';
import 'package:untitled/page/home/widget/tab_item_widget.dart';
class NewsListWidget extends StatefulWidget {
  final List<SourceModel>sourcesList;
  const NewsListWidget({super.key, required this.sourcesList});

  @override
  State<NewsListWidget> createState() => _NewsListWidgetState();
}

class _NewsListWidgetState extends State<NewsListWidget> {
  int selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            initialIndex:selectedIndex ,
            child: TabBar(
              onTap: (value){
                selectedIndex= value;
                setState(() {

                });
              },
              padding: const EdgeInsets.symmetric(vertical: 8),
              indicator: const BoxDecoration(),
              labelPadding: const EdgeInsets.symmetric(horizontal: 10),
              dividerColor: Colors.transparent,
              isScrollable: true,
              tabs: widget.sourcesList.map((e) => TabItemWidget(sourceModel: e , isSelected: selectedIndex ==  widget.sourcesList.indexOf(e)
              ))
                  .toList(),
            )
        ),
    ArticlesListWidget(sourceId: widget.sourcesList[selectedIndex].id,
    )
      ],
    );
  }
}

