class News {
  final String title;
  final String content;
  final String imgLink;
  final int minRead;
  final DateTime dateTime;

  News({
    required this.title,
    required this.content,
    required this.imgLink,
    required this.minRead,
    required this.dateTime,
  });

  static final List<News> breakingNews = [
    News(
      title:
          'Gilgeous-Alexander takes over late, sparks Thunder comeback in Dallas to win Game 4, even series',
      content: '''
All season long, Shai Gilgeous-Alexander and the Oklahoma City Thunder were quietly one of the better clutch teams in the NBA. They were again Monday night and it may have saved their season.

SGA took control of the game in the fourth quarter after the Thunder offense looked dazed and confused for much of the night. Gilgeous-Alexander got some help from Jalen Williams in the fourth, plus Chet Holmgren and Lu Dort hit clutch 3-pointers late — and, unlike Dallas, Oklahoma City hit its free throws.

All that proved to be enough.

In a “how did that happen” kind of game — the kind of ending that can turn a series — the Thunder left Dallas with a 100-96 win Monday, tying up the series 2-2 heading back to Oklahoma City for Game 5.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/bc4d16c/2147483647/strip/true/crop/8640x4860+0+450/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2Ff7%2Fdb%2F20f614b8473b886b80ac196bab42%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F2152323887',
      minRead: 2,
      dateTime: DateTime.utc(2024, 5, 14, 1, 15),
    ),
    News(
      title:
          'Donovan Mitchell out for Cavaliers’ must-win Game 4 due to a calf injury',
      content: '''
Donovan Mitchell has been on the bench 24 minutes in the three games against Boston, and Cleveland is -31 in those minutes with an offensive rating of 68.9.

Cleveland will be without Donovan Mitchell for a full 48 minutes in a critical Game 4 on Monday night. Mitchell is out with a strained calf, the team announced (Adrian Wojnarowski of ESPN broke the story). Cleveland is down 2-1 in the series, and if it drops Game 5 coming back against the deep, No. 1 seed Celtics would be an insurmountable task.

Mitchell’s calf started bothering him in the fourth quarter of Game 3, and the team monitored the situation (he was officially questionable for Game 4). Mitchell was not at shootaround during the day, nor was he seen warming up pregame. Here is what Bickerstaff said pregame, via Evan Dammarell of Right Down Euclid.

“He wants to play. He’ll do everything in his power to play. But, like we do with all our guys, if they can’t put themselves in a position to protect themselves, we won’t let them play.”

Mitchell has averaged 31.7 points, 6.3 rebounds, and 5.3 assists a game while shooting 53.3% from 3 in this series. Mitchell has been the primary shot creator and the focus of the Celtics defense for three games, now that spotlight will shift to Darius Garland. Caris LeVert will move into the starting lineup for Mitchell. Jarrett Allen also remains out for Cleveland.

Beyond Game 4, these playoffs were important to the Cavaliers keeping Mitchell long-term. Mitchell has one year left on his contract at \$35.4 million, and this summer, the Cavaliers will put a max contract extension on the table for four years and an estimated \$199 million. Will Mitchell sign it and stay in Cleveland as the centerpiece of their team? If he does not, the Cavaliers will be forced to consider trading him, and the trade buzz around Mitchell is already real.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/a8e7eeb/2147483647/strip/true/crop/5747x3233+0+299/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2F0f%2Fa2%2Fbfb63d49478d815b2fcca3263e93%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F2152263814',
      minRead: 5,
      dateTime: DateTime.utc(2024, 5, 13, 18, 41),
    ),
    News(
      title:
          'Pelicans reportedly will “aggressively” try to trade Brandon Ingram, hesitant to extend him',
      content: '''
Last season, the New Orleans Pelicans had a -3 net rating when Zion Williamson, CJ McCollum and Brandon Ingram shared the court. It was far worse than that during the playoffs (-35 net rating) while the Pelicans were swept out of the playoffs by the Thunder.

Ingram is extension eligible this offseason, but instead New Orleans is going to aggressively try to trade him, reports NBA insider Marc Stein in his latest newsletter.

“A growing belief leaguewide that Pelicans will aggressively explore the trade market for Brandon Ingram before next season,”

Philadelphia, Cleveland, Atlanta, and Orlando are the teams considered likely to be interested, according to Stein.

Ingram is a high-level isolation scorer who averaged 20.8 points, 5.7 assists, and 5.1 rebounds per game this season. However, there has never been a natural chemistry between him, Zion, and McCollum. New Orleans is committed to Zion long-term and is not looking to move on from the “adult in the room” in McCollum, which could leave Ingram as the guy without a chair when the music stops.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/23242f7/2147483647/strip/true/crop/7608x4280+0+0/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2F62%2Fad%2Fecb5678043e5af9cc73a4177eb3b%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F2149612610',
      minRead: 3,
      dateTime: DateTime.utc(2024, 5, 13, 13, 23),
    ),
    News(
      title:
          'Bronny James medically cleared, will participate in NBA Draft Combine, reportedly will stay in draft',
      content: '''
Bronny James — who suffered a cardiac arrest on the court while working out at USC last summer — has been cleared to play by the NBA and will participate in the NBA Draft Combine this week in Chicago.

Bronny came back from that frightening medical problem to play in 25 games for USC, but he had to be cleared by the NBA’s Fitness to Play Panel to take part in the Combine and enter the draft, and that has happened reports Adrian Wojnarowski and Jonathan Givony of ESPN. While players at the top of the NBA Draft board limit their participation in this week’s Combine, for players headed to the second round or undrafted — like Bronny — this is a chance to show off their skills and athleticism to scouts and GMs, as well as meet with some of them. Bronny will participate in the 5-on-5 scrimmages at the Combine, ESPN reports.

Bronny is expected to keep his name in the NBA Draft, reports Shams Charania of The Athletic. How things go at the Combine will certainly impact that decision.

Multiple scouts have told NBC Sports they see Bronny as having NBA potential but needing a lot of development to fulfill it. He largely came off the bench at USC and did not play his natural point guard position much of the time. Bronny averaged 4.8 points, 2.8 rebounds, and 2.1 assists per game. Bronny, listed at USC as 6'4", is a good athlete and a high IQ player who could develop into a high-level NBA defender, but the offensive side of his game needs a lot of work — particularly his playmaking.

If Bronny keeps his name in the 2024 NBA Draft (he can return to college and enter the transfer portal) he likely will get picked up in the second round by a team hoping to tap that potential — and gain favor with his father, LeBron James, which is why the Lakers are open to picking him. Bronny likely will get a lot of games in the G-League to work on his skills and develop that potential.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/aaf41cd/2147483647/strip/true/crop/7113x4001+0+0/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2Fb6%2F21%2Fd78241ca4d7a888208944bf9415f%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F2086562145',
      minRead: 5,
      dateTime: DateTime.utc(2024, 5, 13, 12, 37),
    ),
  ];

  static final List<News> otherNews = [
    News(
      title:
          'Lakers reportedly ramping up coaching search, showing interest in J.J. Redick, Borrego, others',
      content: '''
The NBA Draft Combine in Chicago this week is when offseason talks between front offices start to get serious and, with that, it’s when rumors start flying.

For the Lakers, that means ramping up their coaching search to find a replacement for Darvin Ham, something Adrian Wojnarowski talked about at ESPN, adding that this will be a long process.

“A couple of names to watch in this search. James Borrego, the top assistant in New Orleans, they went from the [ranked] 21, 22 offense in the league last year to a top 10 offense... Borrego had a good run his head coach in Charlotte went from 23 to 33 to 43 wins. He was obviously with Gregg Popovich for a long time in San Antonio. He’ll be a candidate in this process.

“Another candidate is someone who hasn’t coached, and that’s our colleague here at ESPN, J.J. Reddick. He is certainly somebody that the Lakers are drilling down on, they’re making calls and trying to get a sense of what a head coach, head coach J.J. Reddick would look like.”

Those are far from the only names flying around. Jovan Buha of The Athletic suggested that several top assistants are being considered: Micah Nori (Minnesota), David Adelman (Denver), Sean Sweeney (Dallas), and Chris Quinn (Miami). Another name mentioned around the league is Warriors assistant and former Nets head coach Kenny Atkinson.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/9d57d2d/2147483647/strip/true/crop/4626x2602+0+0/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2Fdc%2Fa3%2F2d3880b1458a8584073b8389bea6%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F1794024798',
      minRead: 5,
      dateTime: DateTime.utc(2024, 5, 12, 13, 10),
    ),
    News(
      title:
          'Victor Wembanyama explained dark matter during his Rookie of the Year press conference',
      content: '''
Victor Wembanyama doesn’t just affect the gravity of a basketball court, he understands gravity in space — he really is an alien.

Before sitting down with the media this weekend to talk about his Rookie of the Year award, Wembanyama hung out with and spoke to some area children at a San Antonio Education Center & Planetarium. When asked what he talked to the students about, he answered, “Dark matter.” Then he proceeded to explain the concept to reporters.

“Dark matter is a mass we can’t see, but we know is there because it has influence on gravitational pulls and the speed of gravitational orbits in every galaxy. It’s presence inside galaxies is five times higher than regular matter, so it’s a huge mystery. We can’t see it. We can’t observe it, but we can observe its influence. This is dark matter.”

When LeBron James called Wembanyama an alien, he wasn’t kidding — and you have to love that Nike is leaning into it.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/73b13cb/2147483647/strip/true/crop/5568x3132+0+290/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2F9b%2F81%2F7af8ea224bd5ae4145a669df26c3%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F2151994189',
      minRead: 2,
      dateTime: DateTime.utc(2024, 5, 12, 12, 24),
    ),
    News(
      title:
          'Tatum, Brown step up to score 61, lead Celtics to comfortable Game 3 win over Cavaliers',
      content: '''
For Boston, the script against Cleveland feels a lot like the one against Miami: Win Game 1 handily, get a little complacent, run into a hot-shooting team, drop Game 2 at home, bounce back and win Game 3 on the road again looking dominant.

This time it was Jayson Tatum and Jaylen Brown stepping up when their team needed them most. Tatum finished with 33 points and 13 boards, plus challenged the team at half to step up, sparking a 14-0 run to start the third quarter that essentially put the game out of reach. Brown finished with 28 points on 13-of-17 shots and got some key buckets late.

The result was a 106-93 Boston win in Game 3 on the road, giving the Celtics a 2-1 series lead over the Cavaliers.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/0f82984/2147483647/strip/true/crop/5568x3132+0+0/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2Fa0%2F61%2Fd129e63c44439314b5dcc60b21e5%2Fhttps-delivery-gettyimages.com%2Fdownloads%2F2151991677',
      minRead: 3,
      dateTime: DateTime.utc(2024, 5, 12, 12, 32),
    ),
    News(
      title:
          'P.J. Washington, Mavericks role players step up, earn Dallas Game 3 win over Thunder',
      content: '''
The difference so far in this series: Dallas’ third-best player has been much better than Oklahoma City’s third-best player.

It’s not exactly that the Mavericks’ Luka Doncic and Kyrie Irving and the Thunders’ Shai Gilgeous-Alexander and Jalen Williams are canceling each other out. However, in Game 3 Saturday, the Dallas big two scored 44 points, and the OKC big two had 47, so they kind of did.

What won Dallas Game 3 was 27 points from P.J. Washington — Oklahoma City has left him open and dared him to shoot and he is 12-of-23 from 3 the past two games. That plus some clutch hack-a free throws from Dereck Lively II (5-of-8 on those) set up Dallas, then Irving stuck in the dagger with his left hand.
''',
      imgLink:
          'https://nbcsports.brightspotcdn.com/dims4/default/d4f0654/2147483647/strip/true/crop/3296x1854+0+0/resize/1440x810!/format/webp/quality/90/?url=https%3A%2F%2Fnbc-sports-production-nbc-sports.s3.us-east-1.amazonaws.com%2Fbrightspot%2F51%2Fa6%2F0fa5b3774f2783b8a728df311f90%2Fhttps-api-imagn.com%2Frest%2Fdownload%2FimageID%3D23248613',
      minRead: 2,
      dateTime: DateTime.utc(2024, 5, 12, 19, 32),
    ),
  ];
}
