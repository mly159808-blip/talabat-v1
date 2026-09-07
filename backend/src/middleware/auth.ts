import jwt from "jsonwebtoken";
import {Request,Response,NextFunction} from "express";
const secret=process.env.JWT_SECRET||"dev-secret";
export type AuthRequest=Request & {user?:{id:string,role:string}};
export function auth(req:AuthRequest,res:Response,next:NextFunction){
 const h=req.headers.authorization;
 if(!h?.startsWith("Bearer ")) return res.status(401).json({message:"غير مصرح"});
 try{req.user=jwt.verify(h.slice(7),secret) as {id:string,role:string};next();}catch{return res.status(401).json({message:"الجلسة غير صالحة"});}
}
export function admin(req:AuthRequest,res:Response,next:NextFunction){if(req.user?.role!=="ADMIN")return res.status(403).json({message:"للمدير فقط"});next();}
