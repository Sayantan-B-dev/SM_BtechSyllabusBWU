// Insert
db.employees.insertOne({
 _id: 101,
 EmpName: "Alice",
 Salary: 30000,
 Dept: { DeptID: 1, DeptName: "HR" },
 Skills: ["Communication", "Recruitment"],
 JoinDate: ISODate("2023-01-15")
});

// Query: Find all employees in HR department
db.employees.find({ "Dept.DeptName": "HR" });

// Query: Find employees earning > 40000
db.employees.find({ Salary: { $gt: 40000 } });

// Update: Increase salary of EmpID 101 by 2000
db.employees.updateOne(
 { _id: 101 },
 { $inc: { Salary: 2000 } }
);

// Delete: Remove an employee
db.employees.deleteOne({ _id: 101 });
