CREATE SCHEMA IF NOT EXISTS sales_data;

-- Table for Country Information
CREATE TABLE IF NOT EXISTS sales_data.country_info (
    id INT PRIMARY KEY,                         -- Unique identifier
    city VARCHAR(100),                          -- City where sale took place
    country VARCHAR(100),                       -- Country of sale
    sales_channel VARCHAR(50)                   -- Sales channel
);

-- Table for Costs Information
CREATE TABLE IF NOT EXISTS sales_data.costs_info (
    instance_type DATE,                           -- Date for each instance type record
    db_r5_4xlarge DECIMAL(10, 2),                 -- City ID
    db_r6g_xlarge DECIMAL(10, 2),                 -- City name
    db_r6g_4xlarge DECIMAL(10, 2),                -- Country
    db_r6g_large DECIMAL(10, 2),                  -- Cost for db.r6g.large
    db_r5_xlarge DECIMAL(10, 2),                  -- Cost for db.r5.xlarge
    no_instance_type DECIMAL(10, 2),              -- Cost for "No instance type"
    db_r5_large DECIMAL(10, 2),                   -- Cost for db.r5.large
    db_t3_medium DECIMAL(10, 2),                  -- Cost for db.t3.medium
    db_t4g_medium DECIMAL(10, 2),                 -- Cost for db.t4g.medium
    db_t2_medium DECIMAL(10, 2),                  -- Cost for db.t2.medium
    total_costs DECIMAL(10, 2)                    -- Total cost of all instance types
);


-- Table for Customer Information
CREATE TABLE IF NOT EXISTS sales_data.customer_info (
    id INT PRIMARY KEY,                         -- Unique customer identifier
    customer_name VARCHAR(255)                  -- Customer's name
);

-- Table for Exchange Rates (fx)
CREATE TABLE IF NOT EXISTS sales_data.exchange_rates (
    exchange_date DATE PRIMARY KEY,             -- Date of exchange rate record
    GBPUSD DECIMAL(10, 6),                      -- GBP to USD exchange rate
    EURUSD DECIMAL(10, 6),                      -- EUR to USD exchange rate
    AUDUSD DECIMAL(10, 6),                      -- AUD to USD exchange rate
    EURGBP DECIMAL(10, 6),                      -- EUR to GBP exchange rate
    EURAUD DECIMAL(10, 6),                      -- EUR to AUD exchange rate
    GBPAUD DECIMAL(10, 6),                      -- GBP to AUD exchange rate
    JPYUSD DECIMAL(10, 6),                      -- JPY to USD exchange rate
    JPYAUD DECIMAL(10, 6),                      -- JPY to AUD exchange rate
    JPYEUR DECIMAL(10, 6),                      -- JPY to EUR exchange rate
    JPYGBP DECIMAL(10, 6),                      -- JPY to GBP exchange rate
    KRWUSD DECIMAL(10, 6),                      -- KRW to USD exchange rate
    KRWAUD DECIMAL(10, 6),                      -- KRW to AUD exchange rate
    KRWEUR DECIMAL(10, 6),                      -- KRW to EUR exchange rate
    KRWGBP DECIMAL(10, 6),                      -- KRW to GBP exchange rate
    KRWJPY DECIMAL(10, 6),                      -- KRW to JPY exchange rate
    HKDUSD DECIMAL(10, 6),                      -- HKD to USD exchange rate
    HKDAUD DECIMAL(10, 6),                      -- HKD to AUD exchange rate
    HKDEUR DECIMAL(10, 6),                      -- HKD to EUR exchange rate
    HKDGBP DECIMAL(10, 6),                      -- HKD to GBP exchange rate
    HKDJPY DECIMAL(10, 6),                      -- HKD to JPY exchange rate
    HKDKRW DECIMAL(10, 6),                      -- HKD to KRW exchange rate
    TWDUSD DECIMAL(10, 6),                      -- TWD to USD exchange rate
    TWDAUD DECIMAL(10, 6),                      -- TWD to AUD exchange rate
    TWDEUR DECIMAL(10, 6),                      -- TWD to EUR exchange rate
    TWDGBP DECIMAL(10, 6),                      -- TWD to GBP exchange rate
    TWDJPY DECIMAL(10, 6),                      -- TWD to JPY exchange rate
    TWDKRW DECIMAL(10, 6),                      -- TWD to KRW exchange rate
    TWDHKD DECIMAL(10, 6)                       -- TWD to HKD exchange rate
);

-- Table for Product Sales Data
CREATE TABLE IF NOT EXISTS sales_data.product_sales (
    sku VARCHAR(50) PRIMARY KEY,                -- Stock Keeping Unit
    category VARCHAR(50),                       -- Product category
    subcategory VARCHAR(50),                    -- Product subcategory
    product_family VARCHAR(100),                -- Product family
    key_product VARCHAR(100),                   -- Key product name
    description VARCHAR(500),                   -- Product description
    grade VARCHAR(10),                          -- Product grade
    country_id INT,                             -- Country ID (foreign key to sales_data.country_info)
    cost_currency VARCHAR(10),                  -- Currency of the cost
    cost_per_device DECIMAL(10, 2),             -- Cost per device
    sales_date DATE,                            -- Date of sale
    sold_currency VARCHAR(10),                  -- Currency of sale
    price_sold_per_device DECIMAL(10, 2),       -- Price per sold device
    status VARCHAR(20),                         -- Sale status
    customer_id INT,                            -- Customer ID (Foreign key to sales_data.customer_info)
    quantity INT,                               -- Quantity of products sold
    sales_order_id INT,                         -- Sales order identifier
    serial VARCHAR(50),                         -- Product serial number
    bin_id VARCHAR(50)                          -- Bin ID for the product
);
