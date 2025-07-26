create database insurance;

create table insurance_policy;
select * from insurance_policies; 
SELECT * FROM insurance22.`copy of insurance policies`;
RENAME TABLE `copy_of_insurance_policies` TO insurance_policies;
select * from insurance_policies;

ALTER TABLE insurance_policies
CHANGE `ï»¿ID` id VARCHAR(20);

select age from insurance_policies;
ALTER TABLE insurance_policies
ADD COLUMN age_group VARCHAR(10);
UPDATE insurance_policies
SET age_group = CASE 
  WHEN age >= 70 THEN '70+'
  WHEN age >= 60 THEN '60s'
  WHEN age >= 50 THEN '50s'
  WHEN age >= 40 THEN '40s'
  WHEN age >= 30 THEN '30s'
  WHEN age >= 20 THEN '20s'
  ELSE 'Below 20'
END;
SET SQL_SAFE_UPDATES = 0;


SELECT gender, 
  AVG(claim_freq) AS average_claim_frequency 
FROM insurance_policies
GROUP BY  gender
ORDER BY gender;
SELECT 
  age_group
  ,AVG(claim_freq) AS average_claim_frequency 
FROM insurance_policies
GROUP BY age_group
ORDER BY age_group;

SELECT 
  marital_status, 
  AVG(claim_freq) AS average_claim_frequency 
FROM insurance_policies
GROUP BY marital_status
ORDER BY marital_status;



select coverage_zone, sum(claim_freq)
from insurance_policies
group by coverage_zone
order by coverage_zone;

SELECT claim_freq, avg(household_income)
from insurance_policies
group by claim_freq
order by claim_freq;

SELECT claim_freq, avg(claim_amt)
from insurance_policies
group by claim_freq
order by claim_freq;

UPDATE insurance_policies
SET household_income = REPLACE(REPLACE(household_income, '$', ''), ',', '');
ALTER TABLE insurance_policies
MODIFY household_income FLOAT;

uPDATE insurance_policies
SET claim_amt = REPLACE(REPLACE(claim_amt, '$', ''), ',', '');
ALTER TABLE insurance_policies
MODIFY claim_amt FLOAT;

select car_use, avg(claim_freq),  avg(claim_amt) as average_claim_amt  
from insurance_policies
group by car_use
order by car_use;


select car_make,  avg(claim_amt) as average_claim_amt 
 
from insurance_policies
group by car_make
order by average_claim_amt 
;
select car_year, avg(claim_freq),avg(claim_amt) as average_claim_amt 
from insurance_policies
group by car_year
order by average_claim_amt  asc;

select car_color,avg(claim_amt) as average_claim_amt 
from insurance_policies
group by car_color
order by average_claim_amt  asc;

select coverage_zone,avg(household_income) as average_household_amt,avg(claim_freq), avg(claim_amt) as average_claim_amt 
from insurance_policies
group by coverage_zone
order by average_claim_amt  asc;