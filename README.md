# طلبات V1 — Full Starter

نسخة V1 قابلة للتشغيل محلياً، وليست مفاتيح إنتاج جاهزة.
المكونات:
- Flutter Android/iOS
- Node.js + Express + Prisma + PostgreSQL
- React/Vite Admin
- JWT authentication
- Categories / products / cart / orders
- Admin CRUD basics
- AdMob Banner + Interstitial
- Docker Compose

## تشغيل Backend
1. ثبّت Node.js 24+.
2. `cd backend`
3. `npm install`
4. انسخ `.env.example` إلى `.env`
5. `docker compose up -d`
6. `npx prisma migrate dev --name init`
7. `npm run seed`
8. `npm run dev`

API: http://localhost:4000

## تشغيل Admin
`cd admin && npm install && npm run dev`

## تشغيل Flutter
أنشئ مشروع Flutter فارغ: `flutter create mobile` ثم انسخ مجلد `lib` و `pubspec.yaml` من هذا المشروع. بعدها `flutter pub get` و `flutter run`.

قبل النشر:
- غيّر API_BASE_URL.
- ضع AdMob App IDs وAd Unit IDs الحقيقية.
- أضف سياسات الخصوصية والموافقة على الإعلانات حسب الأسواق المستهدفة.
- استخدم HTTPS.
- غيّر JWT_SECRET وكلمات المرور.
