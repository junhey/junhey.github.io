<?php $this->need('header_nav.php'); ?>
<article class="post">
  <header class="post-head">
    <h2 class="post-title">
      <a><?php $this->title(); ?></a>
    </h2>
    <time datetime="<?php $this->date(); ?>" class="post-time"><?php $this->date('F j, Y');?></time>
  </header>
  <section class="post-content typo">
    <?php $this->content(); ?>
  </section>
  <footer class="post-footer clear">
    <section class="post-copyright">
			<a href="http://junhey.com/">疯狂的迈步</a>（<a href="https://github.com/junhey">github</a>）
			版权声明: 署名-非商业性使用-禁止演绎 3.0 国际（<a href="https://creativecommons.org/licenses/by-nc-nd/3.0/deed.zh">CC BY-NC-ND 3.0</a>）
			最后编辑时间: <?php $modified = new Typecho_Date($this->modified);echo $modified->format('Y-m-d H:i:s');?>
	</section>
	<span class="post-tags clear">
      <?php $this->category(''); ?>
      <?php $this->tags(''); ?>
    </span>	
    <span class="post-next-prev">	  
      <span class="prev"><?php $this->thePrev('%s','已经是第一篇了'); ?></span>
      <span class="next"><?php $this->theNext('%s','已经是最后一篇了'); ?></span>
    </span>
  </footer>
</article>
<script>
(function(){
    var bp = document.createElement('script');
    bp.src = '//push.zhanzhang.baidu.com/push.js';
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>
<section id="comment-list">
  <?php $this->need('comments.php'); ?>
</section>
<?php $this->need('footer.php'); ?>
