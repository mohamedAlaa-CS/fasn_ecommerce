import 'package:fasn_ecommerce/core/helper/extensions/assetss_widgets.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:fasn_ecommerce/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class QummanQustionPage extends StatefulWidget {
  const QummanQustionPage({super.key, this.commonQuestio});
  final commonQuestio;
  static const String routeName = 'QummanQustionPage';
  @override
  State<QummanQustionPage> createState() => _QummanQustionPageState();
}

class _QummanQustionPageState extends State<QummanQustionPage> {
  int? currntIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: Padding(
            padding: 14.aEdge,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // ? back button ================
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  padding: EdgeInsets.zero,
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                    size: 28,
                  ),
                ),
                //? question text ================
                Expanded(
                  child: ListView.builder(
                      itemCount: widget.commonQuestio.length,
                      itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.grey.withOpacity(0.2)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 14,
                                right: 14,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Theme(
                                    data: ThemeData(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                    ),
                                    child: ListTile(
                                      title: Text(
                                        widget.commonQuestio[i].question,
                                        style: AppStyles.style20,
                                      ),
                                      trailing: Icon(
                                        currntIndex == i
                                            ? Icons.remove
                                            : Icons.add,
                                        color: AppColors.white,
                                      ),
                                      contentPadding: 4.aEdge,
                                      onTap: () {
                                        setState(() {
                                          if (i == currntIndex) {
                                            currntIndex = null;
                                          } else {
                                            currntIndex = i;
                                          }
                                        });
                                      },
                                    ),
                                  ),
                                  if (currntIndex == i)
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        widget.commonQuestio[i].answer,
                                        style: AppStyles.style18,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
