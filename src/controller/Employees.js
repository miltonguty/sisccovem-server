/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
import { GetEmpresaIdByUser } from "../lib/utils.js";
export const get = async ({ firstName, lastName, email, phone, pageSize, page }) => {



  let filter = {
    skip: Number(page * pageSize),
    take: Number(pageSize),
    where: {
      empDeleted: 0
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
    id: item.empId,
    firstName: item.empFirstName,
    lastName: item.empLastName,
    email: item.empEmail,
    phone: item.empPhone,
    salary: item.empSalary,
    comId: item.empComId,
  }))
  return result

};
export const getById = async (empId) => {
  let result = null
  if (empId) {
    const comId = GetEmpresaIdByUser()
    const Employee = await prisma.employees.findFirst({
      where: {
        empId: Number(empId),
        empComId: comId
      },
    });
    result = {
      id: Employee.empId,
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
export const add = async ({ firstName, lastName, email, phone, salary }) => {

  const comId = GetEmpresaIdByUser()

  const Employee = await prisma.employees.create({
    data: {
      empFirstName: firstName, empLastName: lastName, empEmail: email,
      empPhone: phone, empSalary: Number(salary), empComId: comId
    },
  });
  return Employee;

};
export const update = async ({ id, firstName, lastName, email, phone, salary }) => {

  const EmployeeUpdate = await prisma.employees.update({
    where: { empId: Number(id) },
    data: {
      empFirstName: firstName, empLastName: lastName, empEmail: email,
      empPhone: phone, empSalary: Number(salary)
    },
  });
  return EmployeeUpdate;

};
export const remove = async (req, res) => {
  const { empId } = req.query;
  const EmployeeDelete = await prisma.employees.delete({
    where: { empId: Number(empId) },
  });
  return EmployeeDelete;

};
