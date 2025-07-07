-- SQL script to update budgetMaandBedrag = 0 where periode.periodeStartDatum = periode.periodeEindDatum (= openingsperiode)

UPDATE saldo
SET budget_maand_bedrag = 0
WHERE periode_id IN (
    SELECT id
    FROM periode
    WHERE periode_start_datum = periode_eind_datum
);
