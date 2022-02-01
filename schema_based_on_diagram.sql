CREATE TABLE patients (
  id int GENERATED ALWAYS AS IDENTITY,
  name varchar(50),
  date_of_birth date
)

CREATE TABLE medical_histories (
  id int GENERATED ALWAYS AS IDENTITY,
  admitted_at timestamp,
  patient_id int REFERENCES patients(id),
  status varchar(10)
)
