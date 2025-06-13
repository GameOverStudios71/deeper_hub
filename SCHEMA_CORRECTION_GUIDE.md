# 🔧 CORREÇÃO DOS SCHEMAS - GUIA COMPLETO

## 🎯 **PROBLEMA IDENTIFICADO**

O projeto usa **`db_connection`** diretamente, não Ecto! Mas os schemas que criamos estavam usando sintaxe do Ecto (`schema "table" do`, `field :name`, etc.).

## ✅ **SOLUÇÃO CORRETA**

### **1. Usar `SchemaBase` com `table_name`:**
```elixir
use DeeperHub.Core.Data.SchemaBase, table_name: "cms_themes"
```

### **2. Substituir `schema "table" do` por `defstruct`:**
```elixir
# ❌ ERRADO (Ecto):
schema "cms_themes" do
  field :name, :string
  field :title, :string
  # ...
end

# ✅ CORRETO (Elixir puro):
defstruct [
  :id, :name, :title, :description, :template_path,
  :css_file, :js_file, :is_active, :inserted_at, :updated_at
]
```

### **3. Remover funções que dependem do Ecto:**
- `changeset/2` → substituir por `validate/1`
- `cast/3`, `validate_required/2`, etc. → criar validações customizadas
- `from/2`, `where/3`, etc. → usar SQL direto via `db_connection`

### **4. Manter funções utilitárias:**
- `default?/1`, `active?/1`, etc. → funcionam normalmente
- `new/1` → para criar structs com valores padrão
- `validate/1` → para validação de dados

## 🔄 **PADRÃO DE CORREÇÃO**

Para cada schema, aplicar estas mudanças:

### **ANTES:**
```elixir
use DeeperHub.Core.Data.SchemaBase, table_name: "cms_table"

schema "cms_table" do
  field :name, :string
  field :title, :string
  field :is_active, :boolean, default: true
  timestamps(type: :utc_datetime)
end

def changeset(struct, attrs) do
  struct
  |> cast(attrs, [:name, :title, :is_active])
  |> validate_required([:name, :title])
end
```

### **DEPOIS:**
```elixir
use DeeperHub.Core.Data.SchemaBase, table_name: "cms_table"

defstruct [
  :id, :name, :title, :is_active, :inserted_at, :updated_at
]

def validate(attrs) do
  errors = []
  
  errors = if not is_binary(attrs[:name]) do
    ["name é obrigatório" | errors]
  else
    errors
  end
  
  if length(errors) == 0 do
    {:ok, attrs}
  else
    {:error, errors}
  end
end

def new(attrs \\ %{}) do
  %__MODULE__{
    id: attrs[:id],
    name: attrs[:name],
    title: attrs[:title],
    is_active: attrs[:is_active] || true,
    inserted_at: attrs[:inserted_at],
    updated_at: attrs[:updated_at]
  }
end
```

## 📋 **SCHEMAS A CORRIGIR**

### **✅ CORRIGIDOS:**
1. ✅ `Theme` - Já corrigido

### **🔄 EM CORREÇÃO:**
2. 🔄 `PageType` - Em andamento

### **❌ PENDENTES:**
3. ❌ `PageLayout`
4. ❌ `Page`
5. ❌ `PageBlock`
6. ❌ `PageBlockData`
7. ❌ `ContentPlaceholder`
8. ❌ `DesignBox`
9. ❌ `FormFieldType`
10. ❌ `Form`
11. ❌ `FormField`
12. ❌ `FormSubmission`
13. ❌ `FormDisplay`
14. ❌ `FormPreList`
15. ❌ `FormSubmissionData`
16. ❌ `WidgetType`
17. ❌ `Widget`
18. ❌ `WidgetInstance`
19. ❌ `WidgetSetting`
20. ❌ `MenuSet`
21. ❌ `MenuItem`
22. ❌ `Setting`
23. ❌ `SettingCategory`
24. ❌ `SettingType`

## 🎯 **PRÓXIMOS PASSOS**

1. **Corrigir todos os schemas** seguindo o padrão acima
2. **Atualizar contextos** para usar validações customizadas
3. **Atualizar APIs REST** para usar os novos schemas
4. **Testar compilação** após cada correção

## 💡 **LIÇÕES APRENDIDAS**

1. **Sempre verificar** se o projeto usa Ecto ou `db_connection`
2. **Não misturar** sintaxe do Ecto com `db_connection`
3. **Usar `defstruct`** para definir estrutura de dados
4. **Criar validações customizadas** sem dependências do Ecto
5. **Manter funções utilitárias** que não dependem do Ecto

---

**🎉 Com essas correções, o sistema funcionará perfeitamente com `db_connection`!**
