<?php $this->need('header_nav.php'); ?>
<h3 class="archive-title">
	<?php $this->archiveTitle(array(
		'category'  =>  _t('分类 <mark>%s</mark> 下的文章'),
		'search'    =>  _t('包含关键字 <mark>%s</mark> 的文章'),
		'tag'       =>  _t('标签 <mark>%s</mark> 下的文章'),
		'author'    =>  _t('<mark>%s</mark> 发布的文章')
	), '', ''); ?>
</h3>
<?php if ($this->have()):
	while($this->next()): $thumb = posart_thumb_show($this); ?>
	<article class="post">
		<header class="post-head">
			<h2 class="post-title">
				<a href="<?php $this->permalink(); ?>" title="<?php $this->title(); ?>"><?php $this->title(); ?></a>
			</h2>
			<time datetime="<?php $this->date(); ?>" class="post-time"><?php $this->date('F j, Y');?></time>
		</header>
			<section class="post-entry">
				<?php $this->excerpt(300, '...'); ?>
			</section>
			<footer class="post-footer clear">
				<span class="post-tags clear">
					<?php $this->category(''); ?>
					<?php $this->tags(''); ?>
				</span>
				<a class="post-readmore" href="<?php $this->permalink(); ?>">阅读更多...</a>
			</footer>
		</article>
	<?php endwhile; ?>
	<?php $this->pageNav('&laquo; 前一页', '后一页 &raquo;'); ?>
	<?php else: ?>
		<article class="post">
			<header class="post-head">
				<h2 class="post-title">
					<a><?php _e('没有找到内容'); ?></a>
				</h2>
			</header>
		</article>
	<?php endif; ?>
<?php $this->need('footer.php'); ?>
