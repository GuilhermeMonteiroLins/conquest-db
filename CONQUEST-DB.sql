DROP DATABASE conquest_db;
CREATE DATABASE conquest_db;
USE conquest_db;

CREATE TABLE tb_user (
id_user INT AUTO_INCREMENT PRIMARY KEY,
name_user VARCHAR(100) NOT NULL,
cpf_user VARCHAR(11) NOT NULL UNIQUE,
email_user VARCHAR(40) NOT NULL UNIQUE,
password_user BLOB NOT NULL,
status_user BOOLEAN NOT NULL,
group_user INT NOT NULL
);

CREATE TABLE tb_product (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(200) NOT NULL,
product_description TEXT NOT NULL,
product_quantity INT NOT NULL,
product_value DECIMAL(8, 2) NOT NULL,
product_review DECIMAL(2,1) NOT NULL,
product_status BOOLEAN NOT NULL
)DEFAULT charset = utf8;

CREATE TABLE tb_img_product(
img_id INT PRIMARY KEY AUTO_INCREMENT,
fk_product_id INT NOT NULL,
img_base64 LONGBLOB NOT NULL,
FOREIGN KEY (fk_product_id) REFERENCES tb_product(product_id)
);

CREATE TABLE tb_customer (
id_user INT AUTO_INCREMENT PRIMARY KEY,
name_user VARCHAR(100) NOT NULL,
cpf_user VARCHAR(11) NOT NULL UNIQUE,
email_user VARCHAR(40) NOT NULL UNIQUE,
password_user BLOB NOT NULL,
gender_user VARCHAR(40) NOT NULL,
birthdate_user VARCHAR(10) NOT NULL
);

CREATE TABLE tb_address(
id_address INT AUTO_INCREMENT PRIMARY KEY,
cep VARCHAR(9) NOT NULL,
logradouro VARCHAR(250) NOT NULL,
bairro VARCHAR(100) NOT NULL,
localidade VARCHAR(100) NOT NULL,
uf CHAR(2) NOT NULL,
complemento VARCHAR(100) NOT NULL,
numero VARCHAR(10) NOT NULL,
status BOOLEAN NOT NULL,
is_address_customer BOOLEAN NOT NULL,
fk_id_user INT NOT NULL,
FOREIGN KEY (fk_id_user) REFERENCES tb_customer(id_user)
);

CREATE TABLE tb_order(
id_order BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_customer INT NOT NULL,
fk_id_address INT NOT NULL,
amount DOUBLE NOT NULL,
freight_value DOUBLE NOT NULL,
form_payment VARCHAR(25) NOT NULL,
status VARCHAR(25) NOT NULL,
date_order VARCHAR(10) NOT NULL,
FOREIGN KEY (fk_id_address) REFERENCES tb_address(id_address),
FOREIGN KEY (fk_id_customer) REFERENCES tb_customer(id_user)
);

CREATE TABLE tb_order_item(
id_item_order BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
fk_id_product INT NOT NULL,
fk_id_order BIGINT UNSIGNED NOT NULL,
qtd INT NOT NULL,
FOREIGN KEY (fk_id_product) REFERENCES tb_product(product_id),
FOREIGN KEY (fk_id_order) REFERENCES tb_order(id_order)
);