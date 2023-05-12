/*** CONTROLLER*/
import prisma from "../lib/prisma";
export const get = async (req, res) => {

  const { filter } = req.query;
  let filterObject = {}

  if (filter) {
    filterObject = {
      where: {
        useName: {
          contains: filter,
        },
      }
    }
  };

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
export const getById = async (req, res) => {
  const { useId } = req.query;
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
export const add = async (req, res) => {

  const { name, email, comId } = req.body;
  const user = await prisma.users.create({
    data: { useName: name, useEmail: email, useComId: comId },
  });
  return user;

};
export const update = async (req, res) => {

  const { id, name, email, comId } = req.body;
  const userUpdate = await prisma.users.update({
    where: { useId: id },
    data: { useName: name, useEmail: email, useComId: comId },
  });
  return userUpdate;

};
export const remove = async (req, res) => {
  const { useId } = req.query;
  const userDelete = await prisma.users.delete({
    where: { useId: useId },
  });
  return userDelete;

};
