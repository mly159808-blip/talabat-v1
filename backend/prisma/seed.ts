import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";

const db = new PrismaClient();

async function main() {
  const password = await bcrypt.hash("Admin12345!", 12);
  await db.user.upsert({
    where: { phone: "01000000000" },
    update: {},
    create: { name: "Admin", phone: "01000000000", password, role: "ADMIN" },
  });

  for (const name of ["مطاعم", "سوبر ماركت", "حلويات", "متاجر"]) {
    const cat = await db.category.upsert({
      where: { name },
      update: { active: true },
      create: { name },
    });

    const products = [
      { name: `${name} - منتج 1`, price: 50 },
      { name: `${name} - منتج 2`, price: 75 },
    ];

    for (const product of products) {
      const existing = await db.product.findFirst({
        where: { name: product.name, categoryId: cat.id },
      });
      if (!existing) {
        await db.product.create({
          data: {
            name: product.name,
            description: "منتج تجريبي",
            price: product.price,
            categoryId: cat.id,
          },
        });
      }
    }
  }

  const ads = [
    { type: "BANNER" as const, placement: "HOME", frequency: 1 },
    { type: "INTERSTITIAL" as const, placement: "AFTER_ORDER", frequency: 3 },
  ];

  for (const ad of ads) {
    const existing = await db.adConfig.findFirst({
      where: { type: ad.type, placement: ad.placement },
    });
    if (!existing) await db.adConfig.create({ data: ad });
  }
}

main()
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  })
  .finally(() => db.$disconnect());
