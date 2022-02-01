CREATE TABLE patients (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name varchar(50),
  date_of_birth date
);

CREATE TABLE medical_histories (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id int REFERENCES patients(id),
  status varchar(10)
);

CREATE INDEX ON "medical_histories" (patient_id);

CREATE TABLE invoices (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
  total_amount int, 
  generated_at timestamp, 
  payed_at timestamp,
  medical_history_id int REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type varchar,
  name varchar
);

CREATE TABLE invoice_items (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
  unit_price decimal, 
  quantity int, 
  total_price decimal,
  invoice_id int REFERENCES invoices(id),
  treatment_id int REFERENCES treatments(id)
);



CREATE TABLE treatments_history (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY, 
  treatment_id int REFERENCES treatments(id),
  medical_history_id int REFERENCES medical_histories(id)
);
