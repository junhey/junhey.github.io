<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['current_role']=array (
  'id' => '3',
  'name' => '老师用户',
  'rights' => 
  array (
    0 => 'system@cache',
    1 => 'model@view',
    2 => 'model@add',
    3 => 'model@edit',
    4 => 'content@view',
    5 => 'content@form@add',
    6 => 'content@form@edit',
    7 => 'content@save@add',
  ),
  'models' => 
  array (
    0 => 'courses',
  ),
  'category_models' => 
  array (
    0 => '0',
  ),
  'plugins' => 
  array (
    0 => '0',
  ),
);