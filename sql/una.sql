SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `bx_persons_cmts` (
  `cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_vparent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_object_id` int(11) NOT NULL DEFAULT 0,
  `cmt_author_id` int(11) NOT NULL DEFAULT 0,
  `cmt_level` int(11) NOT NULL DEFAULT 0,
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT 0,
  `cmt_rate` int(11) NOT NULL DEFAULT 0,
  `cmt_rate_count` int(11) NOT NULL DEFAULT 0,
  `cmt_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `cmt_replies` int(11) NOT NULL DEFAULT 0,
  `cmt_pinned` int(11) NOT NULL DEFAULT 0,
  `cmt_cf` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_cmts_notes` (
  `cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_vparent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_object_id` int(11) NOT NULL DEFAULT 0,
  `cmt_author_id` int(11) NOT NULL DEFAULT 0,
  `cmt_level` int(11) NOT NULL DEFAULT 0,
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT 0,
  `cmt_rate` int(11) NOT NULL DEFAULT 0,
  `cmt_rate_count` int(11) NOT NULL DEFAULT 0,
  `cmt_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `cmt_replies` int(11) NOT NULL DEFAULT 0,
  `cmt_pinned` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `author` int(10) UNSIGNED NOT NULL,
  `added` int(11) NOT NULL,
  `changed` int(11) NOT NULL,
  `picture` int(11) NOT NULL,
  `cover` int(11) NOT NULL,
  `cover_data` varchar(50) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `labels` text NOT NULL,
  `location` text NOT NULL,
  `views` int(11) NOT NULL DEFAULT 0,
  `rate` float NOT NULL DEFAULT 0,
  `votes` int(11) NOT NULL DEFAULT 0,
  `rrate` float NOT NULL DEFAULT 0,
  `rvotes` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `sc_up` int(11) NOT NULL DEFAULT 0,
  `sc_down` int(11) NOT NULL DEFAULT 0,
  `favorites` int(11) NOT NULL DEFAULT 0,
  `comments` int(11) NOT NULL DEFAULT 0,
  `reports` int(11) NOT NULL DEFAULT 0,
  `featured` int(11) NOT NULL DEFAULT 0,
  `allow_view_to` varchar(16) NOT NULL DEFAULT '3',
  `allow_post_to` varchar(16) NOT NULL DEFAULT '5',
  `allow_contact_to` varchar(16) NOT NULL DEFAULT '3',
  `settings` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_favorites_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_meta_keywords` (
  `id` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_meta_locations` (
  `object_id` int(10) UNSIGNED NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `country` varchar(2) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `street_number` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_meta_mentions` (
  `id` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_pictures` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `dimensions` varchar(12) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_pictures_resized` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_reactions` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `reaction` varchar(32) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT 0,
  `sum` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_reactions_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `reaction` varchar(32) NOT NULL DEFAULT '',
  `value` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_reports` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_reports_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `text` text NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0,
  `checked_by` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_scores` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `count_up` int(11) NOT NULL DEFAULT 0,
  `count_down` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_scores_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(8) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(500) DEFAULT NULL,
  `content_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_views_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `viewer_id` int(11) NOT NULL DEFAULT 0,
  `viewer_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_votes` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `sum` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `bx_persons_votes_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `value` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `picture` int(11) NOT NULL DEFAULT 0,
  `email` varchar(255) NOT NULL,
  `email_confirmed` tinyint(4) NOT NULL DEFAULT 0,
  `phone` varchar(255) NOT NULL,
  `phone_confirmed` tinyint(4) NOT NULL DEFAULT 0,
  `receive_updates` tinyint(4) NOT NULL DEFAULT 1,
  `receive_news` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(40) NOT NULL,
  `password_changed` int(11) NOT NULL DEFAULT 0,
  `salt` varchar(10) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 1,
  `lang_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `added` int(11) NOT NULL DEFAULT 0,
  `changed` int(11) NOT NULL DEFAULT 0,
  `logged` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(40) NOT NULL DEFAULT '',
  `referred` varchar(255) NOT NULL DEFAULT '',
  `login_attempts` tinyint(4) NOT NULL DEFAULT 0,
  `locked` tinyint(4) NOT NULL DEFAULT 0,
  `active` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_accounts_password` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) NOT NULL,
  `password` varchar(40) NOT NULL,
  `password_changed` int(11) NOT NULL DEFAULT 0,
  `salt` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_accounts_pictures` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `dimensions` varchar(12) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_accounts_pictures_resized` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_acl_actions` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Module` varchar(32) NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT '',
  `AdditionalParamName` varchar(80) DEFAULT NULL,
  `Title` varchar(255) NOT NULL,
  `Desc` varchar(255) NOT NULL,
  `Countable` tinyint(4) NOT NULL DEFAULT 0,
  `DisabledForLevels` int(10) UNSIGNED NOT NULL DEFAULT 3
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_acl_actions_track` (
  `IDAction` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `IDMember` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ActionsLeft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ValidSince` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_acl_levels` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL DEFAULT '',
  `Icon` text NOT NULL DEFAULT '',
  `Description` varchar(255) NOT NULL DEFAULT '',
  `Active` enum('yes','no') NOT NULL DEFAULT 'no',
  `Purchasable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `Removable` enum('yes','no') NOT NULL DEFAULT 'yes',
  `QuotaSize` bigint(20) NOT NULL,
  `QuotaNumber` int(11) NOT NULL,
  `QuotaMaxFileSize` bigint(20) NOT NULL,
  `Order` int(11) NOT NULL DEFAULT 0,
  `PasswordExpired` int(11) NOT NULL DEFAULT 0,
  `PasswordExpiredNotify` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_acl_levels_members` (
  `IDMember` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `IDLevel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `DateStarts` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DateExpires` datetime DEFAULT NULL,
  `State` varchar(16) NOT NULL DEFAULT '',
  `TransactionID` varchar(16) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_acl_matrix` (
  `IDLevel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `IDAction` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `AllowedCount` int(10) UNSIGNED DEFAULT NULL,
  `AllowedPeriodLen` int(10) UNSIGNED DEFAULT NULL,
  `AllowedPeriodStart` datetime DEFAULT NULL,
  `AllowedPeriodEnd` datetime DEFAULT NULL,
  `AdditionalParamValue` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_assistants` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `model_id` int(11) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `prompt` text NOT NULL,
  `ai_vs_id` varchar(64) NOT NULL DEFAULT '',
  `ai_asst_id` varchar(64) NOT NULL DEFAULT '',
  `added` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `hidden` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_assistants_chats` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT 1,
  `assistant_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `message_id` int(11) NOT NULL DEFAULT 0,
  `messages` int(11) NOT NULL DEFAULT 0,
  `added` int(11) NOT NULL DEFAULT 0,
  `ai_thread_id` varchar(64) NOT NULL DEFAULT '',
  `ai_file_id` varchar(64) NOT NULL DEFAULT '',
  `stored` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_assistants_chats_files` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `dimensions` varchar(24) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_assistants_chats_messages` (
  `cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_vparent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_object_id` int(11) NOT NULL DEFAULT 0,
  `cmt_author_id` int(11) NOT NULL DEFAULT 0,
  `cmt_level` int(11) NOT NULL DEFAULT 0,
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT 0,
  `cmt_rate` int(11) NOT NULL DEFAULT 0,
  `cmt_rate_count` int(11) NOT NULL DEFAULT 0,
  `cmt_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `cmt_replies` int(11) NOT NULL DEFAULT 0,
  `cmt_pinned` int(11) NOT NULL DEFAULT 0,
  `cmt_cf` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_assistants_files` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `assistant_id` int(11) NOT NULL DEFAULT 0,
  `added` int(11) NOT NULL DEFAULT 0,
  `ai_file_id` varchar(64) NOT NULL DEFAULT '',
  `ai_file_size` int(11) NOT NULL DEFAULT 0,
  `ai_file_status` varchar(64) NOT NULL DEFAULT 'in_progress',
  `locked` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_automators` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `model_id` int(11) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `type` enum('event','scheduler','webhook') NOT NULL DEFAULT 'event',
  `params` text NOT NULL,
  `alert_unit` varchar(128) NOT NULL DEFAULT '',
  `alert_action` varchar(128) NOT NULL DEFAULT '',
  `message_id` int(11) NOT NULL DEFAULT 0,
  `code` text NOT NULL,
  `added` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `messages` int(11) NOT NULL DEFAULT 0,
  `status` enum('auto','manual','ready') NOT NULL DEFAULT 'auto',
  `active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_automators_assistants` (
  `id` int(11) NOT NULL,
  `automator_id` int(11) NOT NULL DEFAULT 0,
  `assistant_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_automators_helpers` (
  `id` int(11) NOT NULL,
  `automator_id` int(11) NOT NULL DEFAULT 0,
  `helper_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_automators_messages` (
  `cmt_id` int(11) NOT NULL,
  `cmt_parent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_vparent_id` int(11) NOT NULL DEFAULT 0,
  `cmt_object_id` int(11) NOT NULL DEFAULT 0,
  `cmt_author_id` int(11) NOT NULL DEFAULT 0,
  `cmt_level` int(11) NOT NULL DEFAULT 0,
  `cmt_text` text NOT NULL,
  `cmt_mood` tinyint(4) NOT NULL DEFAULT 0,
  `cmt_rate` int(11) NOT NULL DEFAULT 0,
  `cmt_rate_count` int(11) NOT NULL DEFAULT 0,
  `cmt_time` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `cmt_replies` int(11) NOT NULL DEFAULT 0,
  `cmt_pinned` int(11) NOT NULL DEFAULT 0,
  `cmt_cf` int(11) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_automators_providers` (
  `id` int(11) NOT NULL,
  `automator_id` int(11) NOT NULL DEFAULT 0,
  `provider_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_helpers` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `model_id` int(11) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `description` text NOT NULL,
  `prompt` text DEFAULT NULL,
  `added` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_models` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `key` varchar(64) NOT NULL DEFAULT '',
  `params` text NOT NULL,
  `for_asst` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `hidden` tinyint(4) NOT NULL DEFAULT 0,
  `class_name` varchar(128) NOT NULL DEFAULT '',
  `class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_providers` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL DEFAULT 0,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `added` int(11) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_providers_values` (
  `id` int(11) NOT NULL,
  `provider_id` int(11) NOT NULL DEFAULT 0,
  `option_id` int(11) NOT NULL DEFAULT 0,
  `value` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_provider_options` (
  `id` int(11) NOT NULL,
  `provider_type_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `type` varchar(64) NOT NULL DEFAULT 'text',
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` text NOT NULL DEFAULT '',
  `extra` varchar(255) NOT NULL DEFAULT '',
  `check_type` varchar(64) NOT NULL DEFAULT '',
  `check_params` varchar(128) NOT NULL DEFAULT '',
  `check_error` varchar(128) NOT NULL DEFAULT '',
  `order` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_agents_provider_types` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(128) NOT NULL DEFAULT '',
  `option_prefix` varchar(32) NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `order` tinyint(4) NOT NULL DEFAULT 0,
  `class_name` varchar(128) NOT NULL DEFAULT '',
  `class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_alerts` (
  `id` int(11) UNSIGNED NOT NULL,
  `unit` varchar(128) NOT NULL DEFAULT '',
  `action` varchar(32) NOT NULL DEFAULT 'none',
  `handler_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_alerts_cache_triggers` (
  `id` int(11) UNSIGNED NOT NULL,
  `unit` varchar(128) NOT NULL DEFAULT '',
  `action` varchar(32) NOT NULL DEFAULT '',
  `cache_key` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_alerts_handlers` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `class` varchar(128) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `service_call` text NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_api_keys` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `key` varchar(48) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_api_origins` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_audit` (
  `id` int(11) UNSIGNED NOT NULL,
  `added` int(11) NOT NULL,
  `profile_id` int(10) NOT NULL,
  `profile_title` varchar(255) NOT NULL,
  `content_id` int(10) NOT NULL,
  `content_title` varchar(255) NOT NULL,
  `content_module` varchar(32) NOT NULL DEFAULT '',
  `content_info_object` varchar(32) NOT NULL DEFAULT '',
  `context_profile_id` int(10) NOT NULL,
  `context_profile_title` varchar(255) NOT NULL,
  `action_lang_key` varchar(255) NOT NULL,
  `action_lang_key_params` text NOT NULL,
  `extras` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_background_jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `added` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `priority` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `service_call` text NOT NULL DEFAULT '',
  `status` varchar(16) NOT NULL DEFAULT 'awaiting'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_badges` (
  `id` int(11) UNSIGNED NOT NULL,
  `added` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `text` varchar(255) NOT NULL DEFAULT '',
  `icon` text NOT NULL DEFAULT '',
  `color` varchar(32) NOT NULL DEFAULT '',
  `fontcolor` varchar(32) NOT NULL DEFAULT '',
  `is_icon_only` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_badges2objects` (
  `id` int(11) UNSIGNED NOT NULL,
  `badge_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `added` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_categories` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL,
  `added` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `value` varchar(100) NOT NULL,
  `status` enum('active','hidden') NOT NULL DEFAULT 'active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_categories2objects` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `object_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_ids` (
  `id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL DEFAULT 0,
  `cmt_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `rate` float NOT NULL DEFAULT 0,
  `votes` int(11) NOT NULL DEFAULT 0,
  `rrate` float NOT NULL DEFAULT 0,
  `rvotes` int(11) NOT NULL DEFAULT 0,
  `score` int(11) NOT NULL DEFAULT 0,
  `sc_up` int(11) NOT NULL DEFAULT 0,
  `sc_down` int(11) NOT NULL DEFAULT 0,
  `reports` int(11) NOT NULL DEFAULT 0,
  `status_admin` enum('active','hidden','pending') NOT NULL DEFAULT 'active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_images` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `dimensions` varchar(24) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_images2entries` (
  `id` int(11) NOT NULL,
  `system_id` int(11) NOT NULL DEFAULT 0,
  `cmt_id` int(11) NOT NULL DEFAULT 0,
  `image_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_images_preview` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_meta_keywords` (
  `id` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `keyword` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_meta_mentions` (
  `id` int(11) NOT NULL,
  `object_id` int(10) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_reactions` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `reaction` varchar(32) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT 0,
  `sum` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_reactions_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `reaction` varchar(32) NOT NULL DEFAULT '',
  `value` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_reports` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_reports_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL DEFAULT '',
  `text` text NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0,
  `checked_by` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_scores` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `count_up` int(11) NOT NULL DEFAULT 0,
  `count_down` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_scores_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(8) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_votes` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `sum` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cmts_votes_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `value` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_content_info_grids` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `grid_object` varchar(64) NOT NULL,
  `grid_field_id` varchar(64) NOT NULL,
  `condition` text NOT NULL DEFAULT '',
  `selection` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_cron_jobs` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `time` varchar(128) NOT NULL DEFAULT '*',
  `class` varchar(128) NOT NULL DEFAULT '',
  `file` varchar(255) NOT NULL DEFAULT '',
  `service_call` text NOT NULL DEFAULT '',
  `ts` int(11) NOT NULL,
  `timing` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_email_templates` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Module` varchar(32) NOT NULL,
  `NameSystem` varchar(255) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Subject` varchar(255) NOT NULL,
  `Body` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_embeded_data` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `added` int(11) DEFAULT NULL,
  `theme` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_files` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_displays` (
  `id` int(11) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `view_mode` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_display_inputs` (
  `id` int(11) NOT NULL,
  `display_name` varchar(64) NOT NULL,
  `input_name` varchar(32) NOT NULL,
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_fields_ids` (
  `id` int(11) NOT NULL,
  `object_form` varchar(64) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL,
  `field_name` varchar(255) NOT NULL DEFAULT '',
  `content_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(10) NOT NULL DEFAULT 0,
  `nested_content_id` int(10) NOT NULL DEFAULT 0,
  `rate` float NOT NULL DEFAULT 0,
  `votes` int(11) NOT NULL DEFAULT 0,
  `rrate` float NOT NULL DEFAULT 0,
  `rvotes` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_fields_reaction` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `reaction` varchar(32) NOT NULL DEFAULT '',
  `count` int(11) NOT NULL DEFAULT 0,
  `sum` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_fields_reaction_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `reaction` varchar(32) NOT NULL DEFAULT '',
  `value` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_fields_votes` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `sum` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_fields_votes_track` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `author_id` int(11) NOT NULL DEFAULT 0,
  `author_nip` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `value` tinyint(4) NOT NULL DEFAULT 0,
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_inputs` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `values` text NOT NULL,
  `checked` tinyint(4) NOT NULL DEFAULT 0,
  `type` varchar(32) NOT NULL,
  `caption_system` varchar(255) NOT NULL,
  `caption` varchar(255) NOT NULL,
  `info` varchar(255) NOT NULL,
  `help` varchar(255) NOT NULL,
  `icon` text NOT NULL,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `unique` tinyint(4) NOT NULL DEFAULT 0,
  `collapsed` tinyint(4) NOT NULL DEFAULT 0,
  `html` tinyint(4) NOT NULL DEFAULT 0,
  `privacy` tinyint(4) NOT NULL DEFAULT 0,
  `rateable` varchar(32) NOT NULL DEFAULT '',
  `attrs` text NOT NULL,
  `attrs_tr` text NOT NULL,
  `attrs_wrapper` text NOT NULL,
  `checker_func` varchar(32) NOT NULL,
  `checker_params` text NOT NULL,
  `checker_error` varchar(255) NOT NULL,
  `db_pass` varchar(32) NOT NULL,
  `db_params` text NOT NULL,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `deletable` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_inputs_privacy` (
  `id` int(11) NOT NULL,
  `input_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `author_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `allow_view_to` varchar(16) NOT NULL DEFAULT '3'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_pre_lists` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `key` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `use_for_sets` tinyint(4) UNSIGNED NOT NULL DEFAULT 1,
  `extendable` tinyint(4) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_form_pre_values` (
  `id` int(11) NOT NULL,
  `Key` varchar(255) NOT NULL DEFAULT '',
  `Value` varchar(255) NOT NULL DEFAULT '',
  `Order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `LKey` varchar(255) NOT NULL DEFAULT '',
  `LKey2` varchar(255) NOT NULL DEFAULT '',
  `Data` text NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_grid_actions` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `type` enum('bulk','single','independent') NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `icon` text NOT NULL,
  `icon_only` tinyint(4) NOT NULL DEFAULT 0,
  `confirm` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_grid_fields` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `width` varchar(16) NOT NULL,
  `translatable` tinyint(4) NOT NULL DEFAULT 0,
  `chars_limit` int(11) NOT NULL DEFAULT 0,
  `params` text NOT NULL,
  `hidden_on` varchar(255) NOT NULL DEFAULT '',
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_iframely_data` (
  `id` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `added` int(11) DEFAULT NULL,
  `theme` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_images` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_images_custom` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_images_editor` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_images_editor_resized` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_images_resized` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_injections` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `page_index` int(11) NOT NULL DEFAULT 0,
  `key` varchar(128) NOT NULL DEFAULT '',
  `type` enum('text','service') NOT NULL DEFAULT 'text',
  `data` text NOT NULL DEFAULT '',
  `replace` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_injections_admin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL DEFAULT '',
  `page_index` int(11) NOT NULL DEFAULT 0,
  `key` varchar(128) NOT NULL DEFAULT '',
  `type` enum('text','service') NOT NULL DEFAULT 'text',
  `data` text NOT NULL,
  `replace` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_keys` (
  `key` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` int(11) NOT NULL,
  `salt` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_labels` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `parent` int(11) NOT NULL DEFAULT 0,
  `level` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `value` varchar(128) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_localization_categories` (
  `ID` int(6) UNSIGNED NOT NULL,
  `Name` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_localization_keys` (
  `ID` int(10) UNSIGNED NOT NULL,
  `IDCategory` int(6) UNSIGNED NOT NULL DEFAULT 0,
  `Key` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_localization_languages` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(5) NOT NULL DEFAULT '',
  `Flag` varchar(2) NOT NULL DEFAULT '',
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Direction` enum('LTR','RTL') NOT NULL DEFAULT 'LTR',
  `LanguageCountry` varchar(8) NOT NULL,
  `Enabled` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_localization_strings` (
  `IDKey` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `IDLanguage` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `String` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_menu_items` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `set_name` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `title_system` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `title_attr` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(512) NOT NULL,
  `onclick` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL,
  `area_label` varchar(255) NOT NULL DEFAULT '',
  `icon` text NOT NULL,
  `icon_only` tinyint(4) NOT NULL DEFAULT 0,
  `addon` text NOT NULL,
  `addon_cache` tinyint(4) NOT NULL DEFAULT 0,
  `markers` text NOT NULL,
  `submenu_object` varchar(64) NOT NULL,
  `submenu_popup` tinyint(4) NOT NULL DEFAULT 0,
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `visibility_custom` text NOT NULL,
  `hidden_on` varchar(255) NOT NULL DEFAULT '',
  `hidden_on_cxt` varchar(255) NOT NULL DEFAULT '',
  `hidden_on_pt` int(11) NOT NULL DEFAULT 0,
  `hidden_on_col` int(11) NOT NULL DEFAULT 0,
  `config_api` text NOT NULL,
  `primary` tinyint(4) NOT NULL DEFAULT 0,
  `collapsed` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `active_api` tinyint(4) NOT NULL DEFAULT 0,
  `copyable` tinyint(4) NOT NULL DEFAULT 1,
  `editable` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_menu_sets` (
  `set_name` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `deletable` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_menu_templates` (
  `id` int(11) NOT NULL,
  `template` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_modules` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(16) NOT NULL DEFAULT 'module',
  `subtypes` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `vendor` varchar(64) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `help_url` varchar(128) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `uri` varchar(32) NOT NULL DEFAULT '',
  `class_prefix` varchar(32) NOT NULL DEFAULT '',
  `db_prefix` varchar(32) NOT NULL DEFAULT '',
  `lang_category` varchar(64) NOT NULL DEFAULT '',
  `dependencies` varchar(255) NOT NULL DEFAULT '',
  `date` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `pending_uninstall` tinyint(4) NOT NULL,
  `hash` varchar(32) NOT NULL DEFAULT '',
  `updated` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_modules_file_tracks` (
  `id` int(11) UNSIGNED NOT NULL,
  `module_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `file` varchar(255) NOT NULL DEFAULT '',
  `hash` varchar(64) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_modules_relations` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `on_install` varchar(255) NOT NULL DEFAULT '',
  `on_uninstall` varchar(255) NOT NULL DEFAULT '',
  `on_enable` varchar(255) NOT NULL DEFAULT '',
  `on_disable` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_auths` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Link` varchar(255) NOT NULL,
  `OnClick` varchar(255) NOT NULL,
  `Icon` varchar(64) NOT NULL,
  `Style` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_captcha` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_category` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `search_object` varchar(64) NOT NULL,
  `form_object` varchar(64) NOT NULL,
  `list_name` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `field` varchar(255) NOT NULL,
  `join` varchar(255) NOT NULL,
  `where` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_chart` (
  `id` int(11) NOT NULL,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `field_date_ts` varchar(255) NOT NULL,
  `field_date_dt` varchar(255) NOT NULL,
  `field_status` varchar(255) NOT NULL,
  `column_date` int(11) NOT NULL DEFAULT 0,
  `column_count` int(11) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL,
  `options` text NOT NULL,
  `query` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_cmts` (
  `ID` int(10) UNSIGNED NOT NULL,
  `Name` varchar(64) NOT NULL,
  `Module` varchar(32) NOT NULL,
  `Table` varchar(50) NOT NULL,
  `CharsPostMin` int(10) NOT NULL,
  `CharsPostMax` int(10) NOT NULL,
  `CharsDisplayMax` int(10) NOT NULL,
  `Html` smallint(1) NOT NULL,
  `PerView` smallint(6) NOT NULL,
  `PerViewReplies` smallint(6) NOT NULL,
  `BrowseType` varchar(50) NOT NULL,
  `IsBrowseSwitch` smallint(1) NOT NULL,
  `PostFormPosition` varchar(50) NOT NULL,
  `NumberOfLevels` smallint(6) NOT NULL,
  `IsDisplaySwitch` smallint(1) NOT NULL,
  `IsRatable` smallint(1) NOT NULL,
  `ViewingThreshold` smallint(6) NOT NULL,
  `IsOn` smallint(1) NOT NULL,
  `RootStylePrefix` varchar(16) NOT NULL DEFAULT 'cmt',
  `BaseUrl` varchar(256) NOT NULL,
  `ObjectVote` varchar(64) NOT NULL DEFAULT '',
  `ObjectReaction` varchar(64) NOT NULL DEFAULT '',
  `ObjectScore` varchar(64) NOT NULL DEFAULT '',
  `ObjectReport` varchar(64) NOT NULL DEFAULT '',
  `TriggerTable` varchar(32) NOT NULL,
  `TriggerFieldId` varchar(32) NOT NULL,
  `TriggerFieldAuthor` varchar(32) NOT NULL,
  `TriggerFieldTitle` varchar(32) NOT NULL,
  `TriggerFieldComments` varchar(32) NOT NULL,
  `ClassName` varchar(32) NOT NULL,
  `ClassFile` varchar(256) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_connection` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `table` varchar(255) NOT NULL,
  `profile_initiator` tinyint(4) NOT NULL DEFAULT 1,
  `profile_content` tinyint(4) NOT NULL DEFAULT 0,
  `type` enum('one-way','mutual') NOT NULL,
  `tt_initiator` varchar(32) NOT NULL DEFAULT '',
  `tf_id_initiator` varchar(32) NOT NULL DEFAULT '',
  `tf_count_initiator` varchar(32) NOT NULL DEFAULT '',
  `tt_content` varchar(32) NOT NULL DEFAULT '',
  `tf_id_content` varchar(32) NOT NULL DEFAULT '',
  `tf_count_content` varchar(32) NOT NULL DEFAULT '',
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_content_info` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL,
  `alert_unit` varchar(32) NOT NULL,
  `alert_action_add` varchar(32) NOT NULL,
  `alert_action_update` varchar(32) NOT NULL,
  `alert_action_delete` varchar(32) NOT NULL,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_editor` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `skin` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_embeds` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_favorite` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `table_track` varchar(32) NOT NULL,
  `table_lists` varchar(32) NOT NULL,
  `pruning` int(11) NOT NULL DEFAULT 31536000,
  `is_on` tinyint(4) NOT NULL DEFAULT 1,
  `is_undo` tinyint(4) NOT NULL DEFAULT 1,
  `is_public` tinyint(4) NOT NULL DEFAULT 1,
  `base_url` varchar(256) NOT NULL DEFAULT '',
  `trigger_table` varchar(32) NOT NULL,
  `trigger_field_id` varchar(32) NOT NULL,
  `trigger_field_author` varchar(32) NOT NULL,
  `trigger_field_count` varchar(32) NOT NULL,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_feature` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `is_on` tinyint(4) NOT NULL DEFAULT 1,
  `is_undo` tinyint(4) NOT NULL DEFAULT 1,
  `base_url` varchar(256) NOT NULL DEFAULT '',
  `trigger_table` varchar(32) NOT NULL,
  `trigger_field_id` varchar(32) NOT NULL,
  `trigger_field_author` varchar(32) NOT NULL,
  `trigger_field_flag` varchar(32) NOT NULL,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_file_handlers` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `preg_ext` text NOT NULL,
  `active` tinyint(4) NOT NULL,
  `order` int(11) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_form` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `form_attrs` text NOT NULL,
  `submit_name` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `uri_title` varchar(255) NOT NULL,
  `params` text NOT NULL,
  `deletable` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `parent_form` varchar(64) NOT NULL DEFAULT '',
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_grid` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `source_type` enum('Array','Sql') NOT NULL,
  `source` text NOT NULL,
  `table` varchar(255) NOT NULL,
  `field_id` varchar(255) NOT NULL,
  `field_order` varchar(255) NOT NULL,
  `field_active` varchar(255) NOT NULL,
  `order_get_field` varchar(255) NOT NULL DEFAULT 'order_field',
  `order_get_dir` varchar(255) NOT NULL DEFAULT 'order_dir',
  `paginate_url` varchar(255) NOT NULL,
  `paginate_per_page` int(11) NOT NULL DEFAULT 10,
  `paginate_simple` varchar(255) DEFAULT NULL,
  `paginate_get_start` varchar(255) NOT NULL,
  `paginate_get_per_page` varchar(255) NOT NULL,
  `filter_fields` text NOT NULL,
  `filter_fields_translatable` text NOT NULL,
  `filter_mode` enum('like','fulltext','auto') NOT NULL DEFAULT 'auto',
  `filter_get` varchar(255) NOT NULL DEFAULT 'filter',
  `sorting_fields` text NOT NULL,
  `sorting_fields_translatable` text NOT NULL,
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `responsive` tinyint(4) NOT NULL DEFAULT 1,
  `show_total_count` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_live_updates` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `init` tinyint(4) NOT NULL DEFAULT 0,
  `frequency` tinyint(4) NOT NULL DEFAULT 1,
  `service_call` text NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_location_field` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_location_map` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_logs` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `logs_storage` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `class_name` varchar(255) NOT NULL,
  `class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_menu` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `set_name` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `template_id` int(11) NOT NULL,
  `config_api` text NOT NULL,
  `persistent` tinyint(4) NOT NULL DEFAULT 0,
  `deletable` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_metatags` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL,
  `table_keywords` varchar(255) NOT NULL,
  `table_locations` varchar(255) NOT NULL,
  `table_mentions` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_page` (
  `id` int(11) NOT NULL,
  `author` int(11) NOT NULL DEFAULT 0,
  `added` int(11) NOT NULL DEFAULT 0,
  `object` varchar(64) NOT NULL,
  `uri` varchar(255) NOT NULL,
  `title_system` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `module` varchar(32) NOT NULL,
  `cover` tinyint(4) NOT NULL DEFAULT 1,
  `cover_image` int(11) NOT NULL DEFAULT 0,
  `cover_title` varchar(255) NOT NULL DEFAULT '',
  `type_id` int(11) NOT NULL DEFAULT 1,
  `layout_id` int(11) NOT NULL,
  `sticky_columns` tinyint(4) NOT NULL DEFAULT 0,
  `submenu` varchar(64) NOT NULL DEFAULT '',
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `visible_for_levels_editable` tinyint(4) NOT NULL DEFAULT 1,
  `url` varchar(255) NOT NULL,
  `content_info` varchar(64) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keywords` text NOT NULL,
  `meta_robots` varchar(255) NOT NULL,
  `cache_lifetime` int(11) NOT NULL DEFAULT 0,
  `cache_editable` tinyint(4) NOT NULL DEFAULT 1,
  `inj_head` text NOT NULL,
  `inj_footer` text NOT NULL,
  `config_api` text NOT NULL,
  `deletable` tinyint(1) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_payments` (
  `id` int(11) NOT NULL,
  `object` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `uri` varchar(32) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_player` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `skin` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_privacy` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL DEFAULT '',
  `module` varchar(64) NOT NULL DEFAULT '',
  `action` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `default_group` varchar(255) NOT NULL DEFAULT '1',
  `spaces` varchar(255) NOT NULL DEFAULT 'all',
  `table` varchar(255) NOT NULL DEFAULT '',
  `table_field_id` varchar(255) NOT NULL DEFAULT '',
  `table_field_author` varchar(255) NOT NULL DEFAULT '',
  `override_class_name` varchar(255) NOT NULL DEFAULT '',
  `override_class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_push` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_recommendation` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `module` varchar(64) NOT NULL DEFAULT '',
  `connection` varchar(64) NOT NULL DEFAULT '',
  `content_info` varchar(64) NOT NULL DEFAULT '',
  `countable` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_report` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `table_main` varchar(32) NOT NULL,
  `table_track` varchar(32) NOT NULL,
  `pruning` int(11) NOT NULL DEFAULT 31536000,
  `is_on` tinyint(4) NOT NULL DEFAULT 1,
  `base_url` varchar(256) NOT NULL DEFAULT '',
  `object_comment` varchar(64) NOT NULL,
  `trigger_table` varchar(32) NOT NULL,
  `trigger_field_id` varchar(32) NOT NULL,
  `trigger_field_author` varchar(32) NOT NULL,
  `trigger_field_count` varchar(32) NOT NULL,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_rss` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_score` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL,
  `table_main` varchar(50) NOT NULL DEFAULT '',
  `table_track` varchar(50) NOT NULL DEFAULT '',
  `post_timeout` int(11) NOT NULL DEFAULT 0,
  `pruning` int(11) NOT NULL DEFAULT 31536000,
  `is_undo` tinyint(1) NOT NULL DEFAULT 0,
  `is_on` tinyint(1) NOT NULL DEFAULT 1,
  `trigger_table` varchar(32) NOT NULL DEFAULT '',
  `trigger_field_id` varchar(32) NOT NULL DEFAULT '',
  `trigger_field_author` varchar(32) NOT NULL DEFAULT '',
  `trigger_field_score` varchar(32) NOT NULL DEFAULT '',
  `trigger_field_cup` varchar(32) NOT NULL DEFAULT '',
  `trigger_field_cdown` varchar(32) NOT NULL DEFAULT '',
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_search` (
  `ID` int(10) UNSIGNED NOT NULL,
  `ObjectName` varchar(64) NOT NULL DEFAULT '',
  `Title` varchar(50) NOT NULL DEFAULT '',
  `Order` int(11) NOT NULL,
  `GlobalSearch` tinyint(4) NOT NULL DEFAULT 1,
  `ClassName` varchar(50) NOT NULL DEFAULT '',
  `ClassPath` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_search_extended` (
  `id` int(10) UNSIGNED NOT NULL,
  `object` varchar(64) NOT NULL DEFAULT '',
  `object_content_info` varchar(64) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `filter` tinyint(4) NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_sms` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `title` varchar(255) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_storage` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `engine` varchar(32) NOT NULL,
  `params` text NOT NULL,
  `token_life` int(11) NOT NULL,
  `cache_control` int(11) NOT NULL,
  `levels` tinyint(4) NOT NULL,
  `table_files` varchar(64) NOT NULL,
  `ext_mode` enum('allow-deny','deny-allow') NOT NULL,
  `ext_allow` text NOT NULL,
  `ext_deny` text NOT NULL,
  `quota_size` int(11) NOT NULL,
  `current_size` int(11) NOT NULL,
  `quota_number` int(11) NOT NULL,
  `current_number` int(11) NOT NULL,
  `max_file_size` int(11) NOT NULL,
  `ts` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_transcoder` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `storage_object` varchar(64) NOT NULL,
  `source_type` enum('Folder','Storage','Proxy') NOT NULL,
  `source_params` text NOT NULL,
  `private` enum('auto','yes','no') NOT NULL,
  `atime_tracking` int(11) NOT NULL,
  `atime_pruning` int(11) NOT NULL,
  `ts` int(11) NOT NULL DEFAULT 0,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_uploader` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_view` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `table_track` varchar(32) NOT NULL,
  `period` int(11) NOT NULL DEFAULT 86400,
  `pruning` int(11) NOT NULL DEFAULT 31536000,
  `is_on` tinyint(4) NOT NULL DEFAULT 1,
  `trigger_table` varchar(32) NOT NULL,
  `trigger_field_id` varchar(32) NOT NULL,
  `trigger_field_author` varchar(32) NOT NULL,
  `trigger_field_count` varchar(32) NOT NULL,
  `class_name` varchar(32) NOT NULL DEFAULT '',
  `class_file` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_vote` (
  `ID` int(11) UNSIGNED NOT NULL,
  `Name` varchar(50) NOT NULL DEFAULT '',
  `Module` varchar(32) NOT NULL DEFAULT '',
  `TableMain` varchar(50) NOT NULL DEFAULT '',
  `TableTrack` varchar(50) NOT NULL DEFAULT '',
  `PostTimeout` int(11) NOT NULL DEFAULT 0,
  `MinValue` tinyint(4) NOT NULL DEFAULT 1,
  `MaxValue` tinyint(4) NOT NULL DEFAULT 5,
  `Pruning` int(11) NOT NULL DEFAULT 31536000,
  `IsUndo` tinyint(1) NOT NULL DEFAULT 0,
  `IsOn` tinyint(1) NOT NULL DEFAULT 1,
  `TriggerTable` varchar(32) NOT NULL DEFAULT '',
  `TriggerFieldId` varchar(32) NOT NULL DEFAULT '',
  `TriggerFieldAuthor` varchar(32) NOT NULL DEFAULT '',
  `TriggerFieldRate` varchar(32) NOT NULL DEFAULT '',
  `TriggerFieldRateCount` varchar(32) NOT NULL DEFAULT '',
  `ClassName` varchar(32) NOT NULL DEFAULT '',
  `ClassFile` varchar(256) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_objects_wiki` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `uri` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `module` varchar(32) NOT NULL,
  `override_class_name` varchar(255) NOT NULL,
  `override_class_file` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_options` (
  `id` int(11) UNSIGNED NOT NULL,
  `category_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  `value` mediumtext NOT NULL,
  `type` enum('value','digit','text','code','checkbox','select','combobox','file','image','list','rlist','rgb','rgba','datetime') NOT NULL DEFAULT 'digit',
  `extra` text NOT NULL DEFAULT '',
  `check` varchar(32) NOT NULL,
  `check_params` text NOT NULL,
  `check_error` varchar(255) NOT NULL DEFAULT '',
  `order` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_options_categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `type_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `caption` varchar(64) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT 0,
  `order` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_options_mixes` (
  `id` int(11) UNSIGNED NOT NULL,
  `type` varchar(64) NOT NULL DEFAULT '',
  `category` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(64) NOT NULL DEFAULT '',
  `dark` tinyint(1) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `published` tinyint(1) NOT NULL DEFAULT 0,
  `editable` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_options_mixes2options` (
  `id` int(11) NOT NULL,
  `option` varchar(64) NOT NULL DEFAULT '',
  `mix_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `value` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_options_types` (
  `id` int(11) UNSIGNED NOT NULL,
  `group` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `caption` varchar(64) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `order` int(11) DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_blocks` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `cell_id` int(11) NOT NULL DEFAULT 1,
  `module` varchar(32) NOT NULL,
  `title_system` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `designbox_id` int(11) NOT NULL DEFAULT 11,
  `class` varchar(128) NOT NULL DEFAULT '',
  `submenu` varchar(64) NOT NULL DEFAULT '',
  `tabs` tinyint(4) NOT NULL DEFAULT 0,
  `async` int(11) NOT NULL DEFAULT 0,
  `visible_for_levels` int(11) NOT NULL DEFAULT 2147483647,
  `hidden_on` varchar(255) NOT NULL DEFAULT '',
  `type` enum('raw','html','creative','bento_grid','lang','image','rss','menu','custom','service','wiki') NOT NULL DEFAULT 'raw',
  `content` mediumtext NOT NULL,
  `content_empty` varchar(255) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `text_updated` int(11) NOT NULL,
  `help` varchar(255) NOT NULL,
  `cache_lifetime` int(11) NOT NULL DEFAULT 0,
  `config_api` text NOT NULL,
  `deletable` tinyint(4) NOT NULL DEFAULT 1,
  `copyable` tinyint(4) NOT NULL DEFAULT 1,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `active_api` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_blocks_data` (
  `id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL DEFAULT 0,
  `content_id` int(11) NOT NULL DEFAULT 0,
  `content_module` varchar(32) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_content_placeholders` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_design_boxes` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_layouts` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `cells_number` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_types` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `template` varchar(255) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_pages_wiki_blocks` (
  `id` int(10) UNSIGNED NOT NULL,
  `block_id` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `language` varchar(5) NOT NULL,
  `main_lang` tinyint(4) NOT NULL DEFAULT 0,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `content` mediumtext NOT NULL,
  `unsafe` tinyint(4) NOT NULL DEFAULT 0,
  `notes` varchar(255) NOT NULL,
  `added` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_permalinks` (
  `id` int(11) UNSIGNED NOT NULL,
  `standard` varchar(128) NOT NULL DEFAULT '',
  `permalink` varchar(128) NOT NULL DEFAULT '',
  `check` varchar(64) NOT NULL DEFAULT '',
  `compare_by_prefix` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_preloader` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `type` varchar(16) NOT NULL,
  `content` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_privacy_defaults` (
  `owner_id` int(11) NOT NULL DEFAULT 0,
  `action_id` int(11) NOT NULL DEFAULT 0,
  `group_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_privacy_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `check` text NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `visible` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_privacy_groups_custom` (
  `id` int(11) UNSIGNED NOT NULL,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `content_id` int(11) NOT NULL DEFAULT 0,
  `object` varchar(64) NOT NULL DEFAULT '',
  `group_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_privacy_groups_custom_members` (
  `group_id` int(11) NOT NULL DEFAULT 0,
  `member_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_privacy_groups_custom_memberships` (
  `group_id` int(11) NOT NULL DEFAULT 0,
  `membership_id` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_profiles` (
  `id` int(10) UNSIGNED NOT NULL,
  `account_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(32) NOT NULL,
  `content_id` int(10) UNSIGNED NOT NULL,
  `cfw_value` int(10) UNSIGNED NOT NULL DEFAULT 2147483647,
  `cfw_items` int(10) UNSIGNED NOT NULL DEFAULT 2147483647,
  `cfu_items` int(10) UNSIGNED NOT NULL DEFAULT 2147483647,
  `cfu_locked` tinyint(4) NOT NULL DEFAULT 0,
  `status` enum('active','pending','suspended') NOT NULL DEFAULT 'active'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_profiles_conn_bans` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `initiator` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_profiles_conn_friends` (
  `id` int(11) NOT NULL,
  `initiator` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `mutual` tinyint(4) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_profiles_conn_relations` (
  `id` int(11) NOT NULL,
  `initiator` int(11) NOT NULL DEFAULT 0,
  `content` int(11) NOT NULL DEFAULT 0,
  `relation` int(11) NOT NULL DEFAULT 0,
  `mutual` tinyint(4) NOT NULL DEFAULT 0,
  `added` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_profiles_conn_subscriptions` (
  `id` int(11) NOT NULL,
  `initiator` int(11) NOT NULL,
  `content` int(11) NOT NULL,
  `added` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_profiles_track` (
  `id` int(11) UNSIGNED NOT NULL,
  `profile_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `action` varchar(32) NOT NULL DEFAULT '',
  `date` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_queue_email` (
  `id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL DEFAULT '',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL DEFAULT '',
  `params` text NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_queue_push` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `message` text NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_recommendation_criteria` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `source_type` enum('sql','service') NOT NULL,
  `source` text NOT NULL,
  `params` text NOT NULL,
  `weight` float NOT NULL DEFAULT 0,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_recommendation_data` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL DEFAULT 0,
  `object_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `item_type` varchar(64) NOT NULL DEFAULT '',
  `item_value` int(11) NOT NULL DEFAULT 0,
  `item_reducer` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_rewrite_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `preg` varchar(255) NOT NULL,
  `service` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_search_extended_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `object` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  `values` text NOT NULL DEFAULT '',
  `pass` varchar(32) NOT NULL,
  `search_type` varchar(32) NOT NULL DEFAULT '',
  `search_value` varchar(255) NOT NULL DEFAULT '',
  `search_operator` varchar(32) NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_search_extended_sorting_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `object` varchar(64) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `direction` varchar(32) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_seo_links` (
  `id` int(11) NOT NULL,
  `module` varchar(32) NOT NULL,
  `page_uri` varchar(255) NOT NULL,
  `param_name` varchar(32) NOT NULL,
  `param_value` varchar(32) NOT NULL,
  `uri` varchar(50) NOT NULL,
  `added` int(48) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_seo_uri_rewrites` (
  `id` int(11) NOT NULL,
  `uri_orig` varchar(255) NOT NULL,
  `uri_rewrite` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_sessions` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` text DEFAULT NULL,
  `date` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_statistics` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(32) NOT NULL DEFAULT '',
  `query` text NOT NULL DEFAULT '',
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_pages` (
  `id` int(11) UNSIGNED NOT NULL,
  `index` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(64) NOT NULL DEFAULT '',
  `header` varchar(255) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_pages_widgets` (
  `id` int(11) UNSIGNED NOT NULL,
  `page_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `widget_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `order` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_roles` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT 1,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_roles_actions` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_roles_actions2roles` (
  `role_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `action_id` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_roles_members` (
  `id` int(11) UNSIGNED NOT NULL,
  `account_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `role` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_widgets` (
  `id` int(11) UNSIGNED NOT NULL,
  `page_id` varchar(255) NOT NULL DEFAULT '',
  `module` varchar(32) NOT NULL DEFAULT '',
  `type` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `click` text NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `caption` varchar(255) NOT NULL DEFAULT '',
  `cnt_notices` text NOT NULL DEFAULT '',
  `cnt_actions` text NOT NULL DEFAULT '',
  `featured` tinyint(4) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_std_widgets_bookmarks` (
  `id` int(11) NOT NULL,
  `widget_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `profile_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `bookmark` tinyint(4) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_storage_deletions` (
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `file_id` int(11) NOT NULL,
  `requested` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_storage_ghosts` (
  `iid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `object` varchar(64) NOT NULL,
  `content_id` int(11) NOT NULL,
  `created` int(10) UNSIGNED NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_storage_mime_types` (
  `ext` varchar(32) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `icon` varchar(255) NOT NULL,
  `icon_font` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_storage_tokens` (
  `iid` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `object` varchar(64) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `created` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_storage_user_quotas` (
  `profile_id` int(11) NOT NULL,
  `current_size` bigint(20) NOT NULL,
  `current_number` int(11) NOT NULL,
  `ts` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_transcoder_audio_files` (
  `id` int(11) NOT NULL,
  `transcoder_object` varchar(64) NOT NULL,
  `file_id` int(11) NOT NULL,
  `handler` varchar(255) NOT NULL,
  `atime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_transcoder_filters` (
  `id` int(11) NOT NULL,
  `transcoder_object` varchar(64) NOT NULL,
  `filter` varchar(32) NOT NULL,
  `filter_params` text NOT NULL,
  `order` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_transcoder_images_files` (
  `id` int(11) NOT NULL,
  `transcoder_object` varchar(64) NOT NULL,
  `file_id` int(11) NOT NULL,
  `handler` varchar(255) NOT NULL,
  `atime` int(11) NOT NULL,
  `data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_transcoder_queue` (
  `id` int(11) NOT NULL,
  `transcoder_object` varchar(64) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `file_url_source` varchar(255) NOT NULL,
  `file_id_source` varchar(255) NOT NULL,
  `file_url_result` varchar(255) NOT NULL,
  `file_ext_result` varchar(255) NOT NULL,
  `file_id_result` int(11) NOT NULL,
  `server` varchar(255) NOT NULL,
  `status` enum('pending','processing','complete','failed','delete') NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `added` int(11) NOT NULL,
  `changed` int(11) NOT NULL,
  `log` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_transcoder_queue_files` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_transcoder_videos_files` (
  `id` int(11) NOT NULL,
  `transcoder_object` varchar(64) NOT NULL,
  `file_id` int(11) NOT NULL,
  `handler` varchar(255) NOT NULL,
  `atime` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_wiki_files` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `sys_wiki_images_resized` (
  `id` int(11) NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL,
  `remote_id` varchar(128) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(128) NOT NULL,
  `ext` varchar(32) NOT NULL,
  `size` bigint(20) NOT NULL,
  `added` int(11) NOT NULL,
  `modified` int(11) NOT NULL,
  `private` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


ALTER TABLE `bx_persons_cmts`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);
ALTER TABLE `bx_persons_cmts` ADD FULLTEXT KEY `search_fields` (`cmt_text`);

ALTER TABLE `bx_persons_cmts_notes`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);
ALTER TABLE `bx_persons_cmts_notes` ADD FULLTEXT KEY `search_fields` (`cmt_text`);

ALTER TABLE `bx_persons_data`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `bx_persons_data` ADD FULLTEXT KEY `search_fields` (`fullname`,`description`);

ALTER TABLE `bx_persons_favorites_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`object_id`,`author_id`);

ALTER TABLE `bx_persons_meta_keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `keyword` (`keyword`(250));

ALTER TABLE `bx_persons_meta_locations`
  ADD PRIMARY KEY (`object_id`),
  ADD KEY `country_state_city` (`country`,`state`(8),`city`(8));

ALTER TABLE `bx_persons_meta_mentions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `profile_id` (`profile_id`);

ALTER TABLE `bx_persons_pictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `bx_persons_pictures_resized`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `bx_persons_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reaction` (`object_id`,`reaction`);

ALTER TABLE `bx_persons_reactions_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `bx_persons_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_id` (`object_id`);

ALTER TABLE `bx_persons_reports_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report` (`object_id`,`author_nip`);

ALTER TABLE `bx_persons_scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_id` (`object_id`);

ALTER TABLE `bx_persons_scores_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `bx_persons_skills`
  ADD PRIMARY KEY (`skill_id`),
  ADD KEY `content_id` (`content_id`);

ALTER TABLE `bx_persons_views_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`object_id`,`viewer_id`,`viewer_nip`);

ALTER TABLE `bx_persons_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_id` (`object_id`);

ALTER TABLE `bx_persons_votes_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `sys_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`(191)),
  ADD KEY `added` (`added`),
  ADD KEY `logged` (`logged`),
  ADD KEY `profile_id` (`profile_id`);

ALTER TABLE `sys_accounts_password`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_accounts_pictures`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_accounts_pictures_resized`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_acl_actions`
  ADD PRIMARY KEY (`ID`);
ALTER TABLE `sys_acl_actions` ADD FULLTEXT KEY `ModuleAndName` (`Module`,`Name`);

ALTER TABLE `sys_acl_actions_track`
  ADD PRIMARY KEY (`IDAction`,`IDMember`);

ALTER TABLE `sys_acl_levels`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);
ALTER TABLE `sys_acl_levels` ADD FULLTEXT KEY `Description` (`Description`);

ALTER TABLE `sys_acl_levels_members`
  ADD PRIMARY KEY (`IDMember`,`IDLevel`,`DateStarts`);

ALTER TABLE `sys_acl_matrix`
  ADD PRIMARY KEY (`IDLevel`,`IDAction`);

ALTER TABLE `sys_agents_assistants`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_agents_assistants_chats`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_agents_assistants_chats_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_agents_assistants_chats_messages`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);
ALTER TABLE `sys_agents_assistants_chats_messages` ADD FULLTEXT KEY `search_fields` (`cmt_text`);

ALTER TABLE `sys_agents_assistants_files`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_agents_automators`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_agents_automators_assistants`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_agents_automators_helpers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_agents_automators_messages`
  ADD PRIMARY KEY (`cmt_id`),
  ADD KEY `cmt_object_id` (`cmt_object_id`,`cmt_parent_id`);
ALTER TABLE `sys_agents_automators_messages` ADD FULLTEXT KEY `search_fields` (`cmt_text`);

ALTER TABLE `sys_agents_automators_providers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_agents_helpers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_agents_models`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_agents_providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_agents_providers_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`provider_id`,`option_id`);

ALTER TABLE `sys_agents_provider_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_agents_provider_types`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_alerts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `alert_handler` (`unit`,`action`,`handler_id`);

ALTER TABLE `sys_alerts_cache_triggers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_alerts_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_api_keys`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_api_origins`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_audit`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_background_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_badges`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_badges2objects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `badge_object` (`object_id`,`badge_id`);

ALTER TABLE `sys_categories`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_categories2objects`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_cmts_ids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_cmt_id` (`system_id`,`cmt_id`);

ALTER TABLE `sys_cmts_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_cmts_images2entries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `image` (`system_id`,`cmt_id`,`image_id`);

ALTER TABLE `sys_cmts_images_preview`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_cmts_meta_keywords`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `keyword` (`keyword`(250));

ALTER TABLE `sys_cmts_meta_mentions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object_id` (`object_id`),
  ADD KEY `profile_id` (`profile_id`);

ALTER TABLE `sys_cmts_reactions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reaction` (`object_id`,`reaction`);

ALTER TABLE `sys_cmts_reactions_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `sys_cmts_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_id` (`object_id`);

ALTER TABLE `sys_cmts_reports_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `report` (`object_id`,`author_nip`);

ALTER TABLE `sys_cmts_scores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_id` (`object_id`);

ALTER TABLE `sys_cmts_scores_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `sys_cmts_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_id` (`object_id`);

ALTER TABLE `sys_cmts_votes_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `sys_content_info_grids`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grid_object` (`grid_object`);

ALTER TABLE `sys_cron_jobs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_email_templates`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `sys_embeded_data`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_form_displays`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_display_name` (`object`,`display_name`);

ALTER TABLE `sys_form_display_inputs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `display_input` (`display_name`,`input_name`);

ALTER TABLE `sys_form_fields_ids`
  ADD PRIMARY KEY (`id`),
  ADD KEY `system_form_fields_id` (`object_form`,`content_id`,`nested_content_id`);

ALTER TABLE `sys_form_fields_reaction`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `reaction` (`object_id`,`reaction`);

ALTER TABLE `sys_form_fields_reaction_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `sys_form_fields_votes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_id` (`object_id`);

ALTER TABLE `sys_form_fields_votes_track`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vote` (`object_id`,`author_nip`);

ALTER TABLE `sys_form_inputs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `display_name` (`object`,`name`(127));

ALTER TABLE `sys_form_inputs_privacy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `input` (`input_id`,`author_id`);

ALTER TABLE `sys_form_pre_lists`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`(191));
ALTER TABLE `sys_form_pre_lists` ADD FULLTEXT KEY `ModuleAndKey` (`module`,`key`);

ALTER TABLE `sys_form_pre_values`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `sys_form_pre_values` ADD FULLTEXT KEY `KeyAndValue` (`Key`,`Value`);

ALTER TABLE `sys_grid_actions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_name_type` (`object`,`type`,`name`(123));

ALTER TABLE `sys_grid_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_name` (`object`,`name`(127));

ALTER TABLE `sys_iframely_data`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_images`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_images_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_images_editor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_images_editor_resized`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_images_resized`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_injections`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_injections_admin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_keys`
  ADD PRIMARY KEY (`key`);

ALTER TABLE `sys_labels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`value`);

ALTER TABLE `sys_localization_categories`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`(191));

ALTER TABLE `sys_localization_keys`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Key` (`Key`(191));
ALTER TABLE `sys_localization_keys` ADD FULLTEXT KEY `KeyFilter` (`Key`);

ALTER TABLE `sys_localization_languages`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `Name` (`Name`);

ALTER TABLE `sys_localization_strings`
  ADD PRIMARY KEY (`IDKey`,`IDLanguage`);
ALTER TABLE `sys_localization_strings` ADD FULLTEXT KEY `String` (`String`);

ALTER TABLE `sys_menu_items`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_menu_sets`
  ADD PRIMARY KEY (`set_name`);

ALTER TABLE `sys_menu_templates`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `uri` (`uri`),
  ADD UNIQUE KEY `class_prefix` (`class_prefix`),
  ADD UNIQUE KEY `db_prefix` (`db_prefix`),
  ADD UNIQUE KEY `path` (`path`(191));

ALTER TABLE `sys_modules_file_tracks`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_modules_relations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_auths`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `sys_objects_captcha`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_category`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`),
  ADD UNIQUE KEY `form_object` (`form_object`,`list_name`(127));

ALTER TABLE `sys_objects_chart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_cmts`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `sys_objects_connection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_content_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `alert_add` (`alert_unit`,`alert_action_add`),
  ADD UNIQUE KEY `alert_update` (`alert_unit`,`alert_action_update`),
  ADD UNIQUE KEY `alert_delete` (`alert_unit`,`alert_action_delete`);

ALTER TABLE `sys_objects_editor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_embeds`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_favorite`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_feature`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_file_handlers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_form`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_grid`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_live_updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_objects_location_field`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_location_map`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_logs`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_metatags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`),
  ADD UNIQUE KEY `uri` (`uri`(191));

ALTER TABLE `sys_objects_payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`),
  ADD UNIQUE KEY `uri` (`uri`);

ALTER TABLE `sys_objects_player`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_privacy`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`),
  ADD UNIQUE KEY `action` (`module`,`action`(127));

ALTER TABLE `sys_objects_push`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_recommendation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_objects_report`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_rss`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_score`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_search`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `sys_objects_search_extended`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_sms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_storage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_transcoder`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_uploader`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`);

ALTER TABLE `sys_objects_view`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_objects_vote`
  ADD PRIMARY KEY (`ID`);

ALTER TABLE `sys_objects_wiki`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object` (`object`),
  ADD UNIQUE KEY `uri` (`uri`);

ALTER TABLE `sys_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id` (`category_id`);

ALTER TABLE `sys_options_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_options_mixes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_options_mixes2options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `value` (`option`,`mix_id`);

ALTER TABLE `sys_options_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_pages_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `object` (`object`);
ALTER TABLE `sys_pages_blocks` ADD FULLTEXT KEY `text` (`text`);

ALTER TABLE `sys_pages_blocks_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block` (`block_id`,`content_id`,`content_module`);

ALTER TABLE `sys_pages_content_placeholders`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_pages_design_boxes`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_pages_layouts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_pages_types`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_pages_wiki_blocks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `block_lang_rev` (`block_id`,`language`,`revision`);

ALTER TABLE `sys_permalinks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `check` (`standard`(80),`permalink`(80),`check`(30));

ALTER TABLE `sys_preloader`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_privacy_defaults`
  ADD PRIMARY KEY (`owner_id`,`action_id`);

ALTER TABLE `sys_privacy_groups`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_privacy_groups_custom`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_privacy` (`profile_id`,`content_id`,`object`);

ALTER TABLE `sys_privacy_groups_custom_members`
  ADD PRIMARY KEY (`group_id`,`member_id`);

ALTER TABLE `sys_privacy_groups_custom_memberships`
  ADD PRIMARY KEY (`group_id`,`membership_id`);

ALTER TABLE `sys_profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_type_content` (`account_id`,`type`,`content_id`),
  ADD KEY `content_type` (`content_id`,`type`);

ALTER TABLE `sys_profiles_conn_bans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `initiator` (`initiator`,`content`),
  ADD KEY `content` (`content`);

ALTER TABLE `sys_profiles_conn_friends`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `initiator` (`initiator`,`content`),
  ADD KEY `content` (`content`);

ALTER TABLE `sys_profiles_conn_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `initiator` (`initiator`,`content`),
  ADD KEY `content` (`content`);

ALTER TABLE `sys_profiles_conn_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `initiator` (`initiator`,`content`),
  ADD KEY `content` (`content`);

ALTER TABLE `sys_profiles_track`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `profile_track` (`profile_id`,`action`);

ALTER TABLE `sys_queue_email`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_queue_push`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_recommendation_criteria`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `criterion` (`object_id`,`name`);

ALTER TABLE `sys_recommendation_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `recommendation` (`profile_id`,`object_id`,`item_id`);

ALTER TABLE `sys_rewrite_rules`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `sys_search_extended_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `field` (`object`,`name`(127));

ALTER TABLE `sys_search_extended_sorting_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `field` (`object`,`name`(127),`direction`);

ALTER TABLE `sys_seo_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_page_param` (`module`,`page_uri`(109),`param_value`),
  ADD UNIQUE KEY `module_page_uri` (`module`,`page_uri`(109),`uri`),
  ADD KEY `param_name_value` (`param_name`,`param_value`);

ALTER TABLE `sys_seo_uri_rewrites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uri_orig` (`uri_orig`(191)),
  ADD UNIQUE KEY `uri_rewrite` (`uri_rewrite`(191));

ALTER TABLE `sys_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `date` (`date`);

ALTER TABLE `sys_statistics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_std_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `sys_std_pages_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wid_pag` (`widget_id`,`page_id`);

ALTER TABLE `sys_std_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);
ALTER TABLE `sys_std_roles` ADD FULLTEXT KEY `searchable` (`title`,`description`);

ALTER TABLE `sys_std_roles_actions`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `sys_std_roles_actions` ADD FULLTEXT KEY `searchable` (`title`,`description`);

ALTER TABLE `sys_std_roles_actions2roles`
  ADD PRIMARY KEY (`role_id`,`action_id`);

ALTER TABLE `sys_std_roles_members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account` (`account_id`);

ALTER TABLE `sys_std_widgets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `widget-page` (`id`,`page_id`(187));

ALTER TABLE `sys_std_widgets_bookmarks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bookmark` (`widget_id`,`profile_id`);

ALTER TABLE `sys_storage_deletions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `object_file_id` (`object`,`file_id`),
  ADD KEY `requested` (`requested`);

ALTER TABLE `sys_storage_ghosts`
  ADD PRIMARY KEY (`iid`),
  ADD UNIQUE KEY `id` (`id`,`object`),
  ADD KEY `created` (`created`),
  ADD KEY `profile_object_content` (`profile_id`,`object`,`content_id`);

ALTER TABLE `sys_storage_mime_types`
  ADD PRIMARY KEY (`ext`);

ALTER TABLE `sys_storage_tokens`
  ADD PRIMARY KEY (`iid`),
  ADD UNIQUE KEY `id` (`id`,`object`,`hash`),
  ADD KEY `created` (`created`);

ALTER TABLE `sys_storage_user_quotas`
  ADD PRIMARY KEY (`profile_id`);

ALTER TABLE `sys_transcoder_audio_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transcoder_object` (`transcoder_object`,`handler`(127)),
  ADD KEY `atime` (`atime`),
  ADD KEY `file_id` (`file_id`);

ALTER TABLE `sys_transcoder_filters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transcoder_object` (`transcoder_object`);

ALTER TABLE `sys_transcoder_images_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transcoder_object` (`transcoder_object`,`handler`(127)),
  ADD KEY `atime` (`atime`),
  ADD KEY `file_id` (`file_id`);

ALTER TABLE `sys_transcoder_queue`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transcoder_object` (`transcoder_object`,`file_id_source`(127));

ALTER TABLE `sys_transcoder_queue_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_transcoder_videos_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `transcoder_object` (`transcoder_object`,`handler`(127)),
  ADD KEY `atime` (`atime`),
  ADD KEY `file_id` (`file_id`);

ALTER TABLE `sys_wiki_files`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);

ALTER TABLE `sys_wiki_images_resized`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `remote_id` (`remote_id`);


ALTER TABLE `bx_persons_cmts`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_cmts_notes`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_favorites_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_meta_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_meta_mentions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_pictures_resized`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_reactions_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_reports_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_scores_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_views_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `bx_persons_votes_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_accounts_password`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_accounts_pictures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_accounts_pictures_resized`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_acl_actions`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_acl_levels`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_assistants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_assistants_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_assistants_chats_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_assistants_chats_messages`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_assistants_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_automators`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_automators_assistants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_automators_helpers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_automators_messages`
  MODIFY `cmt_id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_automators_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_helpers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_providers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_providers_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_provider_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_agents_provider_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_alerts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_alerts_cache_triggers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_alerts_handlers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_api_keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_api_origins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_audit`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_background_jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_badges`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_badges2objects`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_categories2objects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_images2entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_images_preview`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_meta_keywords`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_meta_mentions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_reactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_reactions_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_reports_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_scores_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cmts_votes_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_content_info_grids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_cron_jobs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_email_templates`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_embeded_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_displays`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_display_inputs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_fields_ids`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_fields_reaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_fields_reaction_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_fields_votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_fields_votes_track`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_inputs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_inputs_privacy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_pre_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_form_pre_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_grid_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_grid_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_iframely_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_images_custom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_images_editor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_images_editor_resized`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_images_resized`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_injections`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_injections_admin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_labels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_localization_categories`
  MODIFY `ID` int(6) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_localization_keys`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_localization_languages`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_menu_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_modules`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_modules_file_tracks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_modules_relations`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_auths`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_captcha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_chart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_cmts`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_connection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_content_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_editor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_embeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_favorite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_file_handlers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_grid`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_live_updates`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_location_field`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_location_map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_metatags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_privacy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_push`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_recommendation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_rss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_score`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_search`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_search_extended`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_sms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_transcoder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_uploader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_vote`
  MODIFY `ID` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_objects_wiki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_options`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_options_categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_options_mixes`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_options_mixes2options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_options_types`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_pages_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_pages_blocks_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_pages_content_placeholders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_pages_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_pages_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_pages_wiki_blocks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_permalinks`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_preloader`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_privacy_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_privacy_groups_custom`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_profiles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_profiles_conn_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_profiles_conn_friends`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_profiles_conn_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_profiles_conn_subscriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_profiles_track`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_queue_email`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_queue_push`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_recommendation_criteria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_recommendation_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_rewrite_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_search_extended_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_search_extended_sorting_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_seo_links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_seo_uri_rewrites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_statistics`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_std_pages`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_std_pages_widgets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_std_roles`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_std_roles_actions`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_std_roles_members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_std_widgets`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_std_widgets_bookmarks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_storage_deletions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_storage_ghosts`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_storage_tokens`
  MODIFY `iid` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_transcoder_audio_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_transcoder_filters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_transcoder_images_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_transcoder_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_transcoder_queue_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_transcoder_videos_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_wiki_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `sys_wiki_images_resized`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
