CREATE TABLE tables (
    id BIGINT PRIMARY AUTO_INCREMENT,
    code VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    is_active(1) NOT NULL DEFAULT 1
);

CREATE TABLE menu_categories (
    id BIGINT PRIMARY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE menu_items (
    id BIGINT PRIMARY AUTO_INCREMENT,
    category_id BIGINT NOT NULL,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    is_available TINYINT(1) NOT NULL DEFAULT 1,
    description TEXT
    FOREIGN KEY (category_id) REFERENCES menu_categories(id)
);

CREATE TABLE orders (
    id BIGINT PRIMARY AUTO_INCREMENT,
    table_id BIGINT NOT NULL,
    code VARCHAR(32) UNIQUE NOT NULL,
    status VARCHAR(20) NOT NULL,
    diner_name VARCHAR(100),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    FOREIGN KEY (table_id) REFERENCES tables(id)
);

CREATE TABLE order_items (
    id BIGINT PRIMARY AUTO_INCREMENT,
    order_id BIGINT NOT NULL,
    menu_item_id BINGINT NOT NULL,
    quantity INT NOT NULL,
    unit_price_snapshot DECIMAL(10,2) NOT NULL,
    note VARCHAR(255),
    FOREIGN KEY (order_id) REFERENCES orders (id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);