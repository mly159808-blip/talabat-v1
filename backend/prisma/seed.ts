import { PrismaClient } from "@prisma/client";
import bcrypt from "bcryptjs";
const db=new PrismaClient();
async function main(){
 const password=await bcrypt.hash("Admin12345!",12);
 await db.user.upsert({where:{phone:"01000000000"},update:{},create:{name:"Admin",phone:"01000000000",password,role:"ADMIN"}});
 for(const name of ["مطاعم","سوبر ماركت","حلويات","متاجر"]){
  const cat=await db.category.create({data:{name}});
  await db.product.createMany({data:[{name:`${name} - منتج 1`,description:"منتج تجريبي",price:50,categoryId:cat.id},{name:`${name} - منتج 2`,description:"منتج تجريبي",price:75,categoryId:cat.id}]});
 }
 await db.adConfig.createMany({data:[{type:"BANNER",placement:"HOME",frequency:1},{type:"INTERSTITIAL",placement:"AFTER_ORDER",frequency:3}]});
}
main().finally(()=>db.$disconnect());
