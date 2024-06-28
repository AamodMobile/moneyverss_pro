import 'package:cached_network_image/cached_network_image.dart';
import 'package:fiinzy_pro/constants/constants.dart';
import 'package:fiinzy_pro/controller/blogs_controller.dart';
import 'package:fiinzy_pro/screens/blog_details_screen.dart';
import 'package:fiinzy_pro/service/api_url.dart';

class AllBolgScreen extends StatefulWidget {
  const AllBolgScreen({super.key});

  @override
  State<AllBolgScreen> createState() => _AllBolgScreenState();
}

class _AllBolgScreenState extends State<AllBolgScreen> {
  BlogsController controller =Get.put(BlogsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: Get.find<BlogsController>(),
        initState: (state) {
          Get.find<BlogsController>().blogListGet();
        },
        builder: (contextCtr) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: homeBgCl,
              appBar: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 65),
                child: Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16,),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      border: Border.fromBorderSide(
                          BorderSide(color: Color(0xFFB6D3FF)))),
                  child: Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 8, right: 8),
                            child: Image.asset(
                              icBack,
                              height: 24,
                              width: 24,
                            ),
                          )),
                      Text(
                        "Blogs",
                        style: TextStyle(
                          color: draKText,
                          fontFamily: semiBold,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              body: SingleChildScrollView(
                child: Builder(builder: (context) {
                  if (contextCtr.loading) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 200,
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: mainColor,
                          backgroundColor: primaryCl,
                        ),
                      ),
                    );
                  }
                  if (contextCtr.blogList.isEmpty) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height - 200,
                      child: const Center(
                        child: Text(
                          "No Blog Found",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: medium,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        removeBottom: true,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: contextCtr.blogList.length,
                          itemBuilder: (BuildContext context, int index) {
                            String createdAtString = contextCtr.blogList[index].createdAt.toString();
                            DateTime createdAt = DateTime.parse(createdAtString);
                            String formattedDate = "${createdAt.day}-${createdAt.month}-${createdAt.year}";
                            return GestureDetector(
                                onTap: () {
                                  Get.to(() => BlogDetailsScreen(
                                    id: contextCtr.blogList[index].id.toString(),
                                    tittle: contextCtr.blogList[index].title.toString(),
                                  ));
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(255, 255, 255, 1),
                                    border: Border.all(color: primaryClNew.withOpacity(0.43)),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  margin: const EdgeInsets.symmetric(horizontal: 17, vertical: 6),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 72,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8),
                                              child: contextCtr.blogList[index].image != ""
                                                  ? CachedNetworkImage(
                                                errorWidget: (context,
                                                    url, error) =>
                                                    Image.asset(
                                                      bannerImg,
                                                      fit: BoxFit.fill,
                                                    ),
                                                fit: BoxFit.fill,
                                                height: 72,
                                                width: 72,
                                                imageUrl: contextCtr.blogList[index].image
                                                    .toString(),
                                                placeholder: (a, b) =>
                                                const Center(
                                                  child:
                                                  CircularProgressIndicator(),
                                                ),
                                              )
                                                  : Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(6),
                                                  image: const DecorationImage(image: AssetImage(bannerImg), fit: BoxFit.fill),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  contextCtr.blogList[index].title.toString(),
                                                  overflow: TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: Colors.black,
                                                  ),
                                                  maxLines: 2,
                                                ),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    const Icon(
                                                      Icons.calendar_month,
                                                      size: 10,
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      formattedDate,
                                                      style: const TextStyle(
                                                        fontWeight: FontWeight.w400,
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
                                      const SizedBox(height: 8),

                                      Container(
                                        height: 1,
                                        width: MediaQuery.of(context).size.width,
                                        color: appBarClNew1,
                                      ),
                                      const SizedBox(height: 8),
                                      SizedBox(
                                        child: Text(
                                          contextCtr.blogList[index].shortDes.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Color.fromRGBO(104, 104, 104, 1)),
                                          maxLines: 3,
                                        ),
                                      ),
                                      /* Html(
                                                      shrinkWrap: true,
                                                      data: contextCtrl.blogList[index].shortDes.toString(),
                                                      style: {
                                                        '#': Style(fontSize: FontSize(10),
                                                        fontWeight: FontWeight.w500,
                                                         maxLines: 3,
                                                        color: const Color.fromRGBO(104, 104, 104, 1)),
                                                      },
                                                    ),*/
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.011),
                    ],
                  );
                }),
              ),
            ),
          );
        });
  }
}
