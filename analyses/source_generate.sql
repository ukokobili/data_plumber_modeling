{{
    codegen.generate_source(
        schema_name="staging",
        table_names=[
            "shopify_orders",
            "shopify_refunds"            
        ],
        include_descriptions=True,
        name="main",
        include_database=True,
        include_schema=True,
    )
}}