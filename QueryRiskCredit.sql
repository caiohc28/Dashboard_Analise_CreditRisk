-- HEAD DO DATASET
SELECT TOP 10 * FROM dbo.credit_risk_dataset;


-- TAXA DE INADIMPLENCIA POR FINALIDADE DO EMPRESTIMO
SELECT
    loan_intent,
    COUNT(*) AS total_emprestimos,
    ROUND(
        AVG(CAST(loan_status AS FLOAT)) * 100,
        2
    ) AS taxa_inadimplencia
FROM dbo.credit_risk_dataset
GROUP BY loan_intent
ORDER BY taxa_inadimplencia DESC;


-- VALOR EM RISCO POR CLASSIFICACAO DE CREDITO
SELECT
    loan_grade,
    SUM(CASE WHEN loan_status = 1 THEN loan_amnt ELSE 0 END) AS valor_em_risco
FROM dbo.credit_risk_dataset
GROUP BY loan_grade
ORDER BY loan_grade;


-- TAXA DE INADIMPLENCIA POR FINALIDADE DO EMPRESTIMO E CLASSIFICACAO DE CREDITO
SELECT
    loan_intent,
    loan_grade,
    ROUND(
        AVG(CAST(loan_status AS FLOAT)) * 100,
        2
    ) AS taxa_inadimplencia
FROM dbo.credit_risk_dataset
GROUP BY loan_intent, loan_grade
ORDER BY loan_intent, loan_grade;


-- TAXA DE JUROS E COMPROMETIMENTO DA RENDA POR CLASSIFICACAO DE CREDITO E STATUS DA INADIMPLENCIA
SELECT
    loan_grade,
    loan_status,
    ROUND(AVG(loan_int_rate), 2) AS taxa_juros_media,
    ROUND(AVG(loan_percent_income), 2) AS renda_comprometida_media
FROM dbo.credit_risk_dataset
GROUP BY loan_grade, loan_status
ORDER BY loan_grade, loan_status;