ALTER TABLE "postgres1-has-one-json$dev"."User" ALTER COLUMN "meta" SET DATA TYPE JSONB USING "meta"::TEXT::JSONB;
ALTER TABLE "postgres1-has-one-json$dev"."User" ADD COLUMN "profileId" CHARACTER VARYING(25) unique;
UPDATE "postgres1-has-one-json$dev"."User" SET "profileId" = "postgres1-has-one-json$dev"."_ProfileToUser"."A" FROM "postgres1-has-one-json$dev"."_ProfileToUser" WHERE "postgres1-has-one-json$dev"."_ProfileToUser"."B" = "postgres1-has-one-json$dev"."User"."id";
ALTER TABLE "postgres1-has-one-json$dev"."User" ALTER COLUMN "profileId" set NOT NULL;
ALTER TABLE "postgres1-has-one-json$dev"."User" ADD FOREIGN KEY ("profileId") REFERENCES "postgres1-has-one-json$dev"."Profile"("id");
DROP TABLE "postgres1-has-one-json$dev"."_ProfileToUser";