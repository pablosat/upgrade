CREATE TYPE "postgres-alias$dev"."Role" AS ENUM ('ADMIN', 'CUSTOMER');
ALTER TABLE "postgres-alias$dev"."User" ALTER COLUMN "role" SET DATA TYPE "postgres-alias$dev"."Role" using "role"::"postgres-alias$dev"."Role";
ALTER TABLE "postgres-alias$dev"."User" ALTER COLUMN "jsonData" SET DATA TYPE JSONB USING "jsonData"::TEXT::JSONB;
ALTER TABLE "postgres-alias$dev"."Post" ALTER COLUMN "createdAt" SET DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE "postgres-alias$dev"."Post" ALTER COLUMN "published" SET DEFAULT false;
ALTER TABLE "postgres-alias$dev"."Profile" ADD UNIQUE ("user");