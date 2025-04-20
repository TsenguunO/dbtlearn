import snowflake.connector

conn = snowflake.connector.connect(
    user='TSENGUUNPY',
    password='tBxVmhQtBxVmhQxzKWNyV2',
    account='yvjswmm-rt79333',
    warehouse='COMPUTE_WH',
    database='AIRBNB',
    schema='DEV',
    role='transform'
)
print("✅ Connection successful")
conn.close()
