# DeeperHub CMS - Validation Rules & Data Types

## Field Validation Rules

### String Fields
```javascript
// Basic string validation
{
  "type": "string",
  "required": true,
  "minLength": 2,
  "maxLength": 255,
  "pattern": "^[a-zA-Z0-9_-]+$",  // alphanumeric + underscore/dash
  "trim": true
}

// Name fields (for internal use)
{
  "type": "string",
  "required": true,
  "minLength": 2,
  "maxLength": 100,
  "pattern": "^[a-zA-Z0-9_]+$",   // alphanumeric + underscore only
  "unique": true                   // must be unique in table
}

// Title fields (for display)
{
  "type": "string",
  "required": true,
  "minLength": 2,
  "maxLength": 255,
  "allowHtml": false              // strip HTML tags
}

// Description fields
{
  "type": "text",
  "required": false,
  "maxLength": 65535,
  "allowHtml": true               // allow basic HTML tags
}
```

### Email Fields
```javascript
{
  "type": "email",
  "required": true,
  "pattern": "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$",
  "unique": true,                 // for user emails
  "maxLength": 255
}
```

### URL Fields
```javascript
{
  "type": "url",
  "required": false,
  "pattern": "^https?:\\/\\/.+",  // must start with http:// or https://
  "maxLength": 2048
}

// URI fields (internal paths)
{
  "type": "string",
  "required": true,
  "pattern": "^\\/[a-zA-Z0-9\\/_-]*$",  // must start with /
  "unique": true,
  "maxLength": 255
}
```

### Integer Fields
```javascript
{
  "type": "integer",
  "required": true,
  "min": 1,
  "max": 2147483647
}

// ID fields (foreign keys)
{
  "type": "integer",
  "required": true,
  "min": 1,
  "exists": "table_name.id"      // must exist in referenced table
}

// Order/Index fields
{
  "type": "integer",
  "required": false,
  "min": 0,
  "default": 0
}

// Permission levels
{
  "type": "integer",
  "required": false,
  "min": 0,
  "max": 2147483647,
  "default": 2147483647
}
```

### Boolean Fields
```javascript
{
  "type": "boolean",
  "required": false,
  "default": true                 // or false
}
```

### DateTime Fields
```javascript
{
  "type": "datetime",
  "required": false,
  "format": "ISO8601",           // YYYY-MM-DDTHH:mm:ssZ
  "autoGenerate": true           // for created_at/updated_at
}
```

### JSON Fields
```javascript
{
  "type": "json",
  "required": false,
  "schema": {                    // optional JSON schema validation
    "type": "object",
    "properties": {
      "limit": {"type": "integer", "min": 1, "max": 100},
      "category": {"type": "string"}
    }
  }
}
```

### File Fields
```javascript
{
  "type": "file",
  "required": true,
  "allowedTypes": ["image/jpeg", "image/png", "image/gif"],
  "maxSize": 5242880,            // 5MB in bytes
  "dimensions": {                // for images
    "minWidth": 100,
    "minHeight": 100,
    "maxWidth": 4000,
    "maxHeight": 4000
  }
}
```

## Enum Values

### Form Methods
```javascript
["GET", "POST", "PUT", "PATCH", "DELETE"]
```

### Form Encoding Types
```javascript
["application/x-www-form-urlencoded", "multipart/form-data", "text/plain"]
```

### Input Types (Form Fields)
```javascript
[
  "text", "email", "password", "number", "tel", "url", "search",
  "textarea", "select", "radio", "checkbox", "file", "hidden",
  "date", "datetime-local", "time", "month", "week", "color",
  "range", "submit", "button", "reset"
]
```

### Content Types
```javascript
["html", "markdown", "text", "json"]
```

### Link Types (Menu Items)
```javascript
["page", "url", "entity", "separator"]
```

### Target Types
```javascript
["_self", "_blank", "_parent", "_top"]
```

### Relationship Types
```javascript
["one_to_one", "one_to_many", "many_to_many"]
```

### Permission Types
```javascript
["read", "write", "delete", "admin"]
```

### Storage Types (Media)
```javascript
["local", "s3", "ftp", "sftp", "dropbox", "google_drive"]
```

### Transformation Types (Media)
```javascript
["resize", "crop", "rotate", "watermark", "compress", "convert"]
```

### Audit Actions
```javascript
["INSERT", "UPDATE", "DELETE"]
```

## Form Field Type Configurations

### Text Input
```javascript
{
  "input_type": "text",
  "validation_rules": {
    "required": false,
    "minLength": 0,
    "maxLength": 255,
    "pattern": null
  },
  "default_options": {
    "placeholder": "Enter text",
    "class": "form-control"
  }
}
```

### Email Input
```javascript
{
  "input_type": "email",
  "validation_rules": {
    "required": false,
    "email": true,
    "maxLength": 255
  },
  "default_options": {
    "placeholder": "Enter email address",
    "class": "form-control"
  }
}
```

### Select Dropdown
```javascript
{
  "input_type": "select",
  "validation_rules": {
    "required": false,
    "in": []  // will be populated with options
  },
  "default_options": {
    "class": "form-control",
    "multiple": false
  }
}
```

### Textarea
```javascript
{
  "input_type": "textarea",
  "validation_rules": {
    "required": false,
    "minLength": 0,
    "maxLength": 65535
  },
  "default_options": {
    "placeholder": "Enter text",
    "class": "form-control",
    "rows": 3
  }
}
```

### File Upload
```javascript
{
  "input_type": "file",
  "validation_rules": {
    "required": false,
    "allowedTypes": ["image/*", "application/pdf"],
    "maxSize": 5242880
  },
  "default_options": {
    "class": "form-control-file",
    "multiple": false
  }
}
```

### Checkbox
```javascript
{
  "input_type": "checkbox",
  "validation_rules": {
    "required": false
  },
  "default_options": {
    "class": "form-check-input",
    "value": "1"
  }
}
```

### Radio Buttons
```javascript
{
  "input_type": "radio",
  "validation_rules": {
    "required": false,
    "in": []  // will be populated with options
  },
  "default_options": {
    "class": "form-check-input"
  }
}
```

## Widget Type Configurations

### Text Widget
```javascript
{
  "name": "text_widget",
  "category": "content",
  "has_settings": true,
  "has_content": true,
  "is_cacheable": true,
  "cache_lifetime": 3600,
  "supported_positions": ["header", "sidebar", "footer", "content"],
  "min_width": 200,
  "max_width": null,
  "settings_schema": {
    "show_title": {"type": "boolean", "default": true},
    "css_class": {"type": "string", "default": ""}
  }
}
```

### News Widget
```javascript
{
  "name": "news_widget",
  "category": "dynamic",
  "has_settings": true,
  "has_content": false,
  "is_cacheable": true,
  "cache_lifetime": 300,
  "supported_positions": ["sidebar", "content"],
  "settings_schema": {
    "limit": {"type": "integer", "min": 1, "max": 20, "default": 5},
    "category": {"type": "string", "default": ""},
    "show_date": {"type": "boolean", "default": true},
    "show_excerpt": {"type": "boolean", "default": true}
  }
}
```

## Theme Configuration Schema

```javascript
{
  "theme_settings": {
    "colors": {
      "primary": {"type": "color", "default": "#007bff"},
      "secondary": {"type": "color", "default": "#6c757d"},
      "success": {"type": "color", "default": "#28a745"},
      "danger": {"type": "color", "default": "#dc3545"}
    },
    "typography": {
      "font_family": {"type": "select", "options": ["Arial", "Helvetica", "Georgia"], "default": "Arial"},
      "font_size": {"type": "integer", "min": 12, "max": 24, "default": 16},
      "line_height": {"type": "number", "min": 1.0, "max": 2.0, "default": 1.5}
    },
    "layout": {
      "container_width": {"type": "integer", "min": 960, "max": 1920, "default": 1200},
      "sidebar_width": {"type": "integer", "min": 200, "max": 400, "default": 300},
      "header_height": {"type": "integer", "min": 60, "max": 200, "default": 80}
    }
  }
}
```

## Client-Side Validation Examples

### jQuery Validation Plugin Setup
```javascript
// Form validation rules
const validationRules = {
  // Page form
  pageForm: {
    rules: {
      title: {
        required: true,
        minlength: 2,
        maxlength: 255
      },
      uri: {
        required: true,
        pattern: /^\/[a-zA-Z0-9\/_-]*$/
      },
      page_type_id: {
        required: true,
        min: 1
      }
    },
    messages: {
      title: {
        required: "Page title is required",
        minlength: "Title must be at least 2 characters",
        maxlength: "Title cannot exceed 255 characters"
      },
      uri: {
        required: "URI is required",
        pattern: "URI must start with / and contain only letters, numbers, /, _, -"
      }
    }
  },
  
  // User form
  userForm: {
    rules: {
      username: {
        required: true,
        minlength: 3,
        maxlength: 50,
        pattern: /^[a-zA-Z0-9_]+$/
      },
      email: {
        required: true,
        email: true,
        maxlength: 255
      },
      password: {
        required: true,
        minlength: 8
      }
    }
  }
};

// Apply validation to form
function initFormValidation(formId, rules) {
  $(`#${formId}`).validate(rules);
}
```
