DELIMITER $$
USE conquest_db $$
CREATE TRIGGER UPDATE_STOCK
	AFTER INSERT
	ON tb_order_item FOR EACH ROW
BEGIN
	IF NEW.qtd > 0 OR NEW.qtd <> NULL THEN
		UPDATE tb_product SET product_quantity = (product_quantity - NEW.qtd) WHERE product_id = NEW.fk_id_product;
	END IF;
END$$