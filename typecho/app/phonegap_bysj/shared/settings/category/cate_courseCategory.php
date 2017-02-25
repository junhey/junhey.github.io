<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['cate_models']['courseCategory']=array (
  'id' => '1',
  'name' => 'courseCategory',
  'description' => '课程分类',
  'perpage' => '10',
  'level' => '1',
  'hasattach' => '0',
  'built_in' => '0',
  'auto_update' => '1',
  'thumb_preferences' => NULL,
  'fields' => 
  array (
    1 => 
    array (
      'id' => '1',
      'name' => 'categoryName',
      'description' => '课程分类名',
      'model' => '1',
      'type' => 'input',
      'length' => '0',
      'values' => '',
      'width' => '0',
      'height' => '0',
      'rules' => 'required',
      'ruledescription' => '',
      'searchable' => '0',
      'listable' => '1',
      'order' => '1',
      'editable' => '1',
    ),
  ),
  'listable' => 
  array (
    0 => '1',
  ),
  'searchable' => 
  array (
  ),
);