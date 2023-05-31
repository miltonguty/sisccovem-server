/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
export const get = async (filter) => {
  let filterObject = {}
  if (filter) {
    filterObject = {
      where: filter
    }
  }
  const users = await prisma.users.findMany(filterObject);
  const result = users.map(item =>
  ({
    id: item.useId,
    name: item.useName,
    email: item.useEmail,
    comId: item.useComId
  }))
  return result;

};
export const getById = async (useId) => {

  const comId = GetCompanyIdByUser()
  let result = null
  if (useId) {
    const user = await prisma.users.findFirst({
      where: { useId: useId, useComId: comId },
    });
    result = {
      id: user.useId,
      name: user.useName,
      email: user.useEmail,
      comId: user.useComId
    }
  }
  return result;
};
export const add = async ({ name, email, comId }) => {

  //const { name, email, comId } = req.body;
  const user = await prisma.users.create({
    data: { useName: name, useEmail: email, useComId: comId },
  });
  return user;

};
export const update = async ({ id, name, email, comId }) => {

  //const { id, name, email, comId } = req.body;
  const userUpdate = await prisma.users.update({
    where: { useId: id },
    data: { useName: name, useEmail: email, useComId: comId },
  });
  return userUpdate;

};
export const remove = async (useId) => {
  //const { useId } = req.query;
  const userDelete = await prisma.users.delete({
    where: { useId: useId },
  });
  return userDelete;

};
