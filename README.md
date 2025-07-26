# Insurance Claims Data Analysis

## 📌 Description
This project analyzes an insurance dataset to explore how demographics, car attributes, and household factors influence claim frequency and amount. Using SQL and Python, it answers 10 key business questions to uncover patterns in claim behavior across income, age, car type, location, and more.

📂 **Data Source**:  
[Google Drive Folder](https://drive.google.com/drive/folders/1QQnDuhuRDSm4ReYiLlzJP9y-71V31hoY)

---

## 📊 Tools Used
- **SQL (MySQL Workbench)** – For data cleaning and structured queries  
- **Python (Jupyter Notebook)** – For encoding, visualization, and correlation analysis  
- **Seaborn & Matplotlib** – For creating insightful plots  
- **Pandas** – For data manipulation and preprocessing  

---

## ⚙️ Setup Process

### 🗃 SQL Table Creation and Cleaning

```sql
CREATE DATABASE insurance;

CREATE TABLE insurance_policy; -- (Imported using Export Wizard)

SELECT * FROM insurance_policies;

RENAME TABLE `copy_of_insurance_policies` TO insurance_policies;

ALTER TABLE insurance_policies
CHANGE `ï»¿ID` id VARCHAR(20);

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

-- Data cleaning: remove currency symbols and convert income & claim amount to FLOAT
UPDATE insurance_policies
SET household_income = REPLACE(REPLACE(household_income, '$', ''), ',', '');

ALTER TABLE insurance_policies
MODIFY household_income FLOAT;

UPDATE insurance_policies
SET claim_amt = REPLACE(REPLACE(claim_amt, '$', ''), ',', '');

ALTER TABLE insurance_policies
MODIFY claim_amt FLOAT;
📈 Analysis Questions & Insights
Claim Frequency by Demographics
✅ Used age_group, gender, and marital_status to analyze patterns.

Impact of Education on Claim Amount
✅ Encoded education levels in Python and compared average claims.

Coverage Zone vs Claim Frequency
✅ Rural vs Urban impact on frequency of insurance claims.

Income vs Claim Behavior
✅ Checked correlation & plotted graphs with claim_amt and claim_freq.

Car Use (Private vs Commercial)
✅ Compared how car purpose affects average claim data.

Kids Driving Effect
✅ Explored kids_driving impact using boxplots and correlation.

Car Make & Claim Amount
✅ Identified car brands with highest and lowest average claims.

Car Age & Claim Patterns
✅ Looked at how car_year impacts both claim_freq and claim_amt.

Car Color Analysis
✅ Visualized claims per color — which car colors incur higher costs?

Household Income & Coverage Zone
✅ Checked if richer individuals live in Highly Urban zones and how that ties to claims.

🧠 Python Highlights
python
Copy
Edit
# Encoding education levels
df['education_level_encoded'] = df['education'].map(
    {'High School': 0, 'Bachelors': 1, 'Masters': 2, 'PhD': 3}
)

# Assign age group
def assign_age_group(age):
    if pd.isnull(age):
        return 'Unknown'
    elif age >= 70:
        return '70+'
    elif age >= 60:
        return '60s'
    elif age >= 50:
        return '50s'
    elif age >= 40:
        return '40s'
    elif age >= 30:
        return '30s'
    elif age >= 20:
        return '20s'
    else:
        return 'Below 20'

df['age_group'] = df['age'].apply(assign_age_group)

# Cleaning & Conversion
df['claim_amt'] = df['claim_amt'].replace('[\$,]', '', regex=True).astype(float)
df['household_income'] = df['household_income'].replace('[\$,]', '', regex=True).astype(float)

# Correlation examples
df[['car_year', 'claim_amt', 'claim_freq']].corr()
df[['kids_driving', 'claim_amt', 'claim_freq']].corr()
📊 Sample Visuals Created
Claim amount by car color

Claim amount by coverage zone

Boxplots of kids driving vs claim amount

Heatmaps of correlations

📎 Summary
This project reveals deep insights into insurance claims by examining:

How income and education relate to claim behavior

Which demographics and vehicle types pose higher risks

Regional (coverage zone) trends in claim patterns









