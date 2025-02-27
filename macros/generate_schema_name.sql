{% macro generate_schema_name(custom_schema_name, node) -%} 

    {%- set default_schema = target.schema -%}

    {%- if target.name == 'prod' -%}
        {%- if custom_schema_name == 'mart' -%}
            {{ custom_schema_name | trim }}
        {%- else -%}
            NULL  -- Prevents other schemas from being created in prod
        {%- endif -%}

    {%- elif custom_schema_name is none -%}
        {{ default_schema }}

    {%- else -%}
        {{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}