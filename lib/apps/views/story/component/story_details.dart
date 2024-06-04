import 'package:artispark/apps/core/utils/constants.dart';
import 'package:artispark/apps/core/utils/utils.dart';
import 'package:artispark/apps/data/remote_urls.dart';
import 'package:artispark/apps/views/home/controller/home_controller.dart';
import 'package:artispark/apps/views/story/controller/story_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoryDetails extends StatefulWidget {
  const StoryDetails(
      {super.key,
      this.storyController,
      required this.id,
      required this.form,
      this.homeController});

  final StoryController? storyController;
  final HomeController? homeController;
  final String id;
  final String form;

  @override
  State<StoryDetails> createState() => _StoryDetailsState();
}

class _StoryDetailsState extends State<StoryDetails> {
  @override
  void initState() {
    super.initState();

    widget.form == "home"
        ? widget.homeController?.getStoryDetails(widget.id)
        : widget.storyController?.getStoryDetails(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_sharp,
            color: iconThemeColor,
          ),
        ),
      ),
      body: Obx(
        () => widget.homeController?.isStoryDetailsLoading.value == true ||
                widget.storyController?.isStoryDetailsLoading.value == true
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: Get.width,
                            height: Get.height * 0.5,
                            child: CachedNetworkImage(
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              imageUrl: widget.form == "home"
                                  ? "${RemoteUrls.rootUrl}${widget.homeController?.storyDetails?.image}"
                                  : "${RemoteUrls.rootUrl}${widget.storyController?.storyDetails?.image}",
                              width: Get.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.form == "home"
                                ? "Posted by: ${widget.homeController?.storyDetails?.user?.name ?? ""}"
                                : "Posted by: ${widget.storyController?.storyDetails?.user?.name ?? ""}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Created at: ",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.form == "home"
                                    ? Utils.formatMonthByDate(widget.homeController
                                        ?.storyDetails?.createdAt)
                                    : Utils.formatMonthByDate(widget.storyController
                                        ?.storyDetails?.createdAt),
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     const Text(
                          //       "Updated at: ",
                          //       style: TextStyle(
                          //           fontSize: 15, fontWeight: FontWeight.bold),
                          //     ),
                          //     Text(
                          //       widget.form == "home"
                          //           ? Utils.formatDate(widget.homeController
                          //               ?.storyDetails?.updatedAt)
                          //           : Utils.formatDate(widget.storyController
                          //               ?.storyDetails?.updatedAt),
                          //       style: const TextStyle(
                          //           fontSize: 15, fontWeight: FontWeight.w500),
                          //     ),
                          //   ],
                          // ),
                          const SizedBox(height: 10),
                          Text(
                            widget.form == "home"
                                ? "${widget.homeController?.storyDetails?.title}"
                                : "${widget.storyController?.storyDetails?.title}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            widget.form == "home"
                                ? "${widget.homeController?.storyDetails?.description}"
                                : "${widget.storyController?.storyDetails?.description}",
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
