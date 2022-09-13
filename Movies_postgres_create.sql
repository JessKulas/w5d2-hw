CREATE TABLE "public.customer" (
	"customer_id" serial NOT NULL,
	"ticket_id" integer NOT NULL,
	"payment" varchar(255) NOT NULL,
	CONSTRAINT "customer_pk" PRIMARY KEY ("customer_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ticket" (
	"ticket_id" serial NOT NULL,
	"ticket_cost" money NOT NULL,
	"movie_id" integer NOT NULL,
	"show_time" integer NOT NULL,
	CONSTRAINT "ticket_pk" PRIMARY KEY ("ticket_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.concession" (
	"con_id" serial NOT NULL,
	"customer_id" integer NOT NULL,
	"food_drink" varchar(255) NOT NULL,
	"price" money NOT NULL,
	CONSTRAINT "concession_pk" PRIMARY KEY ("con_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.movie" (
	"movie_id" serial NOT NULL,
	"title" varchar(255) NOT NULL,
	"description" varchar(255) NOT NULL,
	"show_time" TIME NOT NULL,
	CONSTRAINT "movie_pk" PRIMARY KEY ("movie_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.theatre" (
	"theatre_id" serial NOT NULL,
	"movie_id" integer NOT NULL,
	"ticket_id" integer NOT NULL,
	"theatre_number" varchar(255) NOT NULL,
	CONSTRAINT "theatre_pk" PRIMARY KEY ("theatre_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "customer" ADD CONSTRAINT "customer_fk0" FOREIGN KEY ("ticket_id") REFERENCES "ticket"("ticket_id");

ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk0" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id");
ALTER TABLE "ticket" ADD CONSTRAINT "ticket_fk1" FOREIGN KEY ("show_time") REFERENCES "movie"("show_time");

ALTER TABLE "concession" ADD CONSTRAINT "concession_fk0" FOREIGN KEY ("customer_id") REFERENCES "customer"("customer_id");


ALTER TABLE "theatre" ADD CONSTRAINT "theatre_fk0" FOREIGN KEY ("movie_id") REFERENCES "movie"("movie_id");
ALTER TABLE "theatre" ADD CONSTRAINT "theatre_fk1" FOREIGN KEY ("ticket_id") REFERENCES "ticket"("ticket_id");






