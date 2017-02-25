<!DOCTYPE HTML>
<html>
<head>
    <meta charset="<?php $this->options->charset(); ?>">	
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<meta content="junhey@qq.com" name="email">
	<meta content="疯狂的迈步,ui设计,UI,前端,html,css,网站前端,前端工具,js代码,css2,css3,html5,个人网站,博客,建站,网站建设,php" name="keywords">
	<meta content="疯狂的迈步,随笔,思考,笔记,想法..." name="description">
	<meta content="article" property="og:type">
	<meta content="疯狂的迈步 | 疯狂的迈步的个人网站" property="og:title">
	<meta content="http://www.junhey.com/index.html" property="og:url">
	<meta content="疯狂的迈步" property="og:site_name">
	<meta content="疯狂的迈步，随笔，思考，笔记，想法..." property="og:description">
	<link type="image/x-icon" href="/favicon.ico" rel="shoticon">
    <title><?php $this->archiveTitle(array(
            'category'  =>  _t('分类 %s 下的文章'),
            'search'    =>  _t('包含关键字 %s 的文章'),
            'tag'       =>  _t('标签 %s 下的文章'),
            'author'    =>  _t('%s 发布的文章')
        ), '', ' - '); $this->options->title(); ?></title>
    <link rel="stylesheet" href="<?php $this->options->themeUrl('css/style.css'); ?>"/>
    <?php $this->header(); ?>	
</head>
<body>
  <!--[if lt IE 8]>
      <div class="browsehappy" role="dialog"><?php _e('当前网页 <strong>不支持</strong> 你正在使用的浏览器. 为了正常的访问, 请 <a href="http://browsehappy.com/">升级你的浏览器</a>'); ?>.</div>
  <![endif]-->
  <header id="header" style="height: 40px;">
    <div class="nav-wrap">
      <nav id="navbar">
        <a class="main" href="<?php $this->options->siteUrl() ?>" title="<?php $this->options->title() ?>"><?php $this->options->title() ?></a>
        <?php $this->widget('Widget_Contents_Page_List')->to($pages); ?>
        <?php while($pages->next()): ?>
          <a<?php if($this->is('page', $pages->slug)): ?> class="current"<?php endif; ?> href="<?php $pages->permalink(); ?>" title="<?php $pages->title(); ?>"><?php $pages->title(); ?></a>
        <?php endwhile; ?>
        <form action="./" method="post" role="search">
          <input id="s" type="text" class="search-input" name="s" placeholder="输入关键字搜索" autocomplete="off"/>
        </form>
      </nav>
  	</div>
  </header>

	<div id="wrapper">
		<div id="container">
