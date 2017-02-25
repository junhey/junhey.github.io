<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['cate_models']['instituteCategory']=array (
  'id' => '3',
  'name' => 'instituteCategory',
  'description' => '院系分类',
  'perpage' => '10',
  'level' => '2',
  'hasattach' => '0',
  'built_in' => '0',
  'auto_update' => '1',
  'thumb_preferences' => NULL,
  'fields' => 
  array (
    3 => 
    array (
      'id' => '3',
      'name' => 'instituteName',
      'description' => '院系名称',
      'model' => '3',
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
    0 => '3',
  ),
  'searchable' => 
  array (
  ),
);