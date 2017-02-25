$(document).ready(function(){
  $(document).scroll(function(){
    if ($(window).scrollTop() > $('#header').height()) {
      $('.nav-wrap').css('background', 'rgba(255, 255, 255, .95)');
    } else {
      $('.nav-wrap').css('background', '#fff');
    }
  });
  $('a[title="站长统计"]').hide();
});
if ("console" in window) {
    var c = console;
	c.log("\n\n\n\n\n\n\n\n\n\n%c", "background:#fff url(https://avatars1.githubusercontent.com/u/8244100?v=3&s=150) no-repeat;font-size:0; line-height:30px; padding-top:150px;padding-left:150px;");
	c.log("欢迎踩点我的博客：http://www.junhey.com  \n\n 专注前端&PHP，喜欢合作和交流,很希望和你做朋友...  %c\n\nWeibo: http://weibo.com/juncoding  (@疯狂的迈步)", "color:#61b3e6");
}