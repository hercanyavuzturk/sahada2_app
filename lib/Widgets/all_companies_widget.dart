import 'package:flutter/material.dart';
import 'package:sahada2_app/Search/user_profile.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AllWorkersWidget extends StatefulWidget {

  final String userID;
  final String userName;
  final String userEmail;
  final String phoneNumber;
  final String userImageUrl;

  const AllWorkersWidget({super.key,
    required this.userID,
    required this.userName,
    required this.userEmail,
    required this.phoneNumber,
    required this.userImageUrl,
});


  @override
  State<AllWorkersWidget> createState() => _AllWorkersWidgetState();
}

class _AllWorkersWidgetState extends State<AllWorkersWidget> {

  void _mailTo() async
  {
    var mailUrl = 'mailto:${widget.userEmail}';
    print('widget.userEmail ${widget.userEmail}');

    if (await launchUrlString(mailUrl))
    {
      await launchUrlString(mailUrl);
    }
    else
      {
        print('Hata');
        throw 'Hata Alındı';
      }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      child: ListTile(
        onTap: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> UserProfile(userID:widget.userID)));
       },
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        leading: Container(
          padding: const EdgeInsets.only(right: 12),
          decoration: const BoxDecoration(
            border: Border(
              right: BorderSide(width: 1),
            )
          ),
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            // ignore: prefer_if_null_operators
            child: Image.network(widget.userImageUrl == null
              ?
              'https://cdn.icon-icons.com/icons2/2643/PNG/512/male_boy_person_people_avatar_icon_159358.png'
              :
                widget.userImageUrl
            ),
          ),
        ),
        title: Text(
          widget.userName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,

          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              'Profili ziyaret et',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
        trailing: IconButton(
          icon:const Icon(
            Icons.mail_outline,
            size: 30,
            color: Colors.grey,
          ),
          onPressed: (){
            _mailTo();
          },
        ),
      ),
    );
  }
}
