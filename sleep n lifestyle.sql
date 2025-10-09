---Sleep Metrics by Occupation
SELECT
    "Occupation",
    AVG("Sleep_Duration") AS "Average_Sleep_Duration",
    AVG("Quality_of_Sleep") AS "Average_Sleep_Quality"
FROM
    sleep_lifestyle
GROUP BY
    "Occupation"
ORDER BY
    "Average_Sleep_Quality" DESC;
---Count of People by Sleep Disorder
SELECT
    "Sleep_Disorder",
    COUNT("Person_ID") AS "Number_of_People"
FROM
    sleep_lifestyle
GROUP BY
    "Sleep_Disorder"
HAVING
    "Sleep_Disorder" IS NOT NULL;
---Average Heart Rate by BMI Category
SELECT
    "BMI_Category",
    AVG("Heart_Rate") AS "Average_Heart_Rate"
FROM
    sleep_lifestyle
GROUP BY
    "BMI_Category"
ORDER BY
    "Average_Heart_Rate" DESC;
---Resilient Sleepers (High Stress, High Quality Sleep)
SELECT
    "Person_ID",
    "Occupation",
    "Stress_Level",
    "Quality_of_Sleep"
FROM
    sleep_lifestyle
WHERE
    "Stress_Level" >= 7 AND "Quality_of_Sleep" >= 8;
---Stress Levels Across Different Age Groups
SELECT
    CASE
        WHEN "Age" <= 35 THEN 'Young Adult (<=35)'
        WHEN "Age" > 35 AND "Age" <= 50 THEN 'Middle-Aged (36-50)'
        ELSE 'Senior (>50)'
    END AS "Age_Group",
    COUNT("Person_ID") AS "Number_of_People",
    AVG("Stress_Level") AS "Average_Stress_Level"
FROM
    sleep_lifestyle
GROUP BY
    "Age_Group"
ORDER BY
    "Age_Group";
---Physical Activity Extremes by Occupation
SELECT
    "Occupation",
    MAX("Daily_Steps") AS "Max_Daily_Steps",
    MIN("Daily_Steps") AS "Min_Daily_Steps"
FROM
    sleep_lifestyle
GROUP BY
    "Occupation"
ORDER BY
    "Max_Daily_Steps" DESC;
---Analysis of Overweight Individuals with Low Stress
SELECT
    AVG("Quality_of_Sleep") AS "Average_Sleep_Quality",
    AVG("Physical_Activity_Level") AS "Average_Activity_Level"
FROM
    sleep_lifestyle
WHERE
    "BMI_Category" = 'Overweight' AND "Stress_Level" < 5;