DROP TABLE IF EXISTS exam;

CREATE TABLE exam
(
    exam_id   serial UNIQUE NOT NULL,
    exam_name varchar,
    exam_date date
);


SELECT conname
FROM pg_constraint
WHERE conrelid = 'exam'::regclass
  AND contype = 'u';

ALTER TABLE exam
    DROP CONSTRAINT exam_exam_id_key;

ALTER TABLE exam
    ADD CONSTRAINT pk_exam_exam_id PRIMARY KEY (exam_id); -- ALTER TABLE exam ADD PRIMARY KEY(exam_id);

DROP TABLE IF EXISTS person CASCADE;

CREATE TABLE person
(
    person_id        int PRIMARY KEY,
    person_name      varchar,
    person_last_name varchar
);

DROP TABLE IF EXISTS passport;

CREATE TABLE passport
(
    passport_id     int,
    passport_number int  NOT NULL,
    registration    text NOT NULL,
    person_id       int  NOT NULL,

    CONSTRAINT pk_passport_passport_id PRIMARY KEY (passport_id),
    CONSTRAINT fk_passport_person_person_id FOREIGN KEY (person_id) REFERENCES person (person_id)
);

ALTER TABLE book
    ADD COLUMN weight int
        CONSTRAINT chk_book_weight CHECK ( weight > 0 AND weight < 100);

CREATE TABLE student
(
    student_id serial,
    full_name  varchar,
    course     int DEFAULT 1
);

INSERT INTO student(full_name)
VALUES ('name');

SELECT *
FROM student;

ALTER TABLE student
    ALTER COLUMN course DROP DEFAULT;

ALTER TABLE products
    ADD CONSTRAINT chk_product_unit_price CHECK ( unit_price > 0);

SELECT *
FROM products;

CREATE SEQUENCE IF NOT EXISTS product_id_seq
    START WITH 78 OWNED BY products.product_id; -- SELECT MAX(product_id) FROM products;

ALTER TABLE products
    ALTER COLUMN product_id SET DEFAULT nextval('product_id_seq');

INSERT INTO products (product_name, supplier_id, category_id, quantity_per_unit,
                      unit_price, units_in_stock, units_on_order, reorder_level, discontinued)
VALUES ('prod', 1, 1, 10, 20, 20, 10, 1, 0)
RETURNING product_id;


