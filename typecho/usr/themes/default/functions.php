<?php

function themeConfig($form) {

}

/* Thumb */
	function posart_thumb_isImage ($type){
    $arr_ext = array('jpg','gif','png','bmp','jpeg');

	  for ($i = 0; $i < count($arr_ext); $i++){
			if ($type == $arr_ext[$i]){
        return true;
				break;
			}
		}

		return false;
	}

  function posart_thumb_show ($obj) {
    $cid = $obj->cid;
		$cate = $obj->category;
		$content = $obj->content;

    $db = Typecho_Db::get();
    $attach = $db->fetchAll ($db->select()->from('table.contents')->where('type = ? AND parent = ? ', 'attachment', $cid));
		if (empty ($attach)){
			preg_match_all( "/\<img.*?src\=(\'|\")(.*?)(\'|\")[^>]*>/i", $content, $matches );
			$imgCount = count ($matches[0]);
			if ($imgCount >= 1){
        return $matches[2][0];
			} else {
				$img = null;
			}
		} else {
		    foreach ($attach as $attach){
			    $attach_text = unserialize($attach['text']);
			    if (posart_thumb_isImage($attach_text['type'])) {
            return $attach_text['path'];
					break;
				}
			}
		}

		return false;
  }
