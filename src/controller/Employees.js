/*** CONTROLLER*/
import { FALSE, TRUE } from "../constants.js";
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
export const get = async ({ firstName, lastName, email, phone, pageSize, page }, currentUserId) => {
  const comId = GetEmpresaIdByUser(currentUserId)
  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      empDeleted: FALSE,
      empComId: comId
    }
  }
  const orConditions = []
  if (firstName) {
    orConditions.push(
      {
        empFirstName: {
          contains: firstName,
        }
      })
  }

  if (lastName) {
    orConditions.push(
      {
        empLastName: {
          contains: lastName,
        }
      })
  }
  if (email) {
    orConditions.push(
      {
        empEmail: {
          contains: email,
        }
      }
    )
  } if (phone) {
    orConditions.push(
      {
        empPhone: {
          contains: phone,
        }
      }
    )
  }

  if (orConditions.length > 0) {
    filter.where.OR = orConditions
  }


  const employees = await prisma.employees.findMany(filter);
  const result = employees.map(item =>
  ({
    id: item.empKey,
    firstName: item.empFirstName,
    lastName: item.empLastName,
    email: item.empEmail,
    phone: item.empPhone,
    salary: item.empSalary,
    comId: item.empComId,
  }))
  return result

};
export const getById = async (key, ignoreDeleted = FALSE, currentUserId) => {
  let result = null
  if (key) {
    const comId = GetEmpresaIdByUser()
    let where = {}
    if (ignoreDeleted) {
      where = {
        empKey: key,
        empComId: comId
      }
    } else {
      where = {
        empKey: key,
        empComId: comId,
        empDeleted: FALSE
      }
    }
    const Employee = await prisma.employees.findFirst({
      where: where
    });
    result = {
      id: Employee.empKey,
      firstName: Employee.empFirstName,
      lastName: Employee.empLastName,
      email: Employee.empEmail,
      phone: Employee.empPhone,
      salary: Employee.empSalary,
      comId: Employee.empComId,
    }
  }
  return result;

};
export const add = async ({ firstName, lastName, email, phone, salary }, currentUserId) => {

  const comId = GetEmpresaIdByUser()

  const Employee = await prisma.employees.create({
    data: {
      empFirstName: firstName, empLastName: lastName, empEmail: email,
      empPhone: phone, empSalary: Number(salary), empComId: comId
    },
  });
  const employeeResult = await getById(Employee.empKey)
  return employeeResult;

};
export const update = async ({ id, firstName, lastName, email, phone, salary }, currentUserId) => {

  const EmployeeUpdate = await prisma.employees.updateMany({
    where: { empKey: id },
    data: {
      empFirstName: firstName, empLastName: lastName, empEmail: email,
      empPhone: phone, empSalary: Number(salary)
    },
  });
  const employeeResult = await getById(EmployeeUpdate.empKey)
  return employeeResult;

};
export const remove = async (empKey, currentUserId) => {
  const EmployeeDelete = await prisma.employees.updateMany({
    where: { empKey: empKey }, data: {
      empDeleted: TRUE
    }
  });
  const employeeResult = await getById(empKey, TRUE)
  return employeeResult;

};
