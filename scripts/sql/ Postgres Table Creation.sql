CREATE TABLE ai_job_risk_analysis.survey_data (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    job_title VARCHAR(100),
    industry VARCHAR(100),
    ai_replacement_risk INT,
    salary INT,
    years_of_experience INT,
    city VARCHAR(100),
    ai_tool_threat VARCHAR(100)
);