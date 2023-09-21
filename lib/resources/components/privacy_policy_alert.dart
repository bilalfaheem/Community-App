



import 'dart:ui';

import 'package:beam_tv_1/resources/components/logout.dart';
import 'package:beam_tv_1/resources/components/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrivacyPolicyAlert extends StatefulWidget {
  const PrivacyPolicyAlert({super.key});

  @override
  State<PrivacyPolicyAlert> createState() => _PrivacyPolicyAlertState();
}

class _PrivacyPolicyAlertState extends State<PrivacyPolicyAlert> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        Center(
          child: Material(
            child: Container(
              width: 350.w,
              // margin: EdgeInsets.symmetric(horizontal: 10,),
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "PRIVACY POLICY",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab quos ratione animi eligendi voluptas possimus sapiente vel voluptates odio. Similique, repudiandae eveniet magni, accusamus praesentium ipsum beatae sint quam eligendi quibusdam totam reiciendis provident aut porro, officia odio. Exercitationem eligendi quod assumenda sint cumque, maxime nulla nisi illum harum non beatae nobis quidem adipisci laborum, iure reprehenderit deserunt quia! Voluptatibus a quasi nobis. Vel impedit temporibus voluptate iste neque facilis autem at asperiores tenetur saepe, laborum natus mollitia est ipsa minima soluta ipsam, quas sed repellendus dolore, nemo dicta odio possimus. Aut omnis, rerum a quam assumenda, corporis rem repudiandae nulla labore fugit delectus, eligendi voluptas optio et enim iure? Voluptates reprehenderit et molestiae ut, repellat consequuntur dolores a modi voluptas tenetur perferendis expedita neque voluptatibus recusandae harum. Ipsa explicabo eligendi minima natus corrupti a quibusdam nisi labore, quis eum culpa fuga et incidunt sunt dicta quam voluptatum sed consectetur ex tempora. Provident amet velit asperiores obcaecati mollitia. Optio consequuntur doloremque deleniti placeat dignissimos ullam magni magnam nobis nihil provident quia repellat, natus perspiciatis distinctio nisi suscipit? Libero commodi ipsum distinctio quibusdam magnam doloribus rem ducimus placeat, temporibus nulla laboriosam culpa doloremque quos. Molestias fugiat nisi voluptas molestiae ut modi maiores quod? Eos fugiat sit nulla repellendus harum dolorum sapiente ipsum nesciunt. Exercitationem est incidunt quod quibusdam ullam harum officiis dolorem molestias atque recusandae dolor ad adipisci, maiores aspernatur doloremque! Sed laudantium repellat libero aliquid veritatis laboriosam commodi harum, in odit inventore dolorem maxime, eligendi ex reiciendis ipsam tenetur neque voluptatum. Fuga magnam explicabo mollitia, ipsam deleniti sapiente aperiam nihil eligendi inventore natus ea dolor doloremque aliquam unde enim corporis fugiat? Doloribus modi placeat nulla earum sapiente! Beatae incidunt non veniam deleniti soluta atque officiis ad fuga, quisquam natus dolorum, unde corrupti perspiciatis, laboriosam laudantium aliquam fugiat delectus architecto doloremque! Nam, in accusamus, alias, error molestias optio dolorum temporibus excepturi numquam sit autem distinctio? A vero eligendi, eos laboriosam accusantium ab temporibus libero doloremque possimus assumenda adipisci eaque dolore fuga distinctio veritatis. Natus pariatur non dolor! Voluptatem praesentium velit molestias vel quo adipisci dolores! Nostrum natus dolorem cupiditate earum sequi inventore tenetur aperiam laborum. Molestias modi sequi earum mollitia dolor reprehenderit dicta nisi eaque eveniet excepturi deserunt praesentium officiis qui dolore, hic reiciendis rerum nam repudiandae. Explicabo repudiandae nisi tempore beatae, reiciendis omnis non nulla? Alias doloremque tempora animi voluptatibus provident quibusdam consequatur quas vel repellendus modi voluptatem sed beatae veniam deleniti obcaecati labore architecto, vero sunt pariatur dolorum molestias cumque vitae porro? Veniam, temporibus iusto architecto doloribus aperiam eveniet expedita id beatae optio consectetur itaque voluptas nihil pariatur deleniti minus mollitia ratione magni ex omnis sunt eum! Odit in molestiae maiores facilis? Aspernatur exercitationem pariatur corrupti facilis id veniam eaque mollitia deleniti quas quaerat nemo temporibus neque nihil dolorum enim adipisci explicabo et modi maiores ab suscipit aliquid, laudantium rem? Ex vero maxime dolores sit excepturi explicabo consequatur, a eius sint adipisci amet, sunt est cupiditate accusantium eum deserunt dolore aliquid non natus culpa. Officia soluta natus maxime, temporibus quam autem aliquid quo et consequuntur rem nostrum earum neque perferendis cum tempore molestiae quae laboriosam at. Voluptate voluptatem illum saepe suscipit sit expedita natus officiis odio deleniti, et laboriosam numquam sunt ipsum! Hic dolorem ut aspernatur atque provident laborum aliquam quos debitis unde minus nisi praesentium, delectus totam aperiam sit alias possimus laudantium perspiciatis illum necessitatibus! Quis, ex vero nam rem sunt aut totam modi consequatur quas numquam illo impedit voluptatem atque. Error maiores iusto quas. Aut at earum incidunt quam cupiditate dicta provident quis, unde aliquid commodi, expedita explicabo minima delectus illum autem velit architecto, consectetur maxime? Nulla, totam aliquid minima ex non quis sint exercitationem nisi culpa! Nostrum, suscipit ullam, quae ea in adipisci similique odit voluptatum magni possimus velit placeat voluptatem! Porro, explicabo rerum inventore sed vel ex, et nesciunt tempore aperiam corporis tempora totam neque provident dignissimos saepe repellat quo maxime. Ab consequuntur magni saepe facilis atque? Placeat a nemo hic architecto, alias nulla quo asperiores laboriosam perferendis consectetur non fugiat magnam qui officia, harum, corporis necessitatibus commodi ipsa quod obcaecati. Voluptas, sapiente reiciendis. Ipsam nobis id eos explicabo ex similique assumenda distinctio doloremque tenetur, dolores architecto quis enim totam quos minima exercitationem! Rem, veritatis nostrum fugiat doloribus repellendus aut ad sapiente consequuntur aspernatur et libero dolor non perspiciatis commodi laborum officia, voluptate optio hic, quia accusantium quam dignissimos! Eligendi sunt totam nam voluptatem praesentium temporibus quia placeat velit suscipit eveniet voluptatum sed, commodi accusamus facilis blanditiis tenetur quis maxime maiores dolorem illum? Nisi, assumenda quia expedita perferendis est id voluptate neque nostrum aspernatur eveniet impedit maiores accusamus magnam fugit voluptatibus dignissimos. Labore qui, atque officiis molestias ducimus incidunt minima illum maxime mollitia ipsam consectetur unde nemo, vel pariatur explicabo eum praesentium. Aperiam optio illo, ab asperiores corrupti in reiciendis tempore! Beatae, debitis omnis corrupti eius non iste, culpa error deleniti esse incidunt aperiam dolores. Harum repudiandae consectetur sed modi corrupti! Numquam, voluptatibus distinctio, repudiandae maiores earum quidem fugiat excepturi iste ab harum repellendus, consectetur perferendis tenetur cumque debitis perspiciatis sit neque molestiae atque ipsum laboriosam? Voluptates aspernatur atque beatae illo! Repellendus provident harum corrupti odio magnam nisi cupiditate, facere quo culpa voluptatem in! Expedita earum recusandae ad doloremque numquam, sit nihil ratione vel cupiditate similique neque ex esse unde nulla quam aspernatur iusto qui ullam illo iure dolor pariatur illum! Adipisci sed inventore, dicta quaerat repudiandae impedit vitae ipsa, soluta repellendus, ut optio alias est enim exercitationem a praesentium tempore facere itaque? Odit voluptatum earum enim, quasi itaque culpa. Similique, cum? Sint unde alias adipisci repudiandae modi similique facilis consequatur recusandae repellat quo doloribus, quis animi cupiditate cum placeat quia quas! Fugit mollitia dolores aut laudantium reprehenderit necessitatibus? Deserunt sit harum id dicta facilis doloremque vero odit, aliquam atque quisquam? Nihil doloremque natus nisi culpa ratione eum quas eius voluptatem blanditiis, soluta, aut eveniet libero excepturi tenetur dicta repellendus reprehenderit consequatur quasi ducimus esse ex consequuntur voluptate, sequi officiis. Vitae quod saepe quas delectus totam omnis, expedita commodi itaque voluptatum ratione. Aspernatur, ducimus adipisci?",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                        PrimaryButton(
                          title: "OK",
                          // loading: true,
                          func: () {
                            // Loading()
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}