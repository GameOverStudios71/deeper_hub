# DeeperHub CMS - API Guide for Client Development

## Overview
This guide provides complete field types, validation rules, and data structures for building jQuery/HTML clients that consume the DeeperHub CMS APIs.

## Base URL Structure
```
GET/POST/PUT/DELETE /api/cms/{module}/{action}
```

## Common Field Types & Validation

### Standard Fields
- **id**: `integer` (auto-generated, read-only)
- **name**: `string` (2-255 chars, alphanumeric + underscore)
- **title**: `string` (2-255 chars, any characters)
- **description**: `text` (optional, up to 65535 chars)
- **is_active**: `boolean` (default: true)
- **is_system**: `boolean` (default: false, read-only for system records)
- **created_at**: `datetime` (ISO 8601 format, auto-generated)
- **updated_at**: `datetime` (ISO 8601 format, auto-updated)
- **created_by**: `integer` (user_id, required for creation)

### Meta Fields
- **meta_title**: `string` (optional, up to 255 chars)
- **meta_description**: `string` (optional, up to 500 chars)
- **meta_keywords**: `string` (optional, comma-separated)
- **meta_robots**: `string` (default: "index,follow")

## Module-Specific APIs

## 1. 🔍 AUDIT MODULE

### AuditLog (Read-Only)
```javascript
// GET /api/cms/audit/logs
{
  "id": 123,
  "table_name": "cms_pages",           // string, required
  "record_id": "456",                  // string, required
  "action": "UPDATE",                  // enum: INSERT|UPDATE|DELETE
  "old_values": "{\"title\":\"Old\"}", // JSON string
  "new_values": "{\"title\":\"New\"}", // JSON string
  "user_id": 1,                        // integer, nullable
  "username": "admin",                 // string, from join
  "created_at": "2024-01-15T10:30:00Z"
}

// Query Parameters
?table_name=cms_pages
?user_id=1
?action=UPDATE
?start_date=2024-01-01
?end_date=2024-01-31
?limit=50
?offset=0
```

## 2. 📝 FORMS MODULE

### Form
```javascript
// POST/PUT /api/cms/forms
{
  "name": "contact_form",              // string, required, unique
  "title": "Contact Form",            // string, required
  "description": "Contact us form",   // string, optional
  "module": "cms",                    // string, default: "cms"
  "submit_name": "Send Message",      // string, default: "Enviar"
  "table_name": "contact_submissions", // string, optional
  "action_url": "/submit-contact",    // string, optional
  "method": "POST",                   // enum: GET|POST|PUT|PATCH|DELETE
  "enctype": "multipart/form-data",   // enum: application/x-www-form-urlencoded|multipart/form-data|text/plain
  "form_attrs": "data-validate='true'", // string, optional HTML attributes
  "css_class": "form-horizontal",     // string, optional
  "template": "contact.html",         // string, default: "form.html"
  "redirect_url": "/thank-you",       // string, optional
  "success_message": "Message sent!", // string, default provided
  "error_message": "Error occurred",  // string, default provided
  "email_template": "contact_email",  // string, optional
  "email_to": "admin@site.com",       // string, optional email
  "email_subject": "New Contact",     // string, optional
  "ajax_mode": true,                  // boolean, default: true
  "captcha_enabled": false,           // boolean, default: false
  "honeypot_enabled": true,           // boolean, default: true
  "rate_limit": 5,                    // integer, requests per minute, default: 0
  "is_active": true,
  "is_system": false,
  "created_by": 1
}
```

### FormFieldType
```javascript
// GET /api/cms/forms/field-types (mostly read-only)
{
  "id": 1,
  "name": "text",                     // string, unique
  "title": "Text Input",             // string
  "description": "Single line text", // string
  "input_type": "text",              // string, HTML input type
  "validation_rules": "{\"maxLength\":255}", // JSON string
  "default_options": "{\"placeholder\":\"Enter text\"}", // JSON string
  "is_active": true,
  "is_system": true,
  "order_index": 1                   // integer, for sorting
}
```

### FormField
```javascript
// POST/PUT /api/cms/forms/{form_id}/fields
{
  "form_id": 1,                      // integer, required
  "field_type_id": 1,                // integer, required
  "name": "email",                   // string, required, unique per form
  "title": "Email Address",         // string, required
  "description": "Your email",      // string, optional
  "placeholder": "Enter your email", // string, optional
  "default_value": "",               // string, optional
  "validation_rules": "{\"required\":true,\"email\":true}", // JSON string
  "options": "{\"class\":\"form-control\"}", // JSON string
  "help_text": "We'll never share your email", // string, optional
  "is_required": true,               // boolean, default: false
  "is_readonly": false,              // boolean, default: false
  "is_active": true,
  "order_index": 1                   // integer, for field ordering
}
```

## 3. 📄 PAGES MODULE

### Page
```javascript
// POST/PUT /api/cms/pages
{
  "name": "home_page",               // string, required, unique
  "uri": "/",                        // string, required, unique, URL path
  "title_system": "Home",            // string, required, internal title
  "title": "Welcome Home",           // string, required, display title
  "description": "Homepage content", // string, optional
  "module": "cms",                   // string, default: "cms"
  "page_type_id": 1,                 // integer, required
  "layout_id": 1,                    // integer, required
  "meta_title": "Home - My Site",    // string, optional
  "meta_description": "Welcome to our site", // string, optional
  "meta_keywords": "home,welcome",   // string, optional
  "meta_robots": "index,follow",     // string, default provided
  "is_active": true,
  "is_system": false,
  "is_home": false,                  // boolean, only one can be true
  "sticky_columns": false,           // boolean, layout option
  "cache_lifetime": 3600,            // integer, seconds, 0 = no cache
  "cache_editable": true,            // boolean
  "visible_for_levels": 2147483647,  // integer, permission levels
  "visible_for_levels_editable": true, // boolean
  "inject_head": "<meta name='custom'>", // string, optional HTML
  "inject_footer": "<script>...</script>", // string, optional HTML
  "config_api": "{\"api_endpoint\":\"/api/data\"}", // JSON string
  "custom_css": ".custom { color: red; }", // string, optional CSS
  "custom_js": "console.log('loaded');", // string, optional JS
  "author_id": 1,                    // integer, required
  "is_deletable": true,              // boolean, default: true
  "is_editable": true,               // boolean, default: true
  "published_at": "2024-01-15T10:00:00Z" // datetime, optional
}
```

## 4. 🧩 WIDGETS MODULE

### Widget
```javascript
// POST/PUT /api/cms/widgets
{
  "name": "latest_news",             // string, required, unique
  "title": "Latest News",            // string, required
  "description": "Shows recent news", // string, optional
  "widget_type_id": 1,               // integer, required
  "module": "cms",                   // string, default: "cms"
  "template": "news_widget.html",    // string, optional
  "css_class": "widget-news",        // string, optional
  "custom_css": ".widget-news { border: 1px solid #ccc; }", // string
  "content": "<h3>News Content</h3>", // text, optional static content
  "content_type": "html",            // enum: html|markdown|text
  "config_data": "{\"limit\":5,\"category\":\"news\"}", // JSON string
  "api_endpoint": "/api/news/latest", // string, optional
  "refresh_interval": 300,           // integer, seconds, 0 = no refresh
  "visible_for_levels": 2147483647,  // integer, permission levels
  "is_active": true,
  "is_featured": false,              // boolean, for highlighting
  "created_by": 1
}
```

## 5. 👥 USERS MODULE

### User
```javascript
// POST/PUT /api/cms/users
{
  "username": "admin",               // string, required, unique, 3-50 chars
  "email": "admin@site.com",         // string, required, unique, valid email
  "password": "newpassword123",      // string, required for creation, 8+ chars
  "password_hash": "hashed_value",   // string, auto-generated, don't send
  "full_name": "Administrator",      // string, optional
  "is_active": true,                 // boolean, default: true
  "is_admin": false,                 // boolean, default: false
  "last_login": "2024-01-15T10:30:00Z" // datetime, auto-updated
}

// Login endpoint
// POST /api/cms/auth/login
{
  "email": "admin@site.com",         // string, required
  "password": "password123"          // string, required
}
```

### Permission
```javascript
// POST/PUT /api/cms/users/{user_id}/permissions
{
  "user_id": 1,                      // integer, required
  "entity_id": 123,                  // integer, optional (null = global)
  "permission_type": "read",         // enum: read|write|delete|admin
  "created_at": "2024-01-15T10:30:00Z"
}
```

## 6. ⚙️ SETTINGS MODULE

### Setting
```javascript
// PUT /api/cms/settings/{name}/value (most settings are pre-created)
{
  "name": "site_title",              // string, required, unique
  "value": "My Website",             // string, the actual setting value
  "category_id": 1,                  // integer, required
  "setting_type_id": 1,              // integer, required
  "title": "Site Title",             // string, required
  "description": "Main site title",  // string, optional
  "default_value": "Default Site",   // string, optional
  "options": "{\"maxLength\":100}",  // JSON string, for selects/radios
  "validation_rules": "{\"required\":true}", // JSON string
  "placeholder": "Enter site title", // string, optional
  "help_text": "Shown in browser title", // string, optional
  "is_required": true,               // boolean
  "is_readonly": false,              // boolean
  "is_translatable": false,          // boolean
  "is_active": true,
  "is_system": false,
  "order_index": 1
}
```

### Theme
```javascript
// POST/PUT /api/cms/themes
{
  "name": "default_theme",           // string, required, unique
  "title": "Default Theme",          // string, required
  "description": "Default site theme", // string, optional
  "template_path": "/themes/default", // string, required
  "css_file": "style.css",           // string, optional
  "js_file": "theme.js",             // string, optional
  "preview_image": "preview.jpg",    // string, optional
  "version": "1.0.0",                // string, default: "1.0.0"
  "author": "Theme Author",          // string, optional
  "author_url": "https://author.com", // string, optional URL
  "supports_dark_mode": false,       // boolean, default: false
  "is_responsive": true,             // boolean, default: true
  "min_width": 320,                  // integer, pixels, default: 320
  "is_active": true,
  "is_default": false,               // boolean, only one can be true
  "is_system": false,
  "order_index": 0                   // integer, for sorting
}
```

## 7. 🖼️ MEDIA MODULE

### MediaFile
```javascript
// POST /api/cms/media/upload (multipart/form-data)
{
  "file": File,                      // File object, required
  "folder_id": 1,                    // integer, optional
  "title": "My Image",               // string, optional
  "description": "Image description", // string, optional
  "alt_text": "Alt text for image",  // string, optional
  "caption": "Image caption",        // string, optional
  "seo_title": "SEO title",          // string, optional
  "seo_description": "SEO desc",     // string, optional
  "is_public": true,                 // boolean, default: true
  "visible_for_levels": 2147483647   // integer, permission levels
}

// Response after upload
{
  "id": 123,
  "folder_id": 1,
  "storage_id": 1,
  "original_name": "photo.jpg",      // string, original filename
  "file_name": "photo_123.jpg",      // string, stored filename
  "file_path": "/uploads/2024/01/",  // string, relative path
  "full_path": "/uploads/2024/01/photo_123.jpg", // string, full path
  "file_size": 1024000,              // integer, bytes
  "mime_type": "image/jpeg",         // string, detected MIME type
  "file_extension": "jpg",           // string, file extension
  "file_hash": "abc123def456",       // string, file hash for duplicates
  "image_width": 1920,               // integer, pixels (images only)
  "image_height": 1080,              // integer, pixels (images only)
  "video_duration": null,            // integer, seconds (videos only)
  "audio_duration": null,            // integer, seconds (audio only)
  "download_count": 0,               // integer, download counter
  "view_count": 0,                   // integer, view counter
  "is_featured": false,              // boolean
  "uploaded_by": 1                   // integer, user_id
}
```

### MediaFolder
```javascript
// POST/PUT /api/cms/media/folders
{
  "parent_id": null,                 // integer, optional (null = root)
  "storage_id": 1,                   // integer, required
  "name": "Photos",                  // string, required
  "path": "photos",                  // string, auto-generated from name
  "full_path": "/uploads/photos",    // string, auto-generated
  "description": "Photo gallery",    // string, optional
  "is_public": true,                 // boolean, default: true
  "visible_for_levels": 2147483647,  // integer, permission levels
  "is_active": true,
  "is_system": false,
  "created_by": 1
}
```

## 8. 🧭 MENUS MODULE

### MenuSet
```javascript
// POST/PUT /api/cms/menus/sets
{
  "name": "main_menu",               // string, required, unique
  "title": "Main Navigation",        // string, required
  "description": "Primary site menu", // string, optional
  "template_id": 1,                  // integer, required
  "css_class": "navbar-nav",         // string, optional
  "custom_css": ".navbar-nav { margin: 0; }", // string, optional
  "max_depth": 3,                    // integer, default: 3
  "show_icons": true,                // boolean, default: true
  "show_badges": true,               // boolean, default: true
  "responsive": true,                // boolean, default: true
  "visible_for_levels": 2147483647,  // integer, permission levels
  "is_active": true,
  "is_system": false,
  "created_by": 1
}
```

### MenuItem
```javascript
// POST/PUT /api/cms/menus/sets/{set_id}/items
{
  "menu_set_id": 1,                  // integer, required
  "parent_id": null,                 // integer, optional (null = root level)
  "name": "home",                    // string, required
  "title": "Home",                   // string, required
  "description": "Homepage link",    // string, optional
  "link_type": "page",               // enum: page|url|entity|separator
  "link_url": "/custom-url",         // string, optional (for url type)
  "page_id": 1,                      // integer, optional (for page type)
  "entity_name": "products",         // string, optional (for entity type)
  "icon": "fas fa-home",             // string, optional icon class
  "image": "/icons/home.png",        // string, optional image URL
  "css_class": "nav-item",           // string, optional
  "badge_text": "New",               // string, optional
  "badge_color": "red",              // string, optional
  "badge_query": "SELECT COUNT(*) FROM news WHERE is_new=1", // string, optional
  "target": "_self",                 // enum: _self|_blank|_parent|_top
  "onclick": "trackClick('home')",   // string, optional JavaScript
  "visible_for_levels": 2147483647,  // integer, permission levels
  "submenu_template": "dropdown",    // string, optional
  "mega_menu_content": "<div>...</div>", // text, optional HTML
  "is_active": true,
  "is_separator": false,             // boolean, for separator items
  "order_index": 1                   // integer, for ordering
}
```

## 9. 🔗 RELATIONSHIPS MODULE

### Relationship
```javascript
// POST/PUT /api/cms/relationships
{
  "name": "page_widgets",            // string, required, unique
  "from_entity_id": 1,               // integer, required (pages entity)
  "to_entity_id": 2,                 // integer, required (widgets entity)
  "relationship_type": "one_to_many", // enum: one_to_one|one_to_many|many_to_many
  "from_field_id": 1,                // integer, optional
  "to_field_id": 2,                  // integer, optional
  "is_active": true
}
```

### EntityRelationship
```javascript
// POST/PUT /api/cms/relationships/{relationship_id}/records
{
  "relationship_id": 1,              // integer, required
  "from_record_id": "123",           // string, required (page ID)
  "to_record_id": "456",             // string, required (widget ID)
  "order_index": 1                   // integer, for ordering
}
```

## Common HTTP Status Codes

- **200 OK**: Successful GET/PUT
- **201 Created**: Successful POST
- **204 No Content**: Successful DELETE
- **400 Bad Request**: Validation errors
- **401 Unauthorized**: Authentication required
- **403 Forbidden**: Insufficient permissions
- **404 Not Found**: Resource not found
- **422 Unprocessable Entity**: Validation failed
- **500 Internal Server Error**: Server error

## Error Response Format
```javascript
{
  "error": true,
  "message": "Validation failed",
  "errors": [
    "name is required",
    "email must be valid"
  ],
  "code": 422
}
```

## Success Response Format
```javascript
{
  "success": true,
  "data": { /* object or array */ },
  "message": "Operation completed successfully"
}
```

## Pagination (for list endpoints)
```javascript
// Query parameters
?limit=20&offset=0&sort=created_at&order=desc

// Response format
{
  "success": true,
  "data": [ /* array of objects */ ],
  "pagination": {
    "total": 150,
    "limit": 20,
    "offset": 0,
    "pages": 8,
    "current_page": 1
  }
}
```

## Authentication
```javascript
// Headers for authenticated requests
{
  "Authorization": "Bearer <jwt_token>",
  "Content-Type": "application/json"
}
```

## File Upload (Media)
```javascript
// Content-Type: multipart/form-data
const formData = new FormData();
formData.append('file', fileInput.files[0]);
formData.append('folder_id', '1');
formData.append('title', 'My Image');
```
```
```
