-- Fix column type
ALTER TABLE "ReplicationOutbox" ALTER COLUMN "SourceSite" TYPE VARCHAR(20);
-- Re-import ReplicationOutbox (clear first then reimport from HADONG)
DELETE FROM "ReplicationOutbox";
INSERT INTO "ReplicationOutbox" ("EntityType", "EntityId", "Operation", "Payload", "SourceSite", "TargetSite", "Status", "RetryCount", "LastError", "CreatedAt", "UpdatedAt", "ProcessedAt")
SELECT "EntityType", "EntityId", "Operation", "Payload", "SourceSite", "TargetSite", "Status", "RetryCount", "LastError", "CreatedAt", "UpdatedAt", "ProcessedAt"
FROM dblink('host=postgres_hadong port=5432 dbname=csdlpt_hadong user=csdlpt_user password=csdlpt_pass',
            $q$SELECT "EntityType", "EntityId", "Operation", "Payload", "SourceSite", "TargetSite", "Status", "RetryCount", "LastError", "CreatedAt", "UpdatedAt", "ProcessedAt" FROM "ReplicationOutbox"$q$)
AS t("EntityType" VARCHAR, "EntityId" VARCHAR, "Operation" VARCHAR, "Payload" TEXT, "SourceSite" VARCHAR, "TargetSite" VARCHAR, "Status" VARCHAR, "RetryCount" INT, "LastError" TEXT, "CreatedAt" TIMESTAMP, "UpdatedAt" TIMESTAMP, "ProcessedAt" TIMESTAMP);
