/*** CONTROLLER*/
import prisma from "../lib/prisma.js";
import { GetCompanyIdByUser } from "../lib/utils.js";
export const get = async (req, res) =>
{

  const { filter } = req.query;
  let filterObject = {}
  const comId = GetCompanyIdByUser()
  if (filter)
  {
    filterObject = {
      where: {
        empName: {
          contains: filter,
        },
        empComId: comId


      }
    }
  };

  const employees = await prisma.employees.findMany(filterObject);
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
export const getById = async (req, res) =>
{
  const { empId } = req.query;
  const result = null
  if (empId)
  {
    const comId = GetCompanyIdByUser()
    const Employee = await prisma.employees.findFirst({
      where: {
        empId: empId,
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
export const add = async (req, res) =>
{
  const { firstName, lastName, email, phone, salary } = req.body;
  const comId = GetCompanyIdByUser()
  const Employee = await prisma.employees.create({
    data: {
      empFirstName: firstName, empLastName: lastName, empEmail: email,
      empPhone: phone, empSalary: salary, empComId: comId
    },
  });
  return Employee;

};
export const update = async (req, res) =>
{
  const { id, firstName, lastName, email, phone, salary } = req.body;
  const EmployeeUpdate = await prisma.employees.update({
    where: { empId: id },
    data: {
      empFirstName: firstName, empLastName: lastName, empEmail: email,
      empPhone: phone, empSalary: salary
    },
  });
  return EmployeeUpdate;

};
export const remove = async (req, res) =>
{
  const { empId } = req.query;
  const EmployeeDelete = await prisma.employees.delete({
    where: { empId: empId },
  });
  return EmployeeDelete;

};
