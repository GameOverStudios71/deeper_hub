-- Schema derived from una.sql for CMS components

-- Forms
CREATE TABLE IF NOT EXISTS `sys_objects_form` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL UNIQUE,
  `module` TEXT,
  `title` TEXT,
  `class_name` TEXT,
  `class_file` TEXT
);
CREATE INDEX IF NOT EXISTS `idx_sys_objects_form_object` ON `sys_objects_form`(`object`);

CREATE TABLE IF NOT EXISTS `sys_form_inputs` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL, -- Corresponds to sys_objects_form.object
  `name` TEXT NOT NULL,
  `type` TEXT,
  `caption` TEXT
  -- FOREIGN KEY (`object`) REFERENCES `sys_objects_form`(`object`)
);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_sys_form_inputs_object_name` ON `sys_form_inputs`(`object`, `name`);

CREATE TABLE IF NOT EXISTS `sys_form_displays` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL, -- Corresponds to sys_objects_form.object
  `display_name` TEXT NOT NULL,
  `title` TEXT
  -- FOREIGN KEY (`object`) REFERENCES `sys_objects_form`(`object`)
);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_sys_form_displays_object_display_name` ON `sys_form_displays`(`object`, `display_name`);

CREATE TABLE IF NOT EXISTS `sys_form_display_inputs` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `display_name` TEXT NOT NULL, -- Corresponds to sys_form_displays.display_name
  `input_name` TEXT NOT NULL,   -- Corresponds to sys_form_inputs.name
  `order` INTEGER
  -- FOREIGN KEY (`display_name`) REFERENCES `sys_form_displays`(`display_name`), -- Potentially more complex if display_name is not unique across objects
  -- FOREIGN KEY (`input_name`) REFERENCES `sys_form_inputs`(`name`) -- Potentially more complex for similar reasons
);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_sys_form_display_inputs_display_input` ON `sys_form_display_inputs`(`display_name`, `input_name`);

-- Grids
CREATE TABLE IF NOT EXISTS `sys_objects_grid` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL UNIQUE,
  `module` TEXT,
  `title` TEXT,
  `class_name` TEXT,
  `class_file` TEXT
);
CREATE INDEX IF NOT EXISTS `idx_sys_objects_grid_object` ON `sys_objects_grid`(`object`);

CREATE TABLE IF NOT EXISTS `sys_grid_fields` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL, -- Corresponds to sys_objects_grid.object
  `name` TEXT NOT NULL,
  `title` TEXT,
  `width` TEXT
  -- FOREIGN KEY (`object`) REFERENCES `sys_objects_grid`(`object`)
);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_sys_grid_fields_object_name` ON `sys_grid_fields`(`object`, `name`);

CREATE TABLE IF NOT EXISTS `sys_grid_actions` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL, -- Corresponds to sys_objects_grid.object
  `type` TEXT NOT NULL,
  `name` TEXT NOT NULL,
  `title` TEXT,
  `icon` TEXT
  -- FOREIGN KEY (`object`) REFERENCES `sys_objects_grid`(`object`)
);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_sys_grid_actions_object_type_name` ON `sys_grid_actions`(`object`, `type`, `name`);

CREATE TABLE IF NOT EXISTS `sys_content_info_grids` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `grid_object` TEXT NOT NULL, -- Corresponds to sys_objects_grid.object
  `content_info_object` TEXT NOT NULL -- Corresponds to sys_objects_content_info.object
  -- FOREIGN KEY (`grid_object`) REFERENCES `sys_objects_grid`(`object`),
  -- FOREIGN KEY (`content_info_object`) REFERENCES `sys_objects_content_info`(`object`)
);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_sys_content_info_grids_grid_content` ON `sys_content_info_grids`(`grid_object`, `content_info_object`);

-- Views
CREATE TABLE IF NOT EXISTS `sys_objects_view` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL UNIQUE,
  `module` TEXT,
  `title` TEXT,
  `class_name` TEXT,
  `class_file` TEXT
);
CREATE INDEX IF NOT EXISTS `idx_sys_objects_view_object` ON `sys_objects_view`(`object`);

-- Content Info
CREATE TABLE IF NOT EXISTS `sys_objects_content_info` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `object` TEXT NOT NULL UNIQUE,
  `module` TEXT,
  `title` TEXT
);
CREATE INDEX IF NOT EXISTS `idx_sys_objects_content_info_object` ON `sys_objects_content_info`(`object`);

-- Standard Widgets
CREATE TABLE IF NOT EXISTS `sys_std_widgets` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `module` TEXT NOT NULL,
  `type` TEXT NOT NULL,
  `url` TEXT,
  `caption` TEXT,
  `icon` TEXT
);
CREATE INDEX IF NOT EXISTS `idx_sys_std_widgets_module_type` ON `sys_std_widgets`(`module`, `type`);

CREATE TABLE IF NOT EXISTS `sys_std_pages_widgets` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `page_id` INTEGER NOT NULL, -- Corresponds to sys_std_pages.id (assumed)
  `widget_id` INTEGER NOT NULL, -- Corresponds to sys_std_widgets.id
  `order` INTEGER
  -- FOREIGN KEY (`page_id`) REFERENCES `sys_std_pages`(`id`),
  -- FOREIGN KEY (`widget_id`) REFERENCES `sys_std_widgets`(`id`)
);
CREATE UNIQUE INDEX IF NOT EXISTS `idx_sys_std_pages_widgets_page_widget` ON `sys_std_pages_widgets`(`page_id`, `widget_id`);