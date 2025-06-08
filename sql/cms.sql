SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- Tabelas relacionadas à construção dinâmica de páginas e menus

CREATE TABLE `sys_menu_items` (
  `id` int(11) UNSIGNED NOT NULL,
  `set_name` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `title_system` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `onclick` varchar(255) NOT NULL,
  `target` varchar(16) NOT NULL,
  `icon` varchar(50) NOT NULL,
  `addon` varchar(255) NOT NULL,
  `submenu_object` varchar(255) NOT NULL,
  `submenu_popup` tinyint(4) NOT NULL DEFAULT 0,
  `visible_for_levels` int(11) UNSIGNED NOT NULL DEFAULT 2147483647,
  `visible_for_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `copyable` tinyint(4) NOT NULL DEFAULT 1,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `hidden_on` varchar(255) NOT NULL DEFAULT '',
  `order` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_menu_sets` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_menu_templates` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `attrs` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_menu` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `object` varchar(128) NOT NULL DEFAULT '',
  `set_name` varchar(128) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `template_id` int(11) NOT NULL DEFAULT 0,
  `deletable` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(128) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_page` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name_system` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `layout_id` int(11) NOT NULL DEFAULT 0,
  `deletable` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(128) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_widget` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `deletable` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(128) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_blocks` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL DEFAULT '',
  `cell_id` int(11) NOT NULL DEFAULT 0,
  `module` varchar(32) NOT NULL DEFAULT '',
  `title_system` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `designbox_id` int(11) NOT NULL DEFAULT 0,
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `type` varchar(64) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `deletable` tinyint(4) NOT NULL DEFAULT 1,
  `copyable` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_blocks_data` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL DEFAULT 0,
  `system` tinyint(4) NOT NULL DEFAULT 0,
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_content_placeholders` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_layouts` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `template` text NOT NULL,
  `cells_number` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_types` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `layout_id` int(11) NOT NULL DEFAULT 0,
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `url` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `index` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_wiki_blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL,
  `block_id` int(10) UNSIGNED NOT NULL,
  `revision` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `added` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_permalinks` (
  `id` int(11) UNSIGNED NOT NULL,
  `standard` varchar(255) NOT NULL,
  `permalink` varchar(255) NOT NULL,
  `view` varchar(255) NOT NULL,
  `module` varchar(255) NOT NULL,
  `check` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_rewrite_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `uri` varchar(255) NOT NULL,
  `replace` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_seo_links` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `object` varchar(128) NOT NULL DEFAULT '',
  `object_id` int(11) NOT NULL DEFAULT 0,
  `uri` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_seo_uri_rewrites` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `uri_from` varchar(255) NOT NULL DEFAULT '',
  `uri_to` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `index` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `header` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `cover` varchar(255) NOT NULL DEFAULT '',
  `cover_title` varchar(255) NOT NULL DEFAULT '',
  `cover_image` int(11) NOT NULL DEFAULT 0,
  `cover_position` varchar(16) NOT NULL DEFAULT 'top',
  `type_id` int(11) NOT NULL DEFAULT 0,
  `uri` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_pages_widgets` (
  `id` int(11) UNSIGNED NOT NULL,
  `page_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `widget_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_widgets` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `cover` varchar(255) NOT NULL DEFAULT '',
  `cover_title` varchar(255) NOT NULL DEFAULT '',
  `cover_image` int(11) NOT NULL DEFAULT 0,
  `cover_position` varchar(16) NOT NULL DEFAULT 'top',
  `content` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_widgets_bookmarks` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `widget_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_content_info` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `deletable` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(128) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_form` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL DEFAULT '',
  `form_attrs` text NOT NULL,
  `submit_name` varchar(32) NOT NULL DEFAULT '',
  `submit_value` varchar(64) NOT NULL DEFAULT '',
  `submit_effect` varchar(32) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `deletable` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(128) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_displays` (
  `id` int(11) NOT NULL,
  `object` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `view_mode` tinyint(4) NOT NULL DEFAULT 0,
  `display_settings` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_inputs` (
  `id` int(11) NOT NULL,
  `object` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `values` text NOT NULL,
  `checked` tinyint(4) NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `caption_system` varchar(255) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `info` text NOT NULL,
  `help` text NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `collapsed` tinyint(4) NOT NULL DEFAULT 0,
  `html` tinyint(4) NOT NULL DEFAULT 0,
  `unique` tinyint(4) NOT NULL DEFAULT 0,
  `mandatory` tinyint(4) NOT NULL DEFAULT 0,
  `attrs` text NOT NULL,
  `attrs_tr` text NOT NULL,
  `attrs_wrapper` text NOT NULL,
  `checker_func` varchar(32) NOT NULL DEFAULT '',
  `checker_params` text NOT NULL,
  `checker_error` varchar(255) NOT NULL DEFAULT '',
  `db_pass` varchar(32) NOT NULL DEFAULT '',
  `db_params` text NOT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `deletable` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_display_inputs` (
  `id` int(11) NOT NULL,
  `display_name` varchar(128) NOT NULL DEFAULT '',
  `input_name` varchar(128) NOT NULL DEFAULT '',
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_grid` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `table` varchar(128) NOT NULL DEFAULT '',
  `field_id` varchar(32) NOT NULL DEFAULT '',
  `condition` text NOT NULL,
  `selection_type` varchar(32) NOT NULL DEFAULT 'none',
  `selection_field` varchar(32) NOT NULL DEFAULT '',
  `selection_value` varchar(255) NOT NULL DEFAULT '',
  `deletable` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(128) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_grid_fields` (
  `id` int(11) NOT NULL,
  `object` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL DEFAULT '',
  `width` varchar(16) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `order_list` int(11) NOT NULL DEFAULT 0,
  `order_view` int(11) NOT NULL DEFAULT 0,
  `order_form` int(11) NOT NULL DEFAULT 0,
  `show_list` tinyint(4) NOT NULL DEFAULT 1,
  `show_view` tinyint(4) NOT NULL DEFAULT 0,
  `show_form` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_grid_actions` (
  `id` int(11) NOT NULL,
  `object` varchar(128) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `icon` varchar(64) NOT NULL DEFAULT '',
  `icon_only` tinyint(4) NOT NULL DEFAULT 0,
  `confirm` tinyint(4) NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `handler` varchar(255) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `order_list_single` int(11) NOT NULL DEFAULT 0,
  `order_list_multi` int(11) NOT NULL DEFAULT 0,
  `order_view` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_view` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `deletable` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(128) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
