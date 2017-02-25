<?php
/**
 * User: junhey
 * Date: 17/2/15
 * Time: 下午16:31
 */
$db= new mysqli();
$db->connect('localhost','root','2015junhey','app_junhey');//连接数据库 其中需要修改用户名 密码 数据库名
$sql=<<<TEXT
select title,text,created,category,tags from typecho_contents c, 
(select cid,group_concat(m.name) tags from typecho_metas m,typecho_relationships r where m.mid=r.mid and m.type='tag' group by cid ) t1, 
(select cid,m.name category from typecho_metas m,typecho_relationships r where m.mid=r.mid and m.type='category') t2 
where t1.cid=t2.cid and c.cid=t1.cid
TEXT;
$db->query("set names 'utf8'");//设置为UTF-8
$res=$db->query($sql);//获取数据库的内容
if($res){
    if($res->num_rows>0){
        while($r=$res->fetch_object()) {
            $_c=date('Y-m-d H:i:s',$r->created);
            $_t=str_replace('<!--markdown-->','',$r->text);
            $_tmp = <<<TMP
title: $r->title			
categories: $r->category
tags: [$r->tags]
date: $_c
---

$_t

TMP;
		
            //替换不合法文件名字符  str_replace(array(" ","?","\\","/" ,":" ,"|", "*" ),'-',$r->title)
            file_put_contents(dirname(__FILE__)."/blog/".str_replace(array(" ","?","\\","/" ,":" ,"|", "*" ),'-',date('Y-m-d-H-i',$r->created)).".md",$_tmp);
        }
    }
    $res->free();
}
$db->close();
echo "恭喜您,博客转格式成功 更多请访问<a href='https://github.com/junhey/junhey.github.io/tree/typecho'>https://github.com/junhey/junhey.github.io/tree/typecho</a> ";