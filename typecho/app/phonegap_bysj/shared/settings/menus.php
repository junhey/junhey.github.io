<?php if ( ! defined('IN_DILICMS')) exit('No direct script access allowed');
$setting['menus']=array (
  0 => 
  array (
    'menu_id' => '1',
    'class_name' => 'system',
    'method_name' => 'home',
    'menu_name' => '系统',
    'sub_menus' => 
    array (
      0 => 
      array (
        'menu_id' => '2',
        'class_name' => 'system',
        'method_name' => 'home',
        'menu_name' => '后台首页',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '3',
            'class_name' => 'system',
            'method_name' => 'home',
            'menu_name' => '后台首页',
          ),
        ),
      ),
      1 => 
      array (
        'menu_id' => '4',
        'class_name' => 'setting',
        'method_name' => 'site',
        'menu_name' => '系统设置',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '5',
            'class_name' => 'setting',
            'method_name' => 'site',
            'menu_name' => '站点设置',
          ),
          1 => 
          array (
            'menu_id' => '6',
            'class_name' => 'setting',
            'method_name' => 'backend',
            'menu_name' => '后台设置',
          ),
          2 => 
          array (
            'menu_id' => '7',
            'class_name' => 'system',
            'method_name' => 'password',
            'menu_name' => '修改密码',
          ),
          3 => 
          array (
            'menu_id' => '8',
            'class_name' => 'system',
            'method_name' => 'cache',
            'menu_name' => '更新缓存',
          ),
        ),
      ),
      2 => 
      array (
        'menu_id' => '9',
        'class_name' => 'model',
        'method_name' => 'view',
        'menu_name' => '模型管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '10',
            'class_name' => 'model',
            'method_name' => 'view',
            'menu_name' => '内容模型管理',
          ),
          1 => 
          array (
            'menu_id' => '11',
            'class_name' => 'category',
            'method_name' => 'view',
            'menu_name' => '分类模型管理',
          ),
        ),
      ),
      3 => 
      array (
        'menu_id' => '12',
        'class_name' => 'plugin',
        'method_name' => 'view',
        'menu_name' => '扩展管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '13',
            'class_name' => 'plugin',
            'method_name' => 'view',
            'menu_name' => '插件管理',
          ),
        ),
      ),
      4 => 
      array (
        'menu_id' => '14',
        'class_name' => 'role',
        'method_name' => 'view',
        'menu_name' => '权限管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '15',
            'class_name' => 'role',
            'method_name' => 'view',
            'menu_name' => '用户组管理',
          ),
          1 => 
          array (
            'menu_id' => '16',
            'class_name' => 'user',
            'method_name' => 'view',
            'menu_name' => '用户管理',
          ),
        ),
      ),
      5 => 
      array (
        'menu_id' => '21',
        'class_name' => 'database',
        'method_name' => 'index',
        'menu_name' => '数据库管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'menu_id' => '22',
            'class_name' => 'database',
            'method_name' => 'index',
            'menu_name' => '数据库备份',
          ),
          1 => 
          array (
            'menu_id' => '23',
            'class_name' => 'database',
            'method_name' => 'recover',
            'menu_name' => '数据库还原',
          ),
          2 => 
          array (
            'menu_id' => '24',
            'class_name' => 'database',
            'method_name' => 'optimize',
            'menu_name' => '数据库优化',
          ),
        ),
      ),
    ),
  ),
  1 => 
  array (
    'menu_id' => '17',
    'class_name' => 'content',
    'method_name' => 'view',
    'menu_name' => '内容管理',
    'sub_menus' => 
    array (
      0 => 
      array (
        'menu_id' => '18',
        'class_name' => 'content',
        'method_name' => 'view',
        'menu_name' => '内容管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'courses',
            'menu_name' => '课程表',
          ),
          1 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'students',
            'menu_name' => '学生表',
          ),
          2 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'notices',
            'menu_name' => '通知表',
          ),
          3 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'evaluates',
            'menu_name' => '评价表',
          ),
          4 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'institutes',
            'menu_name' => '院系表',
          ),
          5 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'teachers',
            'menu_name' => '教师表',
          ),
          6 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'messages',
            'menu_name' => '信息表',
          ),
          7 => 
          array (
            'class_name' => 'content',
            'method_name' => 'view',
            'extra' => 'selcourse',
            'menu_name' => '选课表',
          ),
        ),
      ),
      1 => 
      array (
        'menu_id' => '19',
        'class_name' => 'category_content',
        'method_name' => 'view',
        'menu_name' => '分类管理',
        'sub_menus' => 
        array (
          0 => 
          array (
            'class_name' => 'category_content',
            'method_name' => 'view',
            'extra' => 'courseCategory',
            'menu_name' => '课程分类',
          ),
          1 => 
          array (
            'class_name' => 'category_content',
            'method_name' => 'view',
            'extra' => 'instituteCategory',
            'menu_name' => '院系分类',
          ),
          2 => 
          array (
            'class_name' => 'category_content',
            'method_name' => 'view',
            'extra' => 'teachCategory',
            'menu_name' => '教研室分类',
          ),
          3 => 
          array (
            'class_name' => 'category_content',
            'method_name' => 'view',
            'extra' => 'selStatusCategory',
            'menu_name' => '选课状态',
          ),
        ),
      ),
    ),
  ),
  2 => 
  array (
    'menu_id' => '20',
    'class_name' => 'module',
    'method_name' => 'run',
    'menu_name' => '插件',
    'sub_menus' => 
    array (
    ),
  ),
);