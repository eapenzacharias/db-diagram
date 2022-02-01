CREATE TABLE patients (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(50),
  date_of_birth date
);

CREATE TABLE medical_histories (
  id int GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id int REFERENCES patients(id),
  status varchar(10)
);

CREATE TABLE invoices (
  id int GENERATED ALWAYS AS IDENTITY, 
  total_amount int, 
  generated_at timestamp, 
  payed_at timestamp,
  medical_history_id int REFERENCES medical_histories(id)
);

CREATE TABLE treatments (
  id int GENERATED ALWAYS AS IDENTITY,
  type varchar,
  name varchar
);

