CREATE TABLE "Users"(
    "created_at" INT NULL DEFAULT 'GETDATE()',
    "email" VARCHAR(100) NOT NULL,
    "username" VARCHAR(50) NOT NULL,
    "user_id" INT NOT NULL,
    "password" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Users" ADD CONSTRAINT "users_user_id_primary" PRIMARY KEY("user_id");
CREATE TABLE "ProductCategories"(
    "category_id" INT NOT NULL,
    "product_id" INT NOT NULL
);
ALTER TABLE
    "ProductCategories" ADD CONSTRAINT "productcategories_category_id_primary" PRIMARY KEY("category_id");
ALTER TABLE
    "ProductCategories" ADD CONSTRAINT "productcategories_product_id_primary" PRIMARY KEY("product_id");
CREATE TABLE "Reviews"(
    "created_at" INT NULL DEFAULT 'GETDATE()',
    "product_id" INT NULL,
    "user_id" INT NULL,
    "comment" VARCHAR(255) NULL,
    "review_id" INT NOT NULL,
    "rating" INT NULL
);
ALTER TABLE
    "Reviews" ADD CONSTRAINT "reviews_review_id_primary" PRIMARY KEY("review_id");
CREATE TABLE "Products"(
    "description" VARCHAR(255) NOT NULL,
    "product_id" INT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "created_at" INT NULL DEFAULT 'GETDATE()',
    "image_url" VARCHAR(255) NULL,
    "price" DECIMAL(10, 2) NOT NULL
);
ALTER TABLE
    "Products" ADD CONSTRAINT "products_product_id_primary" PRIMARY KEY("product_id");
CREATE TABLE "Orders"(
    "total_amount" DECIMAL(10, 2) NOT NULL,
    "user_id" INT NULL,
    "order_id" INT NOT NULL,
    "order_date" INT NULL DEFAULT 'GETDATE()'
);
ALTER TABLE
    "Orders" ADD CONSTRAINT "orders_order_id_primary" PRIMARY KEY("order_id");
CREATE TABLE "Categories"(
    "created_at" INT NULL DEFAULT 'GETDATE()',
    "category_name" VARCHAR(50) NOT NULL,
    "category_id" INT NOT NULL
);
ALTER TABLE
    "Categories" ADD CONSTRAINT "categories_category_id_primary" PRIMARY KEY("category_id");
CREATE TABLE "Addresses"(
    "address_id" INT NOT NULL,
    "postal_code" VARCHAR(20) NOT NULL,
    "user_id" INT NULL,
    "address_line" VARCHAR(255) NOT NULL,
    "city" VARCHAR(100) NOT NULL
);
ALTER TABLE
    "Addresses" ADD CONSTRAINT "addresses_address_id_primary" PRIMARY KEY("address_id");
CREATE TABLE "OrderDetails"(
    "order_id" INT NULL,
    "product_id" INT NULL,
    "quantity" INT NOT NULL,
    "price" DECIMAL(10, 2) NOT NULL,
    "order_detail_id" INT NOT NULL
);
ALTER TABLE
    "OrderDetails" ADD CONSTRAINT "orderdetails_order_detail_id_primary" PRIMARY KEY("order_detail_id");
ALTER TABLE
    "Reviews" ADD CONSTRAINT "reviews_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");
ALTER TABLE
    "Categories" ADD CONSTRAINT "categories_category_id_foreign" FOREIGN KEY("category_id") REFERENCES "ProductCategories"("category_id");
ALTER TABLE
    "OrderDetails" ADD CONSTRAINT "orderdetails_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "Products"("product_id");
ALTER TABLE
    "Reviews" ADD CONSTRAINT "reviews_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "Products"("product_id");
ALTER TABLE
    "Orders" ADD CONSTRAINT "orders_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");
ALTER TABLE
    "OrderDetails" ADD CONSTRAINT "orderdetails_order_id_foreign" FOREIGN KEY("order_id") REFERENCES "Orders"("order_id");
ALTER TABLE
    "Products" ADD CONSTRAINT "products_product_id_foreign" FOREIGN KEY("product_id") REFERENCES "ProductCategories"("product_id");
ALTER TABLE
    "Addresses" ADD CONSTRAINT "addresses_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "Users"("user_id");