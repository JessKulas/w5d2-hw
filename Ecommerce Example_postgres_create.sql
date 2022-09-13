CREATE TABLE "public.customer" (
	"customer_id" serial NOT NULL,
	"first_name" varchar(255) NOT NULL,
	"last_name" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL,
	"billing_info" varchar(255) NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.product" (
	"product_id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" varchar(1020) NOT NULL,
	"price" money NOT NULL,
	CONSTRAINT "product_pk" PRIMARY KEY ("product_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.seller" (
	"seller_id" serial NOT NULL,
	"name" varchar(255) NOT NULL,
	"address" varchar(255) NOT NULL,
	"contact_number" varchar(255) NOT NULL,
	CONSTRAINT "seller_pk" PRIMARY KEY ("seller_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.inventory" (
	"inventory_id" serial NOT NULL,
	"product_id" integer NOT NULL,
	"seller_id" integer NOT NULL,
	"stock_qty" integer NOT NULL,
	CONSTRAINT "inventory_pk" PRIMARY KEY ("inventory_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cart" (
	"cart_id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	CONSTRAINT "cart_pk" PRIMARY KEY ("cart_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.order" (
	"order_id" serial NOT NULL,
	"cart_id" integer NOT NULL,
	"total" money NOT NULL,
	"order_date" DATE NOT NULL,
	CONSTRAINT "order_pk" PRIMARY KEY ("order_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.cart_item" (
	"cart_item_id" serial NOT NULL,
	"cart_id" integer NOT NULL,
	"product_id" integer NOT NULL,
	"quantity" integer NOT NULL,
	CONSTRAINT "cart_item_pk" PRIMARY KEY ("cart_item_id")
) WITH (
  OIDS=FALSE
);






ALTER TABLE "inventory" ADD CONSTRAINT "inventory_fk0" FOREIGN KEY ("product_id") REFERENCES "product"("product_id");
ALTER TABLE "inventory" ADD CONSTRAINT "inventory_fk1" FOREIGN KEY ("seller_id") REFERENCES "seller"("seller_id");

ALTER TABLE "cart" ADD CONSTRAINT "cart_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");

ALTER TABLE "order" ADD CONSTRAINT "order_fk0" FOREIGN KEY ("cart_id") REFERENCES "cart"("cart_id");

ALTER TABLE "cart_item" ADD CONSTRAINT "cart_item_fk0" FOREIGN KEY ("cart_id") REFERENCES "cart"("cart_id");
ALTER TABLE "cart_item" ADD CONSTRAINT "cart_item_fk1" FOREIGN KEY ("product_id") REFERENCES "product"("product_id");








