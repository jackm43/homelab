# Source 
https://registry.terraform.io/providers/1Password/onepassword/latest/docs/resources/item#schema

# Schema
Required

    vault (String) The UUID of the vault the item is in.

Optional

    category (String) The category of the item. One of ["login" "password" "database" "secure_note"]
    database (String) (Only applies to the database category) The name of the database.
    hostname (String) (Only applies to the database category) The address where the database can be found
    note_value (String, Sensitive) Secure Note value.
    password (String, Sensitive) Password for this item.
    password_recipe (Block List) The recipe used to generate a new value for a password. (see below for nested schema)
    port (String) (Only applies to the database category) The port the database is listening on.
    section (Block List) A list of custom sections in an item (see below for nested schema)
    tags (List of String) An array of strings of the tags assigned to the item.
    title (String) The title of the item.
    type (String) (Only applies to the database category) The type of database. One of ["db2" "filemaker" "msaccess" "mssql" "mysql" "oracle" "postgresql" "sqlite" "other"]
    url (String) The primary URL for the item.
    username (String) Username for this item.

Read-Only

    id (String) The Terraform resource identifier for this item in the format vaults/<vault_id>/items/<item_id>.
    uuid (String) The UUID of the item. Item identifiers are unique within a specific vault.

Nested Schema for password_recipe

Optional:

    digits (Boolean) Use digits [0-9] when generating the password.
    length (Number) The length of the password to be generated.
    letters (Boolean) Use letters [a-zA-Z] when generating the password.
    symbols (Boolean) Use symbols [!@.-_*] when generating the password.

Nested Schema for section

Required:

    label (String) The label for the section.

Optional:

    field (Block List) A list of custom fields in the section. (see below for nested schema)

Read-Only:

    id (String) A unique identifier for the section.

Nested Schema for section.field

Required:

    label (String) The label for the field.

Optional:

    id (String) A unique identifier for the field.
    password_recipe (Block List) The recipe used to generate a new value for a password. (see below for nested schema)
    purpose (String) Purpose indicates this is a special field: a username, password, or notes field. One of ["USERNAME" "PASSWORD" "NOTES"]
    type (String) The type of value stored in the field. One of ["STRING" "CONCEALED" "EMAIL" "URL" "OTP" "DATE" "MONTH_YEAR" "MENU"]
    value (String, Sensitive) The value of the field.

Nested Schema for section.field.password_recipe

Optional:

    digits (Boolean) Use digits [0-9] when generating the password.
    length (Number) The length of the password to be generated.
    letters (Boolean) Use letters [a-zA-Z] when generating the password.
    symbols (Boolean) Use symbols [!@.-_*] when generating the password.
